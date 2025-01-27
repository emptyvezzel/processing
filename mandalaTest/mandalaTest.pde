int numLayers = 6;
int shapesPerLayer = 12;
float maxRadius, angleOffset, time;
int spikeDir = 1;
float shapeSpike = 1.0;
float spikeSpeed = 0.01;
float radius = 10;
float offSet = 180;
float colVal;
int val = 5;

void setup() {
  size(800, 800);
  maxRadius = width * 0.4;
  angleOffset = PI / 180;
  colorMode(HSB);
  noFill();
  strokeWeight(2);
}

void draw() {
  background(255);
  translate(width / 2, height / 2);
  numLayers = 16;
  shapesPerLayer = 30;
  maxRadius = width * 0.7;
  angleOffset = PI / offSet; //180
  offSet += 0.1;
  radius = 10;
  //time = 0;
  spikeSpeed = 0.01;
  colVal += 1;
  shapeSpike += spikeSpeed*spikeDir;
  if(shapeSpike > 3 || shapeSpike < -2) spikeDir *= -1;
  for (int layer = 0; layer < numLayers; layer++) {
    float layerRadius = map(layer, 0, numLayers - 1, 0, maxRadius);
    float speedFactor = sin(time * 0.004 + layer * 0.2) * 0.01;
    float baseRotation = time * 0.01 + layer * angleOffset * 10;

    for (int i = 0; i < shapesPerLayer; i++) {
      float angle = TWO_PI / shapesPerLayer * i + baseRotation;
      float x = layerRadius * cos(angle);
      float y = layerRadius * sin(angle);
      pushMatrix();
      translate(x, y);
      rotate(angle + time * speedFactor);
      drawShape(layer * 2 + 3);
      popMatrix();
    }
  }
  time += 0.30;
  val = 5;
}

void drawShape(int numPoints) {
  //float radius = 10;
  beginShape();
  noFill();
  //stroke(colVal%255, 255, 255);
  for (int i = 0; i < numPoints * 2; i++) {
    float angle = PI / numPoints * i;
    float r = (i % 2 == 0) ? radius : radius * shapeSpike;
    float x = r * cos(angle)-val;
    float y = r * sin(angle)-val;
    vertex(x, y);
  }
  endShape(CLOSE);
}
