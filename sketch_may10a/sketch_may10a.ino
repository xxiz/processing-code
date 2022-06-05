int echoPin = 4;
int trigPin = 5;

void setup() {
  Serial.begin(9600);
  pinMode(echoPin, INPUT);
  pinMode(trigPin, OUTPUT);
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

  Serial.println(distanceCentimeters);

  delay(100);
}

