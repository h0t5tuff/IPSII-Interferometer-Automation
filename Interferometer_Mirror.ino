#include <SoftwareSerial.h>
#include <ArduinoBlue.h>
#define DIR 10
#define PUL 11
boolean Dir = LOW;
SoftwareSerial bluetooth(7, 8); //rx,tx
ArduinoBlue phone(bluetooth);
int button;

void homefunction() {
  while (digitalRead(2) == HIGH) {
    digitalWrite(DIR, Dir);
    digitalWrite(PUL, HIGH); delayMicroseconds(4000);
    digitalWrite(PUL, LOW); delayMicroseconds(4000); }
}

void isr1() {Dir = !Dir;} // Interrupt
void isr2() {Dir = !Dir;}

void setup() {
  Serial.begin(9600);
  bluetooth.begin(9600); delay(100);
  pinMode(DIR,OUTPUT); 
  pinMode(PUL,OUTPUT);
  pinMode(2, INPUT_PULLUP); //hall sensors on 2 and 3
  pinMode(3, INPUT_PULLUP);
  //homefunction();
  delay(2000);
  attachInterrupt(digitalPinToInterrupt(2), isr1, FALLING);  //attach Interrupt(hall sensor, ISR, pin changed from high to low) "new"
  attachInterrupt(digitalPinToInterrupt(3), isr2, FALLING); 
}

void loop() {
  digitalWrite(DIR,!Dir);
  button = phone.getButton();
  if (button == 0) {if (Dir) {digitalWrite(DIR, LOW); Dir = false;}
  else {digitalWrite(DIR, HIGH); Dir = true;} }
    digitalWrite(PUL,HIGH); delayMicroseconds(4000);
    digitalWrite(PUL,LOW); delayMicroseconds(4000);
}
