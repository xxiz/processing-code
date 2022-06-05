#include <LiquidCrystal.h>

int lcdRSP = 12;
int lcdEP = 11;
int lcd4P = 5;
int lcd5P = 4;
int lcd6P = 3;
int lcd7P = 2;

LiquidCrystal lcd(lcdRSP, lcdEP, lcd4P, lcd5P, lcd6P, lcd7P);

int echoPin = 1;
int trigPin = 0;

void setup() {
  Serial.begin(9600);
  pinMode(echoPin, INPUT);
  pinMode(trigPin, OUTPUT);
  lcd.begin(16, 2);
  lcd.print ("test");
}

void loop() {
  float distanceCentimeters;
  int pulseLenMicroseconds;

  digitalWrite(trigPin, LOW);
  delayMicroseconds(20);
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(100);
  digitalWrite(trigPin, LOW);

  pulseLenMicroseconds = pulseIn(echoPin, HIGH);

  distanceCentimeters = pulseLenMicroseconds / 29.387 / 2;
  lcd.setCursor(0, 1);

  lcd.print(distanceCentimeters);

  delay(100);
}

