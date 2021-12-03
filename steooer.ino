//Infrometer Mirror driven by stepper motor controlled by Bluetoth and two Hall Sensors
#include <SoftwareSerial.h>
#include <ArduinoBlue.h>
#define DIR 10
#define PUL 11
boolean Dir = LOW;
const int BLUETOOTH_TX_PIN = 8;
const int BLUETOOTH_RX_PIN = 7;
SoftwareSerial bluetooth(BLUETOOTH_TX_PIN, BLUETOOTH_RX_PIN);
ArduinoBlue phone(bluetooth);
int button;

void homefunction() {
  while (digitalRead(2) == HIGH) {
    digitalWrite(DIR, Dir);
    digitalWrite(PUL, HIGH);
    delayMicroseconds(4000);
    Serial.println("Homing1");
    digitalWrite(PUL, LOW);
    delayMicroseconds(4000);
    Serial.println("Homing2");
  }
}

void isr1() {Dir = !Dir;} // Interrupt Service Routine
void isr2() {Dir = !Dir;}

void setup() {
   Serial.begin(9600);
  bluetooth.begin(9600);
  delay(100);
  pinMode(DIR,OUTPUT); 
  pinMode(PUL,OUTPUT);
  pinMode(2, INPUT_PULLUP);
  pinMode(3, INPUT_PULLUP);
  homefunction();
  delay(2000);
  attachInterrupt(digitalPinToInterrupt(2), isr1, FALLING);  //attach Interrupt(sensor1, ISR, pin changed from high to low) "new"
  attachInterrupt(digitalPinToInterrupt(3), isr2, FALLING); 
}

void loop() {
  digitalWrite(DIR,!Dir);
  button = phone.getButton();
  if (button == 0) {if (Dir) {digitalWrite(DIR, LOW); Dir = false;}
    else {digitalWrite(DIR, HIGH); Dir = true;}
  }
    
    digitalWrite(PUL,HIGH);
    delayMicroseconds(4000);
     Serial.println("loop1");
    digitalWrite(PUL,LOW);
    delayMicroseconds(4000);
    Serial.println("loop2");
}
