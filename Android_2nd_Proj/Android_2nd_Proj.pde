//Jack Murphy 3/16/2017 
//ArtD 199 12PM
//This is a simple game where you use the on screen buttons to navigate a 
//square to a larger square. Once you reach the square the game congragulates you
//and you can play again.
PImage arrow_u;
PImage arrow_d;
PImage arrow_l;
PImage arrow_r;
int t1 = 126;
int t2 = 126;
int t3 = 126;
int t4 = 126;
int bcol = 126;
int bscol = 0;
int xsq = 50;
int ysq = 50;
int xfsq = 768;
int yfsq = 688;
float bg1 = 255;
float bg2 = 255;
float bg3 = 255;
float speed = 3;
boolean upkey = false;
boolean downkey = false;
boolean leftkey = false;
boolean rightkey = false;
boolean fbutton = false;
boolean winscreen = false;

void setup() {
  size(1200, 800);
  smooth();
  //arrow images
  arrow_u = loadImage("arrow_u.png");
  arrow_d = loadImage("arrow_d.png");
  arrow_l = loadImage("arrow_l.png");
  arrow_r = loadImage("arrow_r.png");
}

void draw() {
  imageMode(CENTER);
  background(bg1, bg2, bg3);
  
  //goal square
  fill(0);
  rect(757, 650, 100, 100);
  fill(255);
  textSize(30);
  text("reach \nhere!", xfsq, yfsq);
  
  //player square
  fill(250, 0, 0);
  rect(xsq, ysq, 50, 50);
  
  //up arrow
  tint(255, t1);
  image(arrow_u, 150, 480);
  
  //left arrow
  tint(255, t2);
  image(arrow_l, 70, 565);

  //right arrow
  tint(255, t3);
  image(arrow_r, 230, 565);

  //down arrow
  tint(255, t4);
  image(arrow_d, 150, 650);

  //dance party button
  strokeWeight(6);
  stroke(bscol);
  fill(bcol);
  ellipse(1000, 584, 100, 100);
  noStroke();
  fill(255);
  textSize(16);
  text("dance party", 955, 588);

  //controls
  if (upkey == true) {
    ysq -= speed;
    t1 = 1000;
  }
  if (leftkey == true) {
    xsq -= speed;
    t2 = 1000;
  }
  if (rightkey == true) {
    xsq += speed;
    t3 = 1000;
  }
  if (downkey == true) {
    ysq += speed;
    t4 = 1000;
  }
  if (fbutton == true) {
    bcol = 0;
    bscol = 126;
    bg1 = random(0, 255);
    bg2 = random(0, 255);
    bg3 = random(0, 255);
  } else {
    bcol = 126;
    bscol = 0;
    bg1 = 255;
    bg2 = 255;
    bg3 = 255;
  }
  if (winscreen == true) {
    fill(255);
    rect(0, 0, 1175, 857);
    textSize(50);
    fill(0);
    text("You Win!", 450, 400);
  }
}

void mousePressed() {
  //used to change variables and turn states to true if a function is performed
  if (dist(mouseX, mouseY, 150, 480) < 50) {
    upkey = true;
  }
  if (dist(mouseX, mouseY, 70, 565) < 50) {
    leftkey = true;
  }
  if (dist(mouseX, mouseY, 230, 565) < 50) {
    rightkey = true;
  }
  if (dist(mouseX, mouseY, 150, 640) < 50) {
    downkey = true;
  }
  if (dist(mouseX, mouseY, 1000, 584) < 50) {
    fbutton = true;
  }
  if (dist(xsq, ysq, xfsq, yfsq) < 110) {
    winscreen = true;
  }
}

void mouseReleased() {
  //used for reseting buttons to original state
  upkey = false;
  leftkey = false;
  rightkey = false;
  downkey = false;
  fbutton = false;
  t1 = 126;
  t2 = 126;
  t3 = 126;
  t4 = 126;
}