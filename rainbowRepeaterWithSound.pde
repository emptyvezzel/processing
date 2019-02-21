// made by Jack Murphy / emptyvezzel

import processing.sound.*;

AudioIn input;
Amplitude loudness;

int startVal = 0;
int drawVal = 0;
int strokeVal = 1;
int ellGrow0 = 0;
int ellGrow1 = 0;
int ellGrow2 = 0;
int ellGrow3 = 0;
int ellGrow4 = 0;
int ellGrow5 = 0;
int displacement0 = 0;
int displacement1 = 80;
int displacement2 = 160;
int displacement3 = 240;
int displacement4 = 320;
int displacement5 = 400;
float bigVar = 1;
boolean stopVal = true;

void setup() {
  size(800, 800);
  input = new AudioIn(this, 0);
  input.start();
  loudness = new Amplitude(this);
  loudness.input(input);
}

void draw() {
  float inputLevel = map(mouseY, 0, height, 1.0, 0.0);
  input.amp(inputLevel);
  float volume = loudness.analyze();
  float bigVar = 1.9;
  int size = int(map(volume, 0, 0.5, 1, 350));
  
  int topVal = 480;
  int incVal = 3;
  noCursor();
  if(drawVal % 2 == 0) background(0);
  if (stopVal == true) {
    ellGrow0 += incVal;
    ellGrow1 += incVal;
    ellGrow2 += incVal;
    ellGrow3 += incVal;
    ellGrow4 += incVal;
    ellGrow5 += incVal;
    if (ellGrow0 + startVal + displacement0 >= topVal) ellGrow0 = 0;
    if (ellGrow1 + startVal + displacement1 >= topVal) {
      ellGrow1 = 0;
      displacement1 = 0;
    }
    if (ellGrow2 + startVal + displacement2 >= topVal) {
      ellGrow2 = 0;
      displacement2 = 0;
    }
    if (ellGrow3 + startVal + displacement3 >= topVal) {
      ellGrow3 = 0;
      displacement3 = 0;
    }
    if (ellGrow4 + startVal + displacement4 >= topVal) {
      ellGrow4 = 0;
      displacement4 = 0;
    }
    if (ellGrow5 + startVal + displacement5 >= topVal) {
      ellGrow5 = 0;
      displacement5 = 0;
    }
  }
  noFill();
  strokeWeight(strokeVal);
  //red
  stroke(255, 0, 0);
  ellipse(width/2, height/2, startVal + displacement0 + ellGrow0 + size*bigVar, startVal + displacement0 + ellGrow0 + size*bigVar);
  //orange
  stroke(255, 127, 0);
  ellipse(width/2, height/2, startVal + displacement1 + ellGrow1 + size*bigVar, startVal + displacement1 + ellGrow1 + size*bigVar);
  //yellow
  stroke(255, 255, 0);
  ellipse(width/2, height/2, startVal + displacement2 + ellGrow2 + size*bigVar, startVal + displacement2 + ellGrow2 + size*bigVar);
  //green
  stroke(0, 255, 0);
  ellipse(width/2, height/2, startVal + displacement3 + ellGrow3 + size*bigVar, startVal + displacement3 + ellGrow3 + size*bigVar);
  //blue
  stroke(0, 0, 255);
  ellipse(width/2, height/2, startVal + displacement4 + ellGrow4 + size*bigVar, startVal + displacement4 + ellGrow4 + size*bigVar);
  //violet
  stroke(139, 0, 255);
  ellipse(width/2, height/2, startVal + displacement5 + ellGrow5 + size*bigVar, startVal + displacement5 + ellGrow5 + size*bigVar);
}

void mousePressed() {
  stopVal = false;
}

void mouseReleased() {
  stopVal = true;
}

void keyPressed() {
  if(key == 'b') drawVal += 1;
  if(key == ','){
    if(strokeVal >= 3)
      strokeVal -= 3;
  }
  if(key == '.') strokeVal += 3;
}