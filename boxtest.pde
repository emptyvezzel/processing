// made by Jack Murphy / emptyvezzel

float ychange = 0.0000;
float xchange = 0.0000;
float zchange = 0.0000;
float ychangetotal = 0.0000;
float xchangetotal = 0.0000;
float zchangetotal = 0.0000;
float zoom = 0.5;

void setup() {
  size(1000, 1000, P3D);
}

void draw() {
  translate(width/2, height/2);
  background(255);
  scale(zoom);
  pushMatrix();
  for (int y = 0; y < 15; y++) {
    for (int x = 0; x < 15; x++) {
      rotateY(ychangetotal);
      rotateX(xchangetotal);
      rotateZ(zchangetotal);
      fill(random(0, 249), random(0, 80), random(0, 80));
      noStroke();
      ellipse(10+x*65, 10+y*65, 50, 50);
      ellipse(10+x*65, 10+y*-65, 50, 50);
      ellipse(10+x*-65, 10+y*65, 50, 50);
      ellipse(10+x*-65, 10+y*-65, 50, 50);
    }
  }
  ychangetotal += ychange;
  xchangetotal += xchange;
  zchangetotal += zchange;
  lights();
  popMatrix();
}

void keyPressed() {
  if (keyCode == UP) zoom += 0.1;
  if (keyCode == DOWN) zoom -= 0.1;
  if (key == 'q') ychange += 0.0001;
  if (key == 'a') ychange -= 0.0001;
  if (key == 'w') xchange += 0.0001;
  if (key == 's') xchange -= 0.0001;
  if (key == 'e') zchange += 0.0001;
  if (key == 'd') zchange -= 0.0001;
  final int k = keyCode;
  if (k == ' ')
    if (looping) noLoop();
    else loop();
}