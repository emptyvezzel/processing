PImage img; 
color[] c; 

void setup() {
  size(500, 500);
  colorMode(HSB);
  img = createImage(2*width, 2*height, RGB);   
  noiseDetail(1, 0.3);
  c = new color[255];   
  //noLoop();
}

void draw() {
  for (int i = 0; i < c.length; i += 1) {
    c[i] = color(i*2%255, 255, 255);
  }

  img.loadPixels();  
  float nx, ny, nz;
  float theta = 0, phi = 0;
  float R = 5, r = 1;
  for (int x = 0; x < img.width; x += 1) {
    for (int y = 0; y < img.height; y += 1) {
      theta = map(x, 0, img.width, 0, TWO_PI);
      phi = map(y, 0, img.height, 0, TWO_PI);
      nx = (R+r*cos(phi))*cos(theta);
      ny = (R+r*cos(phi))*sin(theta);
      nz = r*sin(phi);
      nx = norm(nx, 0, R+r);
      ny = norm(ny, 0, R+r);
      nz = norm(nz, 0, r);
      img.pixels[x + y*img.width] = c[floor(255*noise(floor(255*noise(nx, ny, nz)), 0.1))];
    }
  }
  img.updatePixels();
  image(img, 0, 0, width, height);  // the image is reduce to the size of the canvas to make it smooth
}

void mousePressed() { 
  //noiseSeed(random(0xFFFFFF));
  //noiseSeed(undefined);
  redraw();
}

void keyPressed() {
  save("image.png");
}
