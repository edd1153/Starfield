Particle[] bob = {new Particle(), new Particle()};

void setup()
{
	size(500,500);
  frameRate(100);
  bob = new Particle [10000];
  for (int i = 0 ; i < bob.length; i++){
   bob[i] = new Particle(); 
   bob[0] = new OddBallParticle();
  }
}

void mousePressed(){
  redraw();
}

void draw()
{
	background(0);
  for (int i = 0; i < bob.length; i++){
   bob[i].show();
   bob[i].move();
  }
}
class Particle
{
  double myX, myY, myAngle;
  int myColor, mySpeed;
  //Constructor
  Particle(){
    myAngle = (Math.random() * (2 * Math.PI));
    mySpeed = (int)(Math.random() * 10);
    myX = 250;
    myY = 250;
    myColor = color((int)(Math.random() * 256 + 1), (int)(Math.random() * 256 + 1), (int)(Math.random() * 256 + 1));
  }
  void show(){
    fill(myColor);
    ellipse((float)myX, (float)myY, 10, 10);
  }
  void move(){
    myX = (Math.cos(myAngle) * mySpeed) + myX;
    myY = (Math.sin(myAngle) * mySpeed) + myY;
  }
}

class OddBallParticle extends Particle
{
	OddBallParticle(){
    myAngle = (Math.random() * (5 * Math.PI));
    mySpeed = 1;
    myX = 0;
    myY = 0;
    myColor = color(255, 0, 0);
  }
  void show(){
    fill(myColor);
    ellipse((float)myX, (float)myY, 40, 40);
    ellipse((float)myX + 50, (float) myY, 40, 40);
    ellipse((float)myX + 100, (float) myY , 40, 40);
  }
  void move(){
      myX = myX + (int)((Math.random() * 5) + 5);
      myY = myY + (int)((Math.random() * 5) + 5);
      if (myX > 500 & myY > 500){
       myX = 0;
       myY = 0;
      }
  }
}
