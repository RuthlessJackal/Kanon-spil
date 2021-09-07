class Cannonball
{
 PVector startLocation;
 float t;
 float angle;
 float power;
 float radius;
 
 boolean draw;
 
  Cannonball(PVector locatio, PVector force, float r)
  {
   draw = true;
    t = 0;
    startLocation = locatio;
    radius = r;
    angle = atan(force.y / force.x)*180/PI;
    power = sqrt((force.x*force.x)+(force.y*force.y));    
  }
  
  boolean Loop(float targetYPos)
  {
    if(draw == true)
    {
    t += 1/30.0;
    float degToRad = (PI/180);
    float g = -9.81*30;
    
    stroke(30,255,0);   
    
    float xPos = startLocation.x + power*t*cos(angle*degToRad);
    float yPos = startLocation.y - (power*t*sin(angle*degToRad))-(0.5*g*(t*t));
    
    circle(xPos,yPos,radius);
  
    
    //Collsion check
    
    float widthCheck = 10;
    float targetX = 960;
    float heightCheck = 47;
    
    
    if(xPos > targetX - widthCheck && xPos < targetX + widthCheck)
    {
     if(yPos > targetYPos - heightCheck && yPos < targetYPos + heightCheck)
     {
      //ramt target
      print("RAMT");
      
      return true;
     
       
       
     }
      
    }
    
    if(xPos > width+radius*2)
    {
      //slet objekt
      
      print("DØD");
      
    }
    
    if(yPos > height+radius*2)
    {
      //slet objekt
      
      print("DØD");
      
    }
    
    
    
    }
    
    return false;
    
    
    
    
    
  }
  
  
}
