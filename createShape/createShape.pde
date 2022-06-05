PShape ball; // Creates Shape called ball

float moveX = 0.0;

void setup() {
ball = loadShape("soccer_ball.svg");
}

void draw() {
  shape(ball, 10, 10, 80, 80);
  moveX++;
}