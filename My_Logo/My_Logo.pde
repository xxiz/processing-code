PFont font;
PImage logo;
PImage back;
PFont font1;
int moveX=27;

void setup() {
  size(500, 250);
  smooth();
  font = createFont("SonderSans-BlackRough.otf", 15, true); // Font, size, smooth.
  font1 = createFont("New Walt Disney UI.ttf", 30, true); // Font, size, smooth.
  back = loadImage("background1.jpg"); // load backgorund
  logo = loadImage("logo.jp g"); // load logo
}
void draw() {
  background(back);
  image(logo, 437, 195);
  textFont(font);
  text("Designed by Ashwin.", 0, 250);
  text("IT 10", 410, 250);
  textFont(font1);
  text("Ashwin Charath", moveX, 100);
  moveX++;
  if (moveX >= width) {
    moveX = -190;
  }
}