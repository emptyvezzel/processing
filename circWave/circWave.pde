float t = 0;
import ddf.minim.*;
Minim minim;
AudioInput in;
int sensitivity = 50;
float sinAdd;
float cosAdd;

void setup() {
  size(800, 800);
  noStroke();
  colorMode(HSB);
  minim = new Minim(this);
  in = minim.getLineIn();
}

void draw() {
  //background(0);
  sensitivity = 1000;
  for (int x = -400; x < width + 400; x += 10) {
    for (int y = -400; y < height + 400; y += 10) {
      float r = sin(t + x * 0.01) * 127 + 128;
      float g = sin(t + y * 0.01) * 127 + 128;
      float b = sin(t + x * 0.01 + y * 0.01) * 127 + 128;
      fill(r, g, b);
      ellipse(x + sin(t + y * (0.05 + sinAdd)) * 50, 
      y + cos(t + x * (0.05 + cosAdd)) * 5, 62, 10);
    }
  }
  t += 0.02;
  sinAdd += 0.0003;
  cosAdd += 0.0001;
}
