import ddf.minim.*; //<>// //<>// //<>//
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import java.util.*;

int timemin, timesec;
int position;
int loop;
PFont font;
PImage Pause, Play, mutey, muten, prev, next, cam;
int lengthmin, lengthsec;
boolean isMute = false;
boolean prevClick = false;
boolean nextClick = false;
boolean pause = false;
boolean pauseOver = false;
int count = 0;

Minim mim;
FFT fft; // Fast Fourier Transform
AudioPlayer Player;
AudioMetaData data;
BeatDetect beat;
float rad;

void setup() {
  size(1280, 720, OPENGL); // Width, Height, 3D using OPENGL
  background(#F0ECDF);
  noStroke();
  rectMode(CENTER);
  font = createFont("ALIN_KID.ttf", 16, true); // gets Font
  mim = new Minim(this); // Creates new Minim
  Player = mim.loadFile("Ballin' - Logic.mp3"); // Upload to hitlers.kz song
  fft = new FFT (Player.bufferSize(), Player.sampleRate()); // Finds how long bufferSize is and collects sample rate
  Player.play(); // Play
  beat = new BeatDetect();
  System.out.println("Sucessfully Loaded file from " + Player.getMetaData().fileName());
  System.out.println("Length Of " + + lengthmin + "m" + lengthsec + "s");
  cam = loadImage("cam.png");
  prev = loadImage("rewind_icon.png");
  next = loadImage("skip_icon.png");
  mutey = loadImage("mutey.jpg");
  muten = loadImage("muten.jpg"); 
  Pause = loadImage("pause_icon.png"); // Load pause img
  Play = loadImage("play_icon.png"); // Load play img
  ellipseMode(RADIUS);
  rad = 20;
}

void draw() {
  //frameRate(12); // debug
  //println(mouseX + " : " + mouseY); // debug
  background(#F0ECDF);
  Buttons();
  Skip();
  Text(); // runs void Text
  Spectrum(); // runs void Spectrum
  Beat(); // runs void Beat
  image(cam,1220, 153);
  if (!isMute) {
    image(muten, 1230, 120);
  } else {
    image(mutey, 1230, 120);
  } 
  if (!pause) { // if pause isn't true
    image(Pause, 600, 50); // set image to pause
  } else { // or 
    image(Play, 600, 50); // set image to play
  }
}
//------------------------------------------------------------\\
void keyPressed() {  
  if ( key == 'P'|| key == 'p' || key == ' ') { // If P or p or SPACE is pressed pause  or unpause
    if ( Player.isPlaying() ) { // if the player is playing
      Player.pause(); // pause
      pause = true; // and set pause to true
    } else { // or 
      Player.play(); // play
      pause = false; // and set pause to false
    }
  } 
  if ( key == 'M' || key == 'm') {
    if (Player.isMuted()) { 
      Player.unmute();
      isMute = false;
    } else { 
      Player.mute();
      isMute = true;
    }
  }
  if (key == 'S' || key == 's') {
  Screenshot();
  }
}
//------------------------------------------------------------\\
void Text() {
  lengthmin = (Player.getMetaData().length()/1000)/60; // get length in Mins
  lengthsec = (Player.getMetaData().length()/1000)-(lengthmin * 60); // get length in Secs
  timemin = ((Player.position() / 1000)/60); // get position in mins
  timesec = ((Player.position() / 1000)-(timemin * 60)); // get position in secs

  textFont(font); // load font for following text
  text(Player.getMetaData().title() + " - "+Player.getMetaData().author(), 500, 50);
  text(lengthmin + ":" + lengthsec,1240,50);
  text(timemin +":"+ timesec, 10, 50);
}
//------------------------------------------------------------\\
void Spectrum() {
  // Draws Spectrum, as vert lines. Multiplies by 4 for better visibility.
  fft.forward(Player.mix); // Get's Spectrum
  stroke(#000000); // R, G, B
  for (int i = 0; i < fft.specSize(); i++) {
    line(i*2, height, i*2, height - fft.getBand(i)*4); // Draw lines
  }
}

void Beat() {
  // Draws ball that expands to beat
  beat.detect(Player.mix);
  float a = map(rad, 20, 80, 60, 255);
  fill(237, 0, a);
  stroke(209, 67, a);
  if ( beat.isOnset() ) rad = 80;
  ellipse(1280, 720, rad, rad);
  rad *= 0.95;
  if ( rad < 20 ) rad = 20;
}
//------------------------------------------------------------\\
void mousePressed() {
  Screenshot();
  Pause();
  Mute();
  if (mouseY > 10 && mouseY < 30) {
  int position = int( map( mouseX, 0, width, 0, Player.length() ) );
  Player.cue( position );
}
}
//------------------------------------------------------------\\
void Pause() {
  if (mouseX > 611 && mouseX < 650 && mouseY > 57 && mouseY < 95) {
    if (Player.isPlaying()) {
      Player.pause();
      pause = true;
    } else {
      Player.play();
      pause = false;
    }
  }
}
void Buttons() {
  fill(0);
  rect(1250, 200, 70, 200, 7);
}
void Skip() {
rect(650,20,1300,20);
  stroke(255,0,0);
  float position = map( Player.position(), 0, Player.length(), 0, width );
  line( position, 10, position, 30 );
} 
void Mute() {
  if (mouseX > 1230 && mouseX < 1264 && mouseY > 118 && mouseY < 151) {
    if (Player.isMuted()) {
      Player.unmute();
      isMute = false;
    } else {
      Player.mute();
      isMute = true;
    }
  }
}

void Screenshot() {
  if (mouseX > 1230 && mouseX < 1264 && mouseY > 153 && mouseY < 204)
saveFrame("screenShots/screen###.jpg");
System.out.println("Screenshot saved.");
}
//------------------------------------------------------------\\
void stop() {
  Player.close();
  mim.stop();
  super.stop();
}