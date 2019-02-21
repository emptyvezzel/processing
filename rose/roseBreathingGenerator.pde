float d = 3;
float n = 2;
float q = 0;
int gVal = 64;
int bVal = 64;
float angleR = 0.0001;
int timer;
float t = 0.001;
int shrinkOrGrow = 1;
int shrinkOrGrow1 = 1;

void setup() {
  size(1000, 1000);
}

void draw() {

  if (millis() - timer > 800) {

    if (d > 20) {
      shrinkOrGrow1 = 0;
    } else if (d < 6) {
      shrinkOrGrow1 = 1;
    }
    if (shrinkOrGrow1 == 1) {
      d += 2;
      n += 2;
      gVal += 9;
      bVal += 9;
    } else if (shrinkOrGrow1 == 0) {
      d -= 2;  
      n -= 2;
      gVal -= 9;
      bVal -= 9;
    }
    timer = millis();
  }

  if (q > 230) {
    shrinkOrGrow = 0;
  } else if (q < 0) {
    shrinkOrGrow = 1;
  }
  if (shrinkOrGrow == 1) {
    q += 3;
    t += 0.001;
  } else if (shrinkOrGrow == 0) {
    q -= 3;  
    t += 0.001;
  }

  float k = n / d;
  background(252, gVal, bVal);
  translate(width / 2, height / 2);

  beginShape();
  angleR += 0.005;
  rotate(angleR);
  stroke(0);
  noFill();
  strokeWeight(2);
  for (float a = 0; a < TWO_PI * d; a += 0.020) {
    float r = 200 * cos(k * a) + q;
    float x = r * cos(a) + 0;
    float y = r * sin(a) + 0;
    vertex(x, y);
  }
  endShape(CLOSE);
}