class Shop_button
{
  boolean play_game;
  PVector location_play = new PVector(400,500);
  PVector size_play = new PVector(160,80);
  PVector location_shop = new PVector(100,50);
  PVector size_shop = new PVector(100,100);
  
   
  Shop_button(boolean a)
  {
   play_game = a;
    
  }
  
  
  void Display(boolean b)
  {
    play_game = b;
    
    if(play_game == true)
    {
      image(loadImage("Shop_button.png"), location_play.x, location_play.y);
    }
    else
    {
      image(loadImage("return_but.png"), location_shop.x, location_shop.y);
    }
  }
  
  boolean location_check(boolean c)
  {
  play_game = c;
  if(play_game == true)
  {
    if(mouseX > location_play.x && mouseY > location_play.y && mouseX < size_play.x+location_play.x && mouseY < size_play.y+location_play.y)
    {
      play_game = false;
      return play_game;
    }
  }
  else
  {
    if(mouseX > location_shop.x && mouseY > location_shop.y && mouseX < size_shop.x+location_shop.x && mouseY < size_shop.y+location_shop.y)
    {
      play_game = true;
      return play_game;
    }
  }
  return play_game;
    
    
    
  
  
  
}
}
