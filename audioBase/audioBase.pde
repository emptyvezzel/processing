int lines = 1000;
float audioValue;

// Minim
import ddf.minim.*;
Minim minim;
AudioInput in;
int sensitivity = 50;

void setup(){
  //fullScreen();
  size(800, 800);
  colorMode(HSB);
  
  // Minim setup
  minim = new Minim(this);
  in = minim.getLineIn();
}

void draw(){
  background(0);
  lines = 1000;
  sensitivity = 5000;
  stroke(255);
  for(int i = 0; i < lines; i++){
    audioValue = in.left.get(i%1024) * sensitivity;
    line(i, height/2, i, height/2 - audioValue);
  }
}
