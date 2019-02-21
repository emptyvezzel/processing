// made by Jack Murphy / emptyvezzel

int r = 0;

void setup(){
  size(800, 400);
  background(0);
}

void draw(){
  translate(width/2, height/2);
  rotate(r);
  noFill();
  stroke(255, 12);
  scale(4);
  
  for (int i= 10; i < width; i += 50){
    house(i, 20+ random(25));
  }
  r += 1;
}

void house(float x, float y){
  fill(255, 0, 0, 22);
  triangle(x+15, y, x, y+15, x+30, y+15);
  noFill();
  rect(x, y+15, 30, 30);
}