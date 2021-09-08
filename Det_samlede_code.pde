cannon mainCannon = new cannon(false,100,500,100,35,80);
Target target = new Target(350,0.03);
final static ArrayList<Cannonball> cannonballs = new ArrayList();

PVector nuzzle;
PVector nuzzleSpawn;
PVector nuzzleSpeed;
PVector buffer = new PVector(mainCannon.location.x,mainCannon.location.y);
float k;

void setup(){
  frameRate(30);
}

void settings(){
  size(1000,618);
}

void draw(){
  //Baggrund og græs
  background(90,205,255);
  push(); fill(126,200,80); noStroke(); rect(0,500,1000,118); pop();
  //Point display
  push(); fill(248,222,126); strokeWeight(2); rect(400,0,200,100); pop();
  push(); textSize(30); fill(0); textAlign(CENTER); text("Coins",500,40); text("Her skal der stå 'coins'",500, 75);  pop();

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
    k = 500 - nuzzleSpeed.y;
    nuzzleSpeed.y = 1000-(nuzzleSpeed.y+k*2);
  
  
 // Cannon_class køres
  mainCannon.setup();
  mainCannon.Display();
  mainCannon.aim();
  
// Cannonball (Jeg forstår ikke helt)
for (Cannonball c1: cannonballs) c1.Loop(target.location.y);
  
// Target_class køres
  target.setup();
  target.loop();
  
  line(buffer.x,buffer.y, nuzzle.x,nuzzle.y); line(buffer.x,buffer.y,nuzzleSpeed.x,nuzzleSpeed.y);
}

void mousePressed(){
// shooting cannons
println(nuzzleSpawn);
println(nuzzleSpeed);

cannonballs.add(new Cannonball(nuzzleSpawn,nuzzleSpeed,20));
}
