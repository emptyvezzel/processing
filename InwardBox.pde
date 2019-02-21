// made by Jack Murphy / emptyvezzel

float subVal = 0.0;
float speedVal = 0.0;
float colVal;
int rotateVal;
int minVal;
int maxVal;
float rotVal = 1.0;
boolean rectShrinking = true;
boolean textSet = true;
int start = 0;
boolean oneSet = false;
boolean twoSet = false;
boolean threeSet = false;
boolean fourSet = false;
boolean redraw = false;
boolean colTrue = true;
int blank = 0;

void setup() {
  size(1000, 1000);
  smooth();
  rectMode(CENTER);
  shapeMode(CENTER);
  background(0);
  colorMode(HSB);
}

void draw() {
  //for redrawing background when starting program
  if (start == 1) {
    background(0);
    start++;
  }

  //redraw function
  if (redraw == true) {
    background(0);
    redraw = false;
  }

  if (textSet == true) {
    background(0);
    textSize(32);
    textAlign(CENTER);
    text("choose a pattern with any number 1-4\nleft and right arrows for max"+
      "\nup and down arrows for min\nredraw with tab\na and s to control the "+
      "speed of increasing\n< and > to control the speed of rotation\nspace to "+
      "end or restart", 500, 400);
  }

  //color changer
  if (textSet == false) {
    if (colVal >= 255) colVal = 0;
    else colVal++;
  }

  if (oneSet == true) {
    //shape data
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(frameCount)*rotVal);
    noFill();
    stroke(colVal, 255, 255);
    rect(0, 0, 800-subVal, 800-subVal);
    popMatrix();
  }

  if (twoSet == true) {
    //shape data 1
    pushMatrix();
    translate(0, height/2);
    rotate(radians(frameCount)*rotVal);
    noFill();
    stroke(colVal, 255, 255);
    rect(0, 0, 800-subVal, 800-subVal);
    popMatrix();
    //shape data 2
    pushMatrix();
    translate(width/1.0, height/2);
    rotate(radians(frameCount)*rotVal);
    noFill();
    stroke(colVal, 255, 255);
    rect(0, 0, 800-subVal, 800-subVal);
    popMatrix();
  }

  if (threeSet == true) {
    //shape data 1
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(frameCount)*rotVal);
    noFill();
    if(colTrue == true){
      stroke(colVal, 255, 255);
    } else {
      stroke(colVal);
    }
    rect(0, 0, 800-subVal, 800-subVal);
    popMatrix();
    //shape data 2
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(frameCount)*rotVal+180);
    noFill();
    if(colTrue == true){
      stroke(colVal, 255, 255);
    } else {
      stroke(colVal);
    }
    rect(0, 0, 800-subVal, 800-subVal);
    popMatrix();
  }

  if (fourSet == true) {
    //shape data
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(frameCount)*rotVal);
    noFill();
    stroke(colVal, 255, 255);
    beginShape(TRIANGLES);
    vertex(100-subVal, 100-subVal);
    vertex(0, -142+subVal);
    vertex(-100+subVal, 100-subVal);
    endShape();
    popMatrix();
  }

  //shrinking conditionals
  if (rectShrinking == true) subVal+=5 + speedVal;
  else subVal-=5 + speedVal;
  if (subVal >= 800 - minVal) rectShrinking = false;
  if (subVal <= -500 + maxVal) rectShrinking = true;

  if (blank % 2 == 1) background(0);
}

void keyPressed() {
  if (key == '1') {
    textSet = false;
    oneSet = true;
    twoSet = false;
    threeSet = false;
    fourSet = false;
    start++;
  }
  if (key == '2') {
    textSet = false;
    oneSet = false;
    twoSet = true;
    threeSet = false;
    fourSet = false;
    start++;
  }
  if (key == '3') {
    textSet = false;
    oneSet = false;
    twoSet = false;
    threeSet = true;
    fourSet = false;
    start++;
  }
  if (key == '4') {
    textSet = false;
    oneSet = false;
    twoSet = false;
    threeSet = false;
    fourSet = true;
    start++;
  }
  if (key == 'f'){
    if(colTrue == true){
      colTrue = false;
    } else {
      colTrue = true;
    }
  }
  if (keyCode == TAB) redraw = true;
  if (key == ' ') blank++;
  if (keyCode == LEFT) maxVal += 10;
  if (keyCode == RIGHT) maxVal -= 10;
  if (keyCode == UP) minVal += 10;
  if (keyCode == DOWN) minVal -= 10;
  if (key == ',') rotVal -= .1;
  if (key == '.') rotVal += .1;
  if (key == 'a') speedVal -= .1;
  if (key == 's') speedVal += .1;
  //bug: if mins/maxs reach certain value they will drift off forever. fix.
}