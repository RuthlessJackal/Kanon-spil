// Opløsning er 1000*618

class Target {
  PVector location;
  PVector velocity;
  PImage Target = loadImage("TargetPicture");

  Target () {
    location = new PVector(10, 10);
  }
  void draw() {
    image(Target, 700, 590);
  }
}
