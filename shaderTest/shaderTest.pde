float time = 0.0;
float waveSpeed = 0.02;
float distFactor = 10.0;
float colorFactor1 = 3.0;
float colorFactor2 = 4.0;
float colorFactor3 = 1.5;
float distColorFactor1 = 5.0;
float distColorFactor2 = 6.0;
float distColorFactor3 = 7.0;

void setup() {
  size(800, 800);
  //noLoop();
}

void draw() {
  loadPixels();
  
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      
      float normX = map(x, 0, width, -1, 1);
      float normY = map(y, 0, height, -1, 1);
      normX *= (float)width / height;
      
      float d = dist(normX, normY, 0, 0);
      float angle = atan2(normY, normX);
      
      float wave = sin(time * waveSpeed + d * distFactor) * 0.5 + 0.5;
      float color1 = sin(time + angle * colorFactor1 + d * distColorFactor1);
      float color2 = cos(time + angle * colorFactor2 + d * distColorFactor2);
      float color3 = sin(time * colorFactor3 + d * distColorFactor3);
      
      int r = int(map(color1 * wave, -1, 1, 0, 255));
      int g = int(map(color2 * wave, -1, 1, 0, 255));
      int b = int(map(color3 * wave, -1, 1, 0, 255));
      
      pixels[x + y * width] = color(r, g, b);
    }
  }
  
  updatePixels();
  time += 0.1;
  println(frameRate);
}

void keyPressed() {
  if (key == 'w') waveSpeed += 0.01;
  if (key == 's') waveSpeed -= 0.01;
  if (key == 'd') distFactor += 1.0;
  if (key == 'a') distFactor -= 1.0;
  if (key == 'q') colorFactor1 += 0.5;
  if (key == 'e') colorFactor1 -= 0.5;
}
