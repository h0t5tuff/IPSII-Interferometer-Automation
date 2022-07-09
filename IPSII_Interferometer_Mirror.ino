#include <SoftwareSerial.h>
#include <ArduinoBlue.h>
#define DIR 5  //stepper on 5 and 6
#define PUL 6
SoftwareSerial bluetooth(7, 8); //rx,tx
ArduinoBlue phone(bluetooth);
boolean Dir = LOW;

void isr1() {Dir = !Dir;} // Interrupts
void isr2() {Dir = !Dir;}

void setup() {
  Serial.begin(9600);
  bluetooth.begin(9600); delay(100);
  pinMode(DIR,OUTPUT); 
  pinMode(PUL,OUTPUT);
  pinMode(3, INPUT_PULLUP); //hall sensors on 3 and 4
  pinMode(4, INPUT_PULLUP);
  delay(2000);
  attachInterrupt(digitalPinToInterrupt(3), isr1, FALLING);  //attach Interrupt(hall sensor, ISR, pin changed from high to low) "new"
  attachInterrupt(digitalPinToInterrupt(4), isr2, FALLING); 
}

void loop() {
  digitalWrite(DIR,!Dir);
  int button = phone.getButton();
  if (button == 0) {if (Dir) {digitalWrite(DIR, LOW); Dir = false;}
  else {digitalWrite(DIR, HIGH); Dir = true;} }
    digitalWrite(PUL,HIGH); delayMicroseconds(4000);
    digitalWrite(PUL,LOW); delayMicroseconds(4000);
}

/*
#define En 12
#define Step 10
#define Dir 11
 
void setup() {
  for( byte x=12;x>=10; pinMode(x--,OUTPUT) );
  for( byte x=6;x>=3; pinMode(x--,INPUT) );
  for( byte x=6;x>=3; digitalWrite(x--,HIGH) );
}

void fwd(int steps){
  digitalWrite(En,LOW);
  digitalWrite(Dir,HIGH);
  for(int i=0;i<steps; i++){
    digitalWrite(Step,HIGH); delay(5);
    digitalWrite(Step,LOW); delay(5);
  } digitalWrite(En,HIGH);
}

void rvs(int steps){
  digitalWrite(En,LOW);
  digitalWrite(Dir,LOW);
  for(int i=0;i<steps; i++){
    digitalWrite(Step,HIGH); delay(5);
    digitalWrite(Step,LOW); delay(5);
  } digitalWrite(En,HIGH);
} 

void loop() {
  int hm = digitalRead(3);
  int fw = digitalRead(4);
  int rv = digitalRead(5);
  int bk = digitalRead(6);
  delay(20);
  if (fw == 1 and rv != 1 and hm != 0) { fwd(5); delay(50); }
  else if (rv == 1 and fw != 1 and bk != 0) { rvs(5); delay(50); }
  else if (hm == 0){ digitalWrite(En, HIGH); }
  else if (bk == 0) { digitalWrite(En, HIGH); }
}
*/
