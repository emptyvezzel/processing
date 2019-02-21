// made by Jack Murphy / emptyvezzel

import processing.opengl.*;
float inc = 0;
float colVal;
int n = 150;
int q;
int boxVal = 1;
int fillVal = 1;
int sphereDet = 3;
boolean nInc = true;
String meaning = "big\nnone Thing";
PFont f;

void setup(){
  size(1000, 1000, OPENGL);
  colorMode(HSB);
  f = createFont("Georgia", 64);
}

void draw(){
  background(0);
  textAlign(CENTER);
  textFont(f);
  q = n/3;
  if(q == 0) q = 1;
  textSize(q);
  fill(colVal, 255, 255);
  text(meaning, width/2, height/2);
  if(sphereDet < 2) sphereDet = 2;
  lights();
  inc+=0.030;
  pushMatrix();
  translate(width/2, height/2);
  rotateX(inc);
  rotateY(inc);
  if(nInc == true) n++;
  else n--;
  if(n == 255) nInc = false;
  if(n == 0) nInc = true; 
  if(fillVal % 2 == 0){
    noFill(); 
    stroke(colVal, 255, 255);
  }
  else{
    fill(colVal, 255, 255);
    noStroke();
  }
  if(colVal >= 255) colVal = 0;
  else colVal++;
  if(boxVal % 2 == 0) box(n*2);
  else {
    sphereDetail(sphereDet);
    sphere(n*2);
  }
  popMatrix();
}

void keyPressed(){
  if(keyCode == ' ') boxVal++;
  if(keyCode == UP) sphereDet++;
  if(keyCode == DOWN) sphereDet--;
  if(key == 'x') fillVal++;
}