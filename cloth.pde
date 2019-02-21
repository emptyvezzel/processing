// made by Jack Murphy / emptyvezzel

float colVal;
float rotVal = 1.0;
boolean rectShrinking = true;
float subVal = 0.0;
int minVal;
int maxVal;

void setup() {
  size(1000, 1000);
  smooth();
  rectMode(CENTER);
  shapeMode(CENTER);
  background(0);
  colorMode(HSB);
}

void draw() {
  //background(0);
  //color changer
  if (colVal >= 255) colVal = 0;
  else colVal++;

  //triangle stuff
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(frameCount)*rotVal);
  noFill();
  stroke(colVal, 255, 255);
  beginShape(TRIANGLES);
  vertex(133+subVal, 100+subVal);
  vertex(0, -166-(subVal*1.33));
  vertex(-133-subVal, 100+subVal);
  endShape();
  popMatrix();

  //shrinking conditionals
  if (rectShrinking == true) subVal+=5;
  else subVal-=5;
  if (subVal >= 800 - minVal) rectShrinking = false;
  if (subVal <= -900 + maxVal) rectShrinking = true;
}