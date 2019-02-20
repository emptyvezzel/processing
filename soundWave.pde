import ddf.minim.*;
import peasy.*;

PeasyCam cam;
Minim minim;
AudioInput in;
float randRotate = 0.400;
int col = 0;

void setup() {
  size(700, 700, P3D);
  noCursor();
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
  //if(frameCount % 60 == 0)
    randRotate = 1954; //782; //9.4; //0.027630;
  for (int j = 0; j < 19; j++) {
    for (int i = 0; i < 1024 - 1; i++) {
      col = i % 255;
      stroke(col, 255, 255);
      rotate(randRotate);
      line(i, 17 + j + in.left.get(i)*101, i+1, 15 + j + in.left.get(i+1)*100);
    }
  }
}