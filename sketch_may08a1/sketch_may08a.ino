int lm35 = A0;

void setup() {

  Serial.begin(9600);
}

void loop() {

  int analogVal;
  float temp;

  analogVal = analogRead(lm35);

  temp = float(analogVal) / 1023;
  temp = temp * 500;

  Serial.print("Temprature in Celcius ");
  Serial.print(temp);
  Serial.print("\n");

  delay(1000);
}
