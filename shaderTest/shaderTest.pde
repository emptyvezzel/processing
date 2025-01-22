PShader psychedelicShader;

void setup() {
  size(800, 800, P2D);
  psychedelicShader = loadShader("psychedelic.glsl");
  psychedelicShader.set("resolution", float(width), float(height));
}

void draw() {
  psychedelicShader.set("time", millis() / 1000.0);
  shader(psychedelicShader);
  rect(0, 0, width, height);
}

void keyPressed() {
}
