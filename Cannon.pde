//Opløsningen er 1000*618
// cannon c1 = new cannon(false,100,500,100,35,80);

class cannon
{
  PVector location, aim_location, size_;
  float aim_angle;
  float k1;
  Boolean Baby;
  PImage cannonHead;
  PImage cannonWheel;

  cannon(Boolean Babycannon, float x, float y, float w, float h, float k)
  {
    location = new PVector(x, y);
    size_ = new PVector(w, h);
    Baby = Babycannon;
    k1 = k;
    println(k);
  }

  void setup() {
    cannonHead = loadImage("CannonPNG.png");
    cannonWheel = loadImage("CannonFootPNG.png");
  }

  void aim() { 
    if (Baby == true) {
      //Babycannons auto_aim function is to be inserted here
    } else {
      aim_angle = (atan((mouseY-location.y)/(mouseX-location.x)));
      push();
      translate(location.x, location.y);
      imageMode(CENTER);
      rotate(aim_angle);
      image(cannonHead, 0, 0, size_.x, size_.y);
      pop();
    }
  }

  void Display() {
    println(k1);
    push();
    imageMode(CENTER);
    image(cannonWheel, location.x, location.y+size_.y/2.2,k1,k1*2/3);
    //cannon wheel is drawn with a fixed size
    pop();
  }
}
