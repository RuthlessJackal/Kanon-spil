
class shop 
{

  int coins1; 
  
  shop(int coins)
  {
    coins1 = coins;    
  }
  
  
  void Display(int a)
  {
   coins1 = a;
   
   image(shop_img, 0, 0);
   
   fill(156, 255, 249);
   text(coins1, width/2, height-30);
   
   textFont(Font1);
   text("COINS: ", width/2, height-100); 
  }
  
  
}



  
