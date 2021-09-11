
class Button
{
  PVector size_, location;
  String but_text;
  int price;
  int bought = 0;
  int coins;
  Boolean inf_buys;
  
  Button(float w, float h, float x, float y, String z, int q, boolean o)
  {
    location = new PVector(x,y);
    size_ = new PVector(w,h);
    but_text = z;
    price = q;
    inf_buys = o; 
    
    
  }
  
  
  
  void Display()
  {
   strokeWeight(7);
   fill(255,255,50);
   rect(location.x,location.y,size_.x,size_.y);
   fill(0,0,0);
   textAlign(CENTER);
   push();
   textFont(Font3);
   text(but_text,location.x+size_.x/2,location.y+size_.y/2);
   pop();
   if(bought == 1 && inf_buys == false)
   {
     push();
     stroke(255,0,0);
     line(location.x,location.y,size_.x+location.x,size_.y+location.y);
     line(location.x,size_.y+location.y,size_.x+location.x,location.y);
     pop();
   }
   if(inf_buys == true)
   {
    push();
    textFont(Font2);
    text(bought,location.x+size_.x/2,location.y+size_.y/2+40); 
    pop();
   }
   fill(255,255,255);
  }
  
  
  int click(int a)
  {
   coins = a;
   if((mouseX < (location.x+size_.x) && mouseX > location.x) && (mouseY < (location.y+size_.y) && mouseY > location.y))
   {
     if((coins >= price) && ((inf_buys == true || bought == 0)))
     {
       bought += 1;
       coins -= price;
       price = price+500*bought;
     }
   }
   return coins;
  }
  
  int buying() //<>//
  { 
    return bought;
  }
  
  
  void check_click()
  {
    if((mouseX < (location.x+size_.x) && mouseX > location.x) && (mouseY < (location.y+size_.y) && mouseY > location.y) && ((bought == 0) || (inf_buys == true)) )
    {
      fill(200,200,50);
      rect(location.x,location.y,size_.x,size_.y);
      fill(0,0,0);
      text(price,location.x+size_.x/2,location.y+size_.y/2);
         if(inf_buys == true)
   {
    push();
    textFont(Font2);
    text(bought,location.x+size_.x/2,location.y+size_.y/2+40); 
    pop();
   }
      
      

      
    }
    //}
    strokeWeight(1);
  }
  
}
