// made by Jack Murphy / emptyvezzel

void setup(){
  size(800,800);
  colorMode(HSB);
}

void draw(){
  background(0);
  for(int i = 0; i < 30; i++){
    stroke(mouseX, mouseX, mouseY);
    noFill();
    ellipse(mouseX, mouseY, 10+15*i, 10+15*i);
    stroke(mouseX, mouseX, mouseY);
    noFill();
    ellipse(width-mouseX, height-mouseY, 10+15*i, 10+15*i);
  }
  
}