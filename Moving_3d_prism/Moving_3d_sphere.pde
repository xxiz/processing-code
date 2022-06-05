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
rotateX(mouseY*0.01);
rotateY(mouseX*0.01);
stroke(59, 215, 234);
beginShape();
vertex(-100, -100, -100);
vertex( 100, -100, -100);
vertex(   0,    0,  100);

vertex( 100, -100, -100);
vertex( 100,  100, -100);
vertex(   0,    0,  100);

vertex( 100, 100, -100);
vertex(-100, 100, -100);
vertex(   0,   0,  100);

vertex(-100,  100, -100);
vertex(-100, -100, -100);
vertex(   0,    0,  100);
endShape();
popMatrix();
}