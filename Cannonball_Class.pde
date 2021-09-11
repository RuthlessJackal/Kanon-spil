class Cannonball
{
 PVector startLocation;
 float t;
 float angle;
 float power;
 float radius;
 int coins;
 
 boolean draw;
 boolean hasHit;
 
 
 
  Cannonball(PVector locatio, PVector force, float r)
  {
   hasHit = false;
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
    
    
    float xPos = startLocation.x;
    
    if(hasHit == true)
    {
     xPos -= power*t*cos(angle*degToRad);
    }
    else
    {
      xPos += power*t*cos(angle*degToRad);
    }
    
    float yPos = startLocation.y - (power*t*sin(angle*degToRad))-(0.5*g*(t*t));
    
    circle(xPos,yPos,radius);
  
    
    //Collsion check
    
    float widthCheck = 15;
    float targetX = 960;
    float heightCheck = 47;
    
    
    if(xPos > targetX - widthCheck && xPos < targetX + widthCheck)
    {
     if(yPos > targetYPos + heightCheck-20 && yPos < targetYPos + heightCheck*3-20)
     {
      //ramt target
      
      if(hasHit == false)
      {
        startLocation = new PVector(startLocation.x+power*t*cos(angle*degToRad),startLocation.y - (power*t*sin(angle*degToRad))-(0.5*g*(t*t)));
        t = 0;
        power *= 0.3;
        hasHit = true;
        coins += 10;
        
        
        return true;
      }
      
      
      
      
     
       
       
     }
      
    }
    
    
    
    if(xPos > width+radius*5)
    {
      //slet objekt
      
      draw = false;
      
    }
    
    if(yPos > height+radius*5)
    {
      //slet objekt
      
      draw = false;
      
    }
    
    
    
    }
    
    return false;
    
    
    
    
    
  }
  
  
}
