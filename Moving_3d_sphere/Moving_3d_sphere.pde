import processing.opengl.*;

float inc = 0.0;

void setup() {
noStroke();
smooth();
size(900, 900, OPENGL);
}



void draw() {
  background(0);
  fill(59, 215, 234);
  lights();
  inc+=0.1;
pushMatrix();
translate(width/2, height/2);
rotateX(mouseX*0.01);
rotateY(mouseY*0.01);
stroke(255);
sphere(280);
popMatrix();
}