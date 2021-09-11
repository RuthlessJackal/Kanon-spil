cannon mainCannon = new cannon(false,100,500,100,35,80, 5);
cannon baby = new cannon(true,100,300,50,20,30, 1);
Target target = new Target(350,0.03);

final static ArrayList<Cannonball> cannonballs = new ArrayList();

PVector nuzzle;
PVector nuzzleSpawn;
PVector nuzzleSpeed;
PVector buffer = new PVector(mainCannon.location.x,mainCannon.location.y);
int coins = 0;
boolean play_game;
int play_game1 = 1;
//PImage shop_img;
PFont Font1, Font2, Font3;
PImage shop_img, return_but_img;
int[] bought = {0,0,0,0};
int[] bought1 = {0,0,0,0};
int[] show_buy = {0,0,0,0};
int count = 0;
int cannon_points = 10;

shop shop1 = new shop(coins);

Button but1 = new Button(250,100,225,160,"+1 Cannon",60,true); Button but2 = new Button(250,100,225,310,"Christian",34,false);
Button but3 = new Button(250,100,525,160,"New Color",20,true); Button but4 = new Button(250,100,525,310,"og Hjalmer",50,false); 

Shop_button shop_but = new Shop_button(play_game);


void setup(){
  frameRate(30);
  //shop_img = loadImage("Shop_button.png");
  play_game = true;
  shop_img = loadImage("shop.png");
  return_but_img = loadImage("return_but.png");
  size(1000, 618);
  Font1 = createFont("Arial Bold", 48);
  Font2 = createFont("Arial", 32);
  Font3 = createFont("Arial Bold", 36);
  
}

void settings(){
  size(1000,618);
}

void draw(){

  
  play_game = boolean(play_game1);
  
if(play_game == true)
{
  //Baggrund og græs
  background(90,205,255);
  push(); fill(126,200,80); noStroke(); rect(0,500,1000,118); pop();
  //Point display
  push(); fill(248,222,126); strokeWeight(2); rect(400,0,200,100); pop();
  push(); textSize(30); fill(0); textAlign(CENTER); text("Coins",500,40); text(coins,500, 75);  pop();
  //Shopping
  //image(shop_img,400,500);


// Changeable PVectors
  PVector mouse2 = new PVector(mouseX, mouseY);
  PVector mouse = new PVector(mouseX, mouseY);
    nuzzle = mouse.sub(buffer); 
    nuzzleSpawn=nuzzle.normalize();
    nuzzleSpawn.mult(50);
    nuzzleSpawn.add(buffer);

// Det her virker ikke, det fliiper ikke idk man dræv mig
    nuzzleSpeed = mouse2.sub(nuzzleSpawn);
    nuzzleSpeed.add(buffer);
    nuzzleSpeed.y = height-nuzzleSpeed.y;
  baby.setup();
  coins += baby.Display(target.location.y, target.rad, target.velocity)*10;
  baby.aim(target.rad, target.velocity);
  
  if(show_buy[2] == 1)
  {
    int[] col = {0,0,0};
    
    for(int i = 0; i < 3; i++)
    {
    
      if(int(random(2)) == 1)
      {
        col[i] = 255;
      }
     
    }
    
    fill(col[0], col[1], col[2]);
    cannon_points += 5;
    println(cannon_points);
  }
  show_buy[2] = 0;
  
 // Cannon_class køres
  mainCannon.setup();
  mainCannon.Display(target.location.y, target.rad, target.velocity);
  mainCannon.aim(target.rad, target.velocity);
  
  
// Cannonball (Jeg forstår ikke helt)

for(int i = 0; i < cannonballs.size(); i++)
{

  if(cannonballs.get(i).Loop(target.location.y) == true)
  {
    coins += cannon_points;
  }
}
 
// Target_class køres
  target.setup();
  target.loop();
 
}

else //if play_game is not true (if store is open)
{
   background(150,150,255);
  shop1.Display(coins);
  but1.Display(); but2.Display(); but3.Display(); but4.Display();
  but1.check_click(); but2.check_click(); but3.check_click(); but4.check_click();  
}

shop_but.Display(play_game);
}


void mousePressed(){
// shooting cannons
play_game = shop_but.location_check(play_game);
play_game1 = int(play_game);


if(play_game == true)
{
cannonballs.add(new Cannonball(nuzzleSpawn,nuzzleSpeed,20));

}
else
{
  for(int i = 0; i < 4; i++)
  {
    bought1[i] = bought[i];
    println(bought1[i], bought[i]);
  }
  
  coins = but1.click(coins); coins = but2.click(coins); coins = but3.click(coins); coins = but4.click(coins);
  bought[0] = but1.buying(); bought[1] = but2.buying(); bought[2] = but3.buying(); bought[3] = but4.buying();
  println(bought1[2], bought[2]);
  
  for(int i = 0; i < 4; i++)
  {
   if(bought[i] != bought1[i])
   {
    show_buy[i] = 1; 
   }  
   else
   {
    show_buy[i] = 0; 
   }
   
    
  }
  println(show_buy);
  
}

}
