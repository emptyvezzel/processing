// made by Jack Murphy / emptyvezzel

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

  for (int i = 0; i < 20; i++) {

    rotateX(radians(20));
    rotateY(radians(0));
    rotateZ(radians(0));

    scale(1.00, 1.00, 1.00);

    translate(30, 0, 0);

    box(50, 50, 50);
  }
}

void mouseWheel(MouseEvent event) {
  zoom += event.getCount() * 8;
}

void mouseDragged() {
  x -= pmouseX - mouseX;
  y -= pmouseY - mouseY;
}

void keyPressed() {
  if (key == 'q') xrot += 6;
  if (key == 'a') xrot -= 6;
}