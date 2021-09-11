
class cannon
{
  PVector location, aim_location, size_;
  float aim_angle;
  float k1;
  Boolean Baby;
  PImage cannonHead;
  PImage cannonWheel;

float tConstant = 3;
ArrayList<Cannonball> cannonballs = new ArrayList<Cannonball>();

float shotsPerSec;
float localTime;


  cannon(Boolean Babycannon, float x, float y, float w, float h, float k, float shotsPerSecc)
  {
    shotsPerSec = shotsPerSecc;
    localTime = 0;
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

  void aim(float targetCurrentRad, float targetVelocity) { 
    if (Baby == true) {
      
    
      float y = height - (((sin(targetCurrentRad + (30*targetVelocity * tConstant)) + 1) * 0.5)*500) - 50;
      
      float vx = (960 / tConstant) - (location.x / tConstant); 
      
      
      
      float vy = (9.81*30*tConstant*tConstant + 2 * y - 2 * (height - location.y)) / (2*tConstant);
      
      

      push();
      translate(location.x, location.y);
      imageMode(CENTER);
      rotate(atan(-vy/vx));
      image(cannonHead, 0, 0, size_.x, size_.y);
      pop(); 
      
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

  void ShootBabyCannon(float targetCurrentRad, float targetVelocity)
  {
    float y = height - (((sin(targetCurrentRad + (30*targetVelocity * tConstant)) + 1) * 0.5)*500) - 50;
      
      float vx = (960 / tConstant) - (location.x / tConstant); 
      
      
      
      float vy = (9.81*30*tConstant*tConstant + 2 * y - 2 * (height - location.y)) / (2*tConstant);
  
  float theta = atan(-vy/vx);
  
    float kons = 50;
    cannonballs.add(new Cannonball(new PVector(cos(theta)*kons + location.x, sin(theta)*kons + location.y), new PVector(vx,vy), 20));
    
  }

  int Display(float targetY, float targetCurrentRad, float targetVelocity) {
    
    if(Baby == true)
    {
      
      localTime += 1/(float)30;
    
    
    if(localTime > 1 / shotsPerSec)
    {
      localTime = 0;
      
      
      ShootBabyCannon(targetCurrentRad,targetVelocity);
    }
    
    
    }
    int x2 = 0;
    for (int i = 0; i < cannonballs.size(); i++)
    {
     
      if(cannonballs.get(i).Loop(targetY))
      {
        x2 += 1;
      }
      
    }
    
    
    
    push();
    imageMode(CENTER);
    image(cannonWheel, location.x, location.y+size_.y/2.2,k1,k1*2/3);
    
    
    
    
    
      
      
    
    //cannon wheel is drawn with a fixed size
    pop();
    
    return x2;
  }
}
