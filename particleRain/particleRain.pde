ArrayList<Particle> particles;

void setup() {
  size(800, 600);
  particles = new ArrayList<Particle>();
}

void draw() {
  background(0);

  for (int i = 0; i < 5; i++) {
    particles.add(new Particle(random(width), random(-20, 0)));
  }

  for (int i = particles.size() - 1; i >= 0; i--) {
    Particle p = particles.get(i);
    p.update();
    p.show();

    if (p.isOffScreen()) {
      particles.remove(i);
    }
  }
}

class Particle {
  float x, y;
  float ySpeed;
  color c;
  float size;

  Particle(float x, float y) {
    this.x = x;
    this.y = y;
    this.ySpeed = random(1, 3);
    this.size = random(5, 15);
    this.c = color(random(255), random(255), random(255));
  }

  void update() {
    y += ySpeed;
  }

  void show() {
    noStroke();
    fill(c);
    ellipse(x, y, size, size);
  }

  boolean isOffScreen() {
    return y > height;
  }
}
