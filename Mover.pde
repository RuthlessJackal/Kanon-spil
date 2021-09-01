class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  Mover (float x, float y, float m) {
    mass = m;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector (0, 0);
  }
  void applyforce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    checkEdges();
  }
  void display() {
    stroke(2);
    fill(100);
    circle(location.x, location.y, mass*10);
  }
  void checkEdges() {
    if (location.x <= 0) {
      location.x = 0;
      velocity.x = velocity.x * -1;
    } else if (location.x >= width) {
      location.x = width;
      velocity.x = velocity.x * -1;
    }
    if (location.y <= 0) {
      location.y = 0;
      velocity.y = velocity.y * -1;
    } else if (location.y >= height) {
      location.y = height;
      velocity.y = velocity.y * -1;
    }
  }
}
