float xoff = 0.0;
float speed = 10;
float arcpos = 30;
float arcsize = 30;
float arcx = 0;
float circsize = 770;
int acol = 255;
int bcol = 255;
int ccol = 255;
int randnum = 1;
boolean randcol = false;
boolean rgbcol = true;
boolean sandy = false;
boolean vitamin = false;
boolean office = false;
boolean watermelon = false;

void setup() {
  size(800, 800);
  strokeCap(SQUARE); //makes lines in sketch square
  background(0);
}

void draw() {
  if (circsize < 50){
    circsize = 4;
  }
  arcpos = arcpos + speed;
  if (randcol == true) {
    stroke(random(255), random(255), random(255));
  }
  if (rgbcol == true) {
    stroke(random(acol), random(bcol), random(ccol));
  }
  if (rgbcol == false) {
    if (sandy == true) {
      randnum = int(random(1, 5));
      if (randnum == 1) {
        stroke(#E6E2AF);
      }
      if (randnum == 2) {
        stroke(#A7A37E);
      }
      if (randnum == 3) {
        stroke(#EFECCA);
      }
      if (randnum == 4) {
        stroke(#046380);
      }
      if (randnum == 5) {
        stroke(#002F2F);
      }
    }
    if (vitamin == true) {
      randnum = int(random(1, 5));
      if (randnum == 1) {
        stroke(#004358);
      }
      if (randnum == 2) {
        stroke(#1F8A70);
      }
      if (randnum == 3) {
        stroke(#BEDB39);
      }
      if (randnum == 4) {
        stroke(#FFE11A);
      }
      if (randnum == 5) {
        stroke(#FD7400);
      }
    }
    if (office == true) {
      randnum = int(random(1, 5));
      if (randnum == 1) {
        stroke(#2C3E50);
      }
      if (randnum == 2) {
        stroke(#E74C3C);
      }
      if (randnum == 3) {
        stroke(#ECF0F1);
      }
      if (randnum == 4) {
        stroke(#3498DB);
      }
      if (randnum == 5) {
        stroke(#2980B9);
      }
    }
    if (watermelon == true) {
      randnum = int(random(1, 5));
      if (randnum == 1) {
        stroke(#7D8A2E);
      }
      if (randnum == 2) {
        stroke(#C9D787);
      }
      if (randnum == 3) {
        stroke(#FFFFFF);
      }
      if (randnum == 4) {
        stroke(#FFC0A9);
      }
      if (randnum == 5) {
        stroke(#FF8598);
      }
    }
  }
  noFill();
  strokeWeight(25); //controls thickness of line
  arc(400, 400, circsize, circsize, radians(arcpos), radians(arcpos+arcsize));
}

void keyPressed() {
  if (key == '/') background(0);
  if (key == 'w') arcsize = arcsize + 1000;
  if (key == 's') arcsize = 30;
  if (key == ' ') arcpos = arcpos + 10;
  if (key == 'y') circsize = circsize - 48;
  if (key == 't') circsize = circsize + 48; 
  if (key == 'z') circsize = 770;
  if (key == 'r') {
    //random color
    randcol = true;
    rgbcol = false;
    sandy = false;
    vitamin = false;
    office = false;
    watermelon = false;
  }
  if (key == '1') { 
    acol = 0; 
    bcol = 255; 
    ccol = 255;
    randcol = false;
    rgbcol = true;
    sandy = false;
    vitamin = false;
    office = false;
    watermelon = false;
  }
  if (key == '2') {
    acol = 0; 
    bcol = 0; 
    ccol = 255;
    randcol = false;
    rgbcol = true;
    sandy = false;
    vitamin = false;
    office = false;
    watermelon = false;
  }
  if (key == '3') {
    acol = 255; 
    bcol = 0; 
    ccol = 255;
    randcol = false;
    rgbcol = true;
    sandy = false;
    vitamin = false;
    office = false;
    watermelon = false;
  }
  if (key == '4') {
    acol = 255; 
    bcol = 0; 
    ccol = 0;
    randcol = false;
    rgbcol = true;
    sandy = false;
    vitamin = false;
    office = false;
    watermelon = false;
  }
  if (key == '5') {
    acol = 255; 
    bcol = 255; 
    ccol = 0;
    randcol = false;
    rgbcol = true;
    sandy = false;
    vitamin = false;
    office = false;
    watermelon = false;
  }
  if (key == '6') {
    acol = 0; 
    bcol = 255; 
    ccol = 0;
    randcol = false;
    rgbcol = true;
    sandy = false;
    vitamin = false;
    office = false;
    watermelon = false;
  }
  if (key == '7') {
    //sandy beach
    randcol = false;
    rgbcol = false;
    sandy = true;
    vitamin = false;
    office = false;
    watermelon = false;
  }
  if (key == '8') {
    //vitamin
    randcol = false;
    rgbcol = false;
    sandy = false;
    vitamin = true;
    office = false;
    watermelon = false;
  }
  if (key == '9') {
    //office
    randcol = false;
    rgbcol = false;
    sandy = false;
    vitamin = false;
    office = true;
    watermelon = false;
  }
  if (key == '0'){
    //watermelon
    randcol = false;
    rgbcol = false;
    sandy = false;
    vitamin = false;
    office = false;
    watermelon = true;
  }
}