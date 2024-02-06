/*
 * 
 *   Interface to stepper motors
 * 
 *    Dallin Durfee 2021
 * 
 * 
 *    see 
 *    https://www.instructables.com/Arduino-Timer-Interrupts/
 *    https://diyi0t.com/arduino-interrupts-and-timed-events/
 *    https://piandmore.wordpress.com/2016/09/14/arduino-nano-i2c-slave/
 *    https://learn.sparkfun.com/tutorials/raspberry-pi-spi-and-i2c-tutorial/all
 *    https://raspberrypi.stackexchange.com/questions/43750/how-to-read-data-from-arduino-with-raspberry-pi-via-i2c
 */

#include <EEPROM.h>
#include <Wire.h>

const int i2cID = 9;
const int blocksize = 16;

const int Avin = A7;
const int Agnd = A6;
const int Dgreen = 2;
const int Dred = 3;
const float R = 10.0;

const int Nmotors = 4;

const int DDir[Nmotors] = {4,6,8,10};
const int DPulse[Nmotors] = {5,7,9,11};
const int DEnableA = 12;
const int DEnableB = 13;

long N[Nmotors];
long Nset[Nmotors];

// The number of milliseconds that power must flow in the direction
// from the super capacitors to the Arduino before we decided that
// power has been lost.
const int powerdropT = 3000;
// Will be set to zero to indicate that power is applied
// Will be set to one to indicate that power is flowing from
// the supercapacitors to the Arduio.  If this persists, we will
// assume that power has been lost.
// Will be set to two to indicate that power has been lost and
// we need to clean up and halt until power is restored.
int powerdrop = 0;


// time between steps
float dt = 0.0005;
// counter prescaler
int prescale = 64;
// the state of the built in led
int biledval = 0;


void setup() {
  int i;

  Serial.begin(9600);
  pinMode(Dgreen,OUTPUT);
  pinMode(Dred,OUTPUT);
  pinMode(DEnableA,OUTPUT);
  pinMode(DEnableB,OUTPUT);
  pinMode(LED_BUILTIN,OUTPUT);
  for(i=0; i < Nmotors; i++){
    pinMode(DDir[i],OUTPUT);
    pinMode(DPulse[i],OUTPUT);
    digitalWrite(DDir[i],LOW);
    digitalWrite(DPulse[i],LOW);
  }
  biledval=0;
  EEPROM.get(0,N);
  for(i=0; i < Nmotors; i++){
    Nset[i] = N[i];
  }
  
  // stop interrupts
  cli();
  // zero timer 1 A and B registers
  TCCR1A = 0;
  TCCR1B  = 0;
  // initialize counter to zero
  TCNT1 = 0;
  // Set compare match register for dt increments
  OCR1A = ((16000000.0)*dt*(1.0/prescale) - 1.0);
  // turn on CTC (clear timer on compare) mode
  TCCR1B |= (1 << WGM12);
  // set prescaler to 1024
  TCCR1B |= (1 << CS11) | (1 << CS10);  
  // enable timer compare interrupt
  TIMSK1 |= (1 << OCIE1A);
  sei(); // allow interrupts

  Wire.begin(i2cID);
  Wire.onRequest(requestEvent);
  Wire.onReceive(receiveEvent);

  // Flash the leds 3 times to show that the code has started.
  for(i=0; i < 3; i++){
    digitalWrite(Dgreen, LOW);
    digitalWrite(Dred,LOW);
    delay(200);
    digitalWrite(Dgreen, HIGH);
    digitalWrite(Dred,HIGH);
    delay(200);
  }
  digitalWrite(LED_BUILTIN,LOW);
}



void setStepTime(float dt){
  cli(); // stop interrupts
  OCR1A = ((16000000.0)*dt*(1.0/prescale) - 1.0);
  sei(); // allow interrupts
}

ISR(TIMER1_COMPA_vect){
  int i,movingA,movingB;
 
  if(powerdrop == 0){
    if(biledval == 0){
        digitalWrite(LED_BUILTIN,HIGH);
        biledval = 1;
    }
    else{              
        digitalWrite(LED_BUILTIN,LOW);
        biledval = 0;
    }
    movingA = 0;
    movingB = 0;
    for(i = 0; i < Nmotors; i++){
      if(Nset[i] != N[i]){
          if(i < 2){
            movingA = 1;
          }
          else{
            movingB = 1;
          }
          digitalWrite(DEnable,LOW);
          if(Nset[i] > N[i]){
            digitalWrite(DDir[i],HIGH);
            N[i] += 1;
          }
          else{
            digitalWrite(DDir[i],LOW);
            N[i] -= 1;
          }
          digitalWrite(DPulse[i],HIGH);
      }
    }
    if(movingA == 0){
      digitalWrite(DEnableA,HIGH);
    }
    if(movingB == 0){
      digitalWrite(DEnableB,HIGH);
    }
    for(i = 0; i < Nmotors; i++){
        digitalWrite(DPulse[i],LOW);
    }
  }
}

char com;
int chan;
long val;  
char i2cString[blocksize] = "";
char i2cResponse[blocksize] = "";
int i2cStringi = 0;
int i2cResponsei = 0;
/*
 *   Commands:  G - goto
 *              Z - zero (set current location as zero)
 *              S - set (set zero to value sent)
 *              T - set step time in microseconds (affects all channels)
 *              p - get current position
 *              s - get current setpoint
 *              m - send 0 if the motor is not moving (N=Nset) and 1 otherwise
 *              
 */
void executecommand(char command[]){
  Serial.print("Received command: ");
  com = command[0];
  Serial.print(com);
  chan = command[1];
  Serial.print(" channel: ");
  Serial.print(chan);
  if(command[2] != 0){
    val = atol(&(command[2]));
    Serial.print(" value: ");
    Serial.println(val);
    switch(com){
      case 'G' : Nset[chan] = val; break;
      case 'S' : cli(); Nset[chan] = val; N[chan] = val; sei(); break;
      case 'Z' : cli(); Nset[chan] = 0; N[chan] = 0; sei(); break;  
      case 'T' : setStepTime(val*1.0/1000000); break;
      case 'p' : i2cResponsei = 0; sprintf(i2cResponse,"%ld\n",N[chan]); Serial.print("Sending position: "); break;
      case 's' : i2cResponsei = 0; sprintf(i2cResponse,"%ld\n",Nset[chan]); Serial.print("Sending setpoint: "); break;
      case 'm' : i2cResponsei = 0; if(Nset[chan] == N[chan]){sprintf(i2cResponse,"0\n");} else{sprintf(i2cResponse,"1\n",1);} Serial.print("Sending moving: "); break;    
      default : Serial.print("Command "); Serial.print(com); Serial.println("Not implemented"); break;
    }
  }
  else{
    Serial.println("");
  }
}

void receiveEvent(int count){
  char c;
  while(Wire.available()){
    c = Wire.read();
    /*
    if(c == ' '){
      Serial.print("-");
    }
    else if(c == '\n'){
      Serial.print("N");
    }
    else{
      Serial.print(c);
    }
    */
    i2cString[i2cStringi] = c;
    i2cStringi += 1;
    if(c == '\n'){
      i2cString[i2cStringi-1] = 0;
      i2cStringi = 0;
      //Serial.println(i2cString);
      executecommand(i2cString);
    }
  }
}


void requestEvent(){
  Wire.write(i2cResponse[i2cResponsei]);
  Serial.print(i2cResponse[i2cResponsei]);
  i2cResponsei += 1;
}

int thedir = 1;
float Vin,Vgnd,I;
int charged = 0;
unsigned long powerdroptime;
void loop() {
  /*
  if(Nset[0] == N[0]){
    Nset[0] = 2500*thedir;
    thedir *= -1;
    setStepTime(0.0005+0.0002*thedir);
  }
  */
  // Power Management
  Vin = 0.0;
  Vgnd = 0.0;
  for(int i = 0; i < 10; i++){
    Vin += analogRead(Avin);
    Vgnd += analogRead(Agnd);
  }
  I = (5.0*(Vin-Vgnd)/10.0)/1023.0/R;

  // determine if capacitors are at full charge
  if(I > 0 and I < 0.02 ){
    digitalWrite(Dgreen,HIGH);
  }
  else{
    digitalWrite(Dgreen,LOW);
  }

  // If power is not flowing from capacitors to
  // arduino, then we have external power.
  if(I >= 0){
    powerdrop = 0;
  }

  // If power is flowing backwards, from capacitors
  // to the arduino, we might have lost external
  // power (or the external power voltage may have
  // just temporarily dropped).
  
  if(I < -0.001){
    if(powerdrop){
      if(millis() > powerdroptime + powerdropT){
        powerdrop = 2;
        digitalWrite(Dred,HIGH);
        EEPROM.put(0,N);
      }
    }
    else{
      powerdrop = 1;
      powerdroptime = millis();
    }
  }
  else{
    digitalWrite(Dred,LOW);
    powerdrop = 0;
  }
  

  
}
