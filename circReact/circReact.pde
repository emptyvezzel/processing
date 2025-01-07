int amt = 1000;
float rad = 300;
int size = 2;
int test;

import ddf.minim.*;
Minim minim;
AudioInput in;

void setup() {
  size(800, 800);
  background(0);
  noStroke();
  fill(255, 150);
}

void draw() {
  size = 2;
  test = 3;
  translate(width / 2, height / 2);
  float angleStep = TWO_PI / amt;
  for (int i = 0; i < amt; i++) {
    float angle = i * angleStep;
    float x = cos(angle) * rad;
    float y = sin(angle) * rad;
    ellipse(x+test, y+test, size, size);
  }
}
