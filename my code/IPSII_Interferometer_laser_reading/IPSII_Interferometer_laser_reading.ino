int sensor = A0; //Pulldouwn(ground) resistor 40KOhm with A0 
const int N = 500; //was 500
unsigned long next_time;
unsigned long dt = 1;
int data[N];
//float data[N];
//int t_data[N];
int t_data[N];
int i;

void setup() {
  Serial.begin(1000000);
  pinMode(sensor, INPUT);
  analogReference(INTERNAL); //built-in reference 1.1 v on nano (very sensitive)
  next_time = millis()+dt;
  i = 0; 
}
void loop() {
  int sensorVal=analogRead(sensor);
   if (millis() >= next_time) { data[i] = sensorVal; t_data[i] = next_time; i++; next_time += dt; }
   if (i >= N) { for (i=0; i<N; i++) { Serial.println(data[i]); } i = 0; }
   Serial.println(sensorVal);
}
