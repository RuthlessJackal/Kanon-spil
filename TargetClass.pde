class Target {
  PVector location;
  float velocity;
  PImage img;

  float rad;

  Target (float y, float s) {
    location = new PVector(960, y);
    velocity = s;
  }

  void setup() {
    img = loadImage("TargetPNG.png");
  }

  void loop() {
    rad += velocity;
    
      
    
    image(img, location.x, location.y);
    location = new PVector(960, ((sin(rad) + 1) * 0.5)*500);
    
    
    
  }
}
