float plusRotate = 0;
int startVal = 200;
boolean growVal = false;

void setup() {
  size(1000, 1000);
  background(255);
  rectMode(CENTER);
  smooth();
}

void draw() {
  startVal = 700;
  plusRotate += 0.50;
  strokeWeight(2.0);
  //circle 1
  if (growVal == false) {
    pushMatrix();
    stroke(0);
  } else {
    pushMatrix();
    stroke(random(0, 255), random(0, 255), random(0, 255));
  }
  noFill();
  translate(250, 250);
  rotate(plusRotate);
  rect(0, 0, startVal - plusRotate, startVal - plusRotate);
  popMatrix();
  //circle 2
  if (growVal == false) {
    pushMatrix();
    stroke(0);
  } else {
    pushMatrix();
    stroke(random(0, 255), random(0, 255), random(0, 255));
  }
  noFill();
  translate(750, 250);
  rotate(plusRotate);
  rect(0, 0, startVal - plusRotate, startVal - plusRotate);
  popMatrix();
  //circle 3
  if (growVal == false) {
    pushMatrix();
    stroke(0);
  } else {
    pushMatrix();
    stroke(random(0, 255), random(0, 255), random(0, 255));
  }
  noFill();
  translate(250, 750);
  rotate(plusRotate);
  rect(0, 0, startVal - plusRotate, startVal - plusRotate);
  popMatrix();
  //circle 4
  if (growVal == false) {
    pushMatrix();
    stroke(0);
  } else {
    pushMatrix();
    stroke(random(0, 255), random(0, 255), random(0, 255));
  }
  noFill();
  translate(750, 750);
  rotate(plusRotate);
  rect(0, 0, startVal - plusRotate, startVal - plusRotate);
  popMatrix();
  if (startVal - plusRotate <= 0)
    growVal = true;
  if (startVal - plusRotate <= -550) {
    plusRotate = 0;
    growVal = false;
  }
  System.out.println(startVal - plusRotate);
}

void keyPressed(){
  if(key == ' ') background(255);
}