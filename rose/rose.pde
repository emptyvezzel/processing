// made by Jack Murphy / emptyvezzel

float d = 8;
float n = 5;
float q = 0;
int timer;
float t = 0.001;
int shrinkOrGrow = 1;

void setup() {
  size(1000, 1000);
}

void draw() {
  float k = n / d;
  background(#FC4040);
  translate(width / 2, height / 2);

  beginShape();
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
