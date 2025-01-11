ArrayList<Particle> particles;
PVector attractor;
float gravityStrength = 200;
PVector force;
float maxSpeed = 10;
float distance;

void setup() {
  size(800, 800);
  particles = new ArrayList<>();
  for (int i = 0; i < 500; i++) {
    particles.add(new Particle(random(width), random(height)));
  }
  attractor = new PVector(width / 2, height / 2);
}

void draw() {
  background(0);
  fill(255);
  noStroke();
  ellipse(attractor.x, attractor.y, 30, 30);
  for (Particle p : particles) {
    force = PVector.sub(attractor, p.position);
    distance = constrain(force.mag(), 5, 50);
    force.normalize();
    force.mult(gravityStrength / (distance * distance));
    if (mousePressed) {
      force.mult(-1);
    }
    p.applyForce(force);
    p.update();
    p.edges();
    p.show();
  }
}

void mouseMoved() {
  attractor.set(mouseX, mouseY);
}

class Particle {
  PVector position, velocity, acceleration;

  Particle(float x, float y) {
    position = new PVector(x, y);
    velocity = PVector.random2D();
    acceleration = new PVector(0, 0);
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    position.add(velocity);
    acceleration.mult(0);
  }

  void edges() {
    if (position.x > width) position.x = 0;
    if (position.x < 0) position.x = width;
    if (position.y > height) position.y = 0;
    if (position.y < 0) position.y = height;
  }

  void show() {
    fill(100, 200, 255, 150);
    noStroke();
    ellipse(position.x, position.y, 5, 5);
  }
}
