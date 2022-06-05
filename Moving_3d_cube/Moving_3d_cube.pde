import processing.opengl.*;

float add = 0;

void setup() {
noStroke();
smooth();
frameRate(60);
size(600, 600, OPENGL); // or P3D
}



void draw() {
  background(0);
  fill(59, 215, 234);
  lights();
  add+=0.1;
  pushMatrix();
  translate(mouseX, mouseY);
  rotateX(mouseX*0.01);
  rotateY(mouseY*0.01);
  box(150);
  popMatrix();
}