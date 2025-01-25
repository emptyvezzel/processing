int cols, rows, bgDraw;
float[][] field;
PVector[] particles;
int numParticles = 1000;
float noiseScale = 0.01;
float diffusionRate = 0.05;
color[] palette;
float[] colorOffsets;

void setup() {
  size(800, 800);
  generateParticles();
}

void draw() {
  noiseScale = 0.01;
  diffusionRate = 0.28;
  if(bgDraw % 2 == 0) background(0);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      field[i][j] = noise(i * noiseScale, j * noiseScale, frameCount * noiseScale);
    }
  }
  for (int i = 0; i < numParticles; i++) {
    PVector p = particles[i];
    int x = int(p.x);
    int y = int(p.y);
    float angle = field[x % cols][y % rows] * TWO_PI;
    PVector dir = PVector.fromAngle(angle);
    dir.mult(diffusionRate);
    p.add(dir);
    p.x = (p.x + width) % width;
    p.y = (p.y + height) % height;
    float t = (frameCount * 0.01 + colorOffsets[i]) % 1;
    color c = lerpColor(palette[floor(t * 5) % 5], palette[(floor(t * 5) + 1) % 5], t * 5 % 1);
    fill(c);
    noStroke();
    ellipse(p.x, p.y, 4, 4);
  }
}

void keyPressed(){
  if(key == ' ') bgDraw++;
  if(key == 'b') generateParticles();
}

void generateParticles(){
  cols = width;
  rows = height;
  field = new float[cols][rows];
  particles = new PVector[numParticles];
  palette = new color[5];
  colorOffsets = new float[numParticles];
  for (int i = 0; i < numParticles; i++) {
    particles[i] = new PVector(random(width), random(height));
    colorOffsets[i] = random(1);
  }
  for (int i = 0; i < 5; i++) {
    palette[i] = color(random(255), random(255), random(255));
  }
}
