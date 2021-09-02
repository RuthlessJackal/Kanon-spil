// Opløsning er 1000*618

class Target {
  PVector location;
  PVector velocity;
  PImage img;

  Target (float y, float s) {
    location = new PVector(960, y);
    velocity = new PVector(0, s);
  }

  void setup() {
    img = loadImage("TargetPNG.png");
  }

  void loop() {
    image(img, location.x, location.y);
    location.add(velocity);
    if (location.y < 30) {
      velocity.y=velocity.y*-1;
    } else if (location.y > 420) {
      velocity.y=velocity.y*-1;
    }
  }
}
