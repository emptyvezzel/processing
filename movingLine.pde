// made by Jack Murphy / emptyvezzel
// my first Java sketch! Between late 2014 and early 2015

int mouseDown = 1;

void setup() {
  size(1000, 1000);
  background(0);
}

void draw() {
  noFill();
  stroke(0, 0, 255);
  if(frameCount > 2 && mouseDown % 2 == 0){
    line(500, 500, mouseX, mouseY); 
  }
}

void mousePressed(){
  mouseDown++;
}

void keyPressed(){
  if(key == ' ') background(0);
}