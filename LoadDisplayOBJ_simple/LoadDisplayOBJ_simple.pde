/**
 * Load and Display an OBJ Shape. Original processing example.
 * Extended by John Park to load custom shape, create array with FOR LOOP, and simple Navigation with mouse drag and scroll.
 * Works well with Tweak Mode
 * 
 * The loadShape() command is used to read simple SVG (Scalable Vector Graphics)
 * files and OBJ (Object 3D Models) files into a Processing sketch. This example loads an
 * OBJ file of a custom shape and displays it to the screen. 
 */
import nervoussystem.obj.*;

boolean record;

PShape mound;
float zoom = -300;
int x = 0;
int y = 0;
float xrot = 0;

void setup() {
  size(840, 560, P3D);
  mound = loadShape("mound.obj");
}

void draw() {
  background(0);
  lights();
  
  translate(width/8+x, height/2+y, zoom);
  rotateX(radians(xrot));
  
  for (int i = 0; i < 20; i++){
    
  rotateX(radians(20));
  rotateY(radians(0));
  rotateZ(radians(0));
  
  scale(1.00, 1.00, 1.00);
  
  translate(30, 0, 0);

  box(50,50,50);
  
  if (record) {
    endRecord();
    record = false;
  }
  }
}

void mouseWheel(MouseEvent event){
  zoom += event.getCount() * 8;
}

void mouseDragged(){
  x -= pmouseX - mouseX;
  y -= pmouseY - mouseY;
}

void keyPressed(){
  if (key == 'q') xrot += 6;
  if (key == 'a') xrot -= 6;
  if (key == 'r') {
    record = true;
  }
}