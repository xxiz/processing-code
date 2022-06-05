PFont font;
// The font must be located in the sketch's 
// "data" directory to load successfully
void setup(){
  size(600,200);
  font = loadFont("Castellar-48.vlw");
  textFont(font, 48);
  background(240);
}

void draw(){
  noFill();
  ellipse(width/2,height/2,100,100);
  triangle(300,45,350,125,250,125);
  
  arc(width/2,height/2+10,55,55,radians(210),radians(330));
  arc(width/2,height/2-5,25,25,0-QUARTER_PI,PI+QUARTER_PI);
  fill(0);
  textAlign(CENTER);
  text("Illuminati", width/2, height/2+20);
}