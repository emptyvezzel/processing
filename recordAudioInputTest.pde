// made by Jack Murphy / emptyvezzel

import ddf.minim.*;
import peasy.*;

PeasyCam cam;
Minim minim;
AudioInput in;
AudioRecorder recorder;
int thisCol; 
float randRotate = 0.00000;

void setup() {
  size(1000, 1000, P3D);
  minim = new Minim(this);
  in = minim.getLineIn();
  colorMode(HSB);

  smooth();
  cam = new PeasyCam(this, 0, 0, 0, 0);
  cam.setMinimumDistance(200);
  cam.setMaximumDistance(10000);
}

void draw() {
  background(0); 
  randRotate += .0001;
  // draw the waveforms
  // the values returned by left.get() will be between -1 and 1,
  // so we need to scale them up to see the waveform
  noFill();
  for (int i = 0; i < 200; i++) {
    thisCol = i% 255;
    stroke(thisCol, 255, 255);
    rotate(randRotate);
    box(i+1, 521 + in.left.get(i)*300, 0+i); //413 + in.left.get(i+1)*98);
  }
}