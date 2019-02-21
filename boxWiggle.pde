// made by Jack Murphy / emptyvezzel

void setup() {
  size(500, 500);
}

void draw(){
  background(0);
  float incFloat = 0.01;
  for(int i=0; i<350; i+=85){
    for(int j=0; j<350; j+=85){
      fill(mouseY/2);
      rect(50+i, 50+sin(frameCount/60.0)*60+j, 50, 50, mouseX/20, mouseX/20, mouseX/20, mouseX/20);
    }
  }
}