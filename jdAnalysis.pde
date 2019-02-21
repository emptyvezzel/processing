// made by Jack Murphy / emptyvezzel

import ddf.minim.*;
Minim minim;
AudioInput in;
void setup() {
  size(500, 500, P3D);  
  minim = new Minim(this);
  in = minim.getLineIn();
}
void draw() {
  background(0); 
  stroke(255);
  strokeWeight(0.2);
  for (int j = 0; j < 500; j+=5) {
    for (int i = 1; i < 250; i++) {
      line(i + j, 0 + in.left.get(i)*50 + j, i+1 + j, 0 + in.left.get(i+1)*50 + j);
      line(0 + in.left.get(i)*50 + j, i + j, 0 + in.left.get(i+1)*50 + j, i+1 + j);
      line(i - j, 500 + in.left.get(i)*50 - j, i+1 - j, 500 + in.left.get(i+1)*50 - j);
      line(500 + in.left.get(i)*50 - j, i - j, 500 + in.left.get(i+1)*50 - j, i+1 - j);
    }
  }
}