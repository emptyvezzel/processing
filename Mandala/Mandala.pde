/**
 * Load and Display an OBJ Shape. Original processing example.
 * Extended by John Park to load custom shape, create array with FOR LOOP, and simple Navigation with mouse drag and scroll.
 * Works well with Tweak Mode
 * 
 * The loadShape() command is used to read simple SVG (Scalable Vector Graphics)
 * files and OBJ (Object 3D Models) files into a Processing sketch. This example loads an
 * OBJ file of a custom shape and displays it to the screen. 
 */

boolean record;
PShape dodecahedron;
PShape cone;
PShape diamond;
float rotX = 0;
float rotY = -30;
float zDist = -600;
int a = 1;
int b = 0;

void setup() {
  size(1000, 1000, P3D);
  dodecahedron = loadShape("dodecahedron.obj");
  cone = loadShape("cone.obj");
  diamond = loadShape("diamond.obj");
  dodecahedron.scale(50);
  cone.scale(3);
  dodecahedron.setFill(color(#0A8FBD));
  cone.setFill(color(#0EBD19));
  diamond.setFill(color(#1441F0));
}

void draw() {
  if (b % 2 == 0){
    background(0);
    }
    else{
    background(255);  
    }
  lights();

  translate(width/2, height/2, zDist);
  rotateY(radians(rotX));
  rotateX(radians(rotY)); // for view. Can change -30 to mouseY to make interactive

  for (int i=0; i<a; i++) {
    pushMatrix();

    rotateY(radians(i*360.0/a));  // rotation around from core (radial pattern)
    
    //circles
    noStroke();
    fill(#0DC7C2);
    translate(120, 0, 0); // Distance from core
    sphere(50);
    
    //box
    noStroke();
    fill(#15B07D);
    translate(40, 0, 0);
    box(68);
    
    //dodecahedron
    translate(-225, 0, 0);
    shape(dodecahedron);
    
    //cone
    translate(322, 0, 0);
    rotateY(4.72);
    shape(cone);
    
    //diamond
    translate(0, 0, -28);
    rotateY(0.00);
    shape(diamond);
    
      if (record) {
    endRecord();
    record = false;
  }
    
    popMatrix();
  }
}

// Below Functions are just for navigation (mouse drag and scroll wheel)
void mouseDragged(){
  rotX += pmouseX - mouseX;
  rotY += pmouseY - mouseY;
}

void mouseWheel(MouseEvent event){
  zDist += event.getCount()*8.0;
}

void keyPressed(){
  if (key == '1') a = a + 1;
  if (key == '2') a = a - 1;
  if (key == 'q') b = b + 1;
    if (key == 'r') {
    record = true;
  }
}