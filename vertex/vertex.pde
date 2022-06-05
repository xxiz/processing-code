void setup(){ // Uses timeline method
size(700,700);
background(222, 23, 51);

}



void draw(){
  fill(0);
  beginShape();
  vertex(20, 20);
  vertex(15, 20);
  vertex(67, 58);
  vertex(64, 67);
  vertex(200, mouseX);
  endShape();
}