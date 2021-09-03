// Opløsning er 1000*618

class Babycannon {
PImage cannon;
PVector location;
float sigte;

  Babycannon(float x, float y) {
   location = new PVector(x,y);

  }
  void setup(){
  cannon = loadImage("Pil.png");
  }

  void fire(){}
  
  void aim(){
    
    sigte = (mouseY-location.y)*0.005;
    push();
    translate(location.x,location.y);
       imageMode(CENTER);
    rotate(sigte);
      image(cannon,0,0,150,70);
    pop();
  }
}
