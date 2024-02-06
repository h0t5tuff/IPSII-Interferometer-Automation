const int LEDG = 2;
const int LEDR = 3;
const int LEDS[6] = {5,6,7,8,12,13};

const int PWMR = 10;
const int PWMG = 11;
const int PWMB = 9;

const int Enc1 = A0;
const int Enc2 = A1;
const int Buttons = A2;
const int PSV = A3;
// A4 and A5 used for i2c
const int IHigh = A6;
const int ILow = A7;

const float R = 10.0;


//const int breakpoints[7] = {60,162,248,351,505,812,2000};
const int breakpoints[7] = {105, 190, 277, 394, 587, 1008, 2000};
const int stepcolors[6][3] = {{255,0,0},{255,60,0},{255,180,0},{0,255,0},{0,255,255},{150,0,255}};
//const int encoderbreakpoints[4] = {102,272,375,500};
const int encoderbreakpoints[4] = {190, 326, 394, 2000};

int chan = 0;
int buttonpressed = 0;
int aval,i,j;
int stepsize = 0;
int enc1step = 0;
int enc2step = 0;
float I;

void increasestepsize(int increase){
  if(increase > 0){
    stepsize += 1;
    if(stepsize > 5){
      stepsize = 0;
    }
  }
  else{
    stepsize -= 1;
    if(stepsize < 0){
      stepsize = 5;
    }
  }
  analogWrite(PWMR,stepcolors[stepsize][0]/3);
  analogWrite(PWMG,stepcolors[stepsize][1]/3);
  analogWrite(PWMB,stepcolors[stepsize][2]/3);
}

void increasechan(int increase){
  digitalWrite(LEDS[chan-1],HIGH);
  if(increase > 0){
    chan += 1;
    if(chan > 6){
      chan = 1;
    }
  }
  else{
    chan -= 1;
    if(chan < 1){
      chan = 6;
    }
  }
  digitalWrite(LEDS[chan-1],LOW);
}

void setup() {
  Serial.begin(9600);
  pinMode(LEDG,OUTPUT);
  pinMode(LEDR,OUTPUT);
  for(i = 0; i < 6; i++){
    pinMode(LEDS[i],OUTPUT);
  }
  pinMode(PWMR,OUTPUT);
  pinMode(PWMG,OUTPUT);
  pinMode(PWMB,OUTPUT);
  
  for(i=0; i < 6; i++){
    digitalWrite(LEDS[i],HIGH);
  }
/*
  for(i = 0; i < 6; i++){
    digitalWrite(LEDS[i],LOW);
    for(j = 0; j < 4; j++){
      digitalWrite(LEDG,j%2);
      digitalWrite(LEDR,1-j%2);

      switch(j){
        case 0 : analogWrite(PWMR,255); analogWrite(PWMG,0); analogWrite(PWMB,0); break;
        case 1 : analogWrite(PWMR,0); analogWrite(PWMG,255); analogWrite(PWMB,0); break;
        case 2 : analogWrite(PWMR,0); analogWrite(PWMG,0); analogWrite(PWMB,255); break;
        case 3 : analogWrite(PWMR,255); analogWrite(PWMG,255); analogWrite(PWMB,255); break;
      }
      delay(80);
    } 
    digitalWrite(LEDS[i],HIGH); 
  }
*/  
  
  digitalWrite(LEDG,LOW);
  digitalWrite(LEDR,LOW);
  stepsize = -1;
  increasestepsize(1);
}

void loop() {
  
  // check i2c
  aval = analogRead(A4);
  aval = analogRead(A5);
  // check current to caps
  aval = analogRead(IHigh);
  aval = analogRead(ILow);
  // check ps voltage
  aval = analogRead(PSV);
  if(aval*50.0/1023.0 < 20){
    digitalWrite(LEDR,HIGH);
    //Serial.println("Low Voltage");
  }
  else{
    digitalWrite(LEDR,LOW);
    //Serial.println("Adequate Voltage");
  }
  // check if capacitor is charged
  I = (5.0*(analogRead(IHigh)-analogRead(ILow)))/1023.0/R;
  if(I >= 0 and I < 0.01 ){
    digitalWrite(LEDG,HIGH);
  }
  else{
    digitalWrite(LEDG,LOW);
  }

  
  
  // check encoder 1
  aval = analogRead(Enc1);
  if(aval < encoderbreakpoints[0]){
    enc1step = 0;
  }
  else if(enc1step == 0){
    for(i=1; i < 4; i++){
      if(aval < encoderbreakpoints[i]){
        enc1step = i;
        if(enc1step == 1){
          Serial.println("Enc1 +");
          increasechan(1);
        }
        else if(enc1step == 3){
          Serial.println("Enc1 -");
          increasechan(-1);
        }
        break;
      }
    }
  }

  // check encoder 2
  aval = analogRead(Enc2);
  if(aval < encoderbreakpoints[0]){
    enc2step = 0;
  }
  else if(enc2step == 0){  
    for(i=1; i < 4; i++){
      if(aval < encoderbreakpoints[i]){
        enc2step = i;
        if(enc2step == 1){
          increasechan(1);
          Serial.println("Enc2 +");
        }
        else if(enc2step == 3){
          increasechan(-11);
          Serial.println("Enc2 -");
        }
        break;
      }
    }
  }


  // check buttons
  aval = analogRead(Buttons);
  //Serial.println(aval);
  for(i=0; i < 7; i++){
    if(aval < breakpoints[i]){
      if(i == 0){
        buttonpressed = 0;
      }
      if((i != 0) && (buttonpressed == 0)){
        buttonpressed = 1;
        if(i == chan){
          increasestepsize(1);
        }
        else{
          Serial.print("Button ");
          Serial.print(i);
          Serial.println(" pressed.");
          chan = i;
          for(j=0; j < 6; j++){
            digitalWrite(LEDS[j],HIGH);
          }
          digitalWrite(LEDS[i-1],LOW);
        }
      }
      break;
    }
  } 
}

