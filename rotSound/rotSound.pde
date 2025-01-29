import ddf.minim.*;

int lines = 1000;
int base = 50;
int bgDraw = 0;
float audioValue;
int sensitivity = 50;
float timeOffset, angle, radius, x, y = 0;

// Minim
Minim minim;
AudioInput in;

void setup(){
  size(800, 800);
  colorMode(HSB, 255);
  noFill();
  
  // Minim setup
  minim = new Minim(this);
  in = minim.getLineIn();
}

void draw(){
  base = 0;
  sensitivity = 500;
  if(bgDraw % 2 == 0) background(0);
  translate(width/2, height/2);
  for(int i = 0; i < lines; i++){
    audioValue = in.left.get(i % 1024) * sensitivity;
    angle = map(i, 0, lines, 0, TWO_PI);
    radius = base + audioValue * 2;
    x = cos(angle + timeOffset) * radius;
    y = sin(angle + timeOffset) * radius;
    stroke((frameCount + i) % 255, 255, 255);
    strokeWeight(2);
    line(0, 0, x, y);
  }
  timeOffset += 0.02;
}

void keyPressed(){
  if(key == ' ') bgDraw++;
}
