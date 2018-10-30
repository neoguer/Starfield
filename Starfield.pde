Particle[] bob;
void setup()
{
  size(700, 700);
  frameRate(100);

  bob= new Particle[1000];
  for (int i=0; i<bob.length; i++)
  {
    bob[i]=new NormalParticle();
  }
  bob[1]= new Oddball();
  bob[2]= new Jumbo();

}


void draw()
{
  background(15, 68, 153);
  stroke(random(255), random(255), random(255));
  for (int i=0; i<bob.length; i++)
  {
    bob[i].show();
    bob[i].move();
  }

}


void mousePressed() {
  for (int i=0; i<bob.length; i++)
  {
    bob[i]=new NormalParticle();
  }
  bob[1]= new Oddball();
  bob[2]= new Jumbo();
}


interface Particle
{
  public void show();
  public void move();
}

class NormalParticle implements Particle
{
  double myX;
  double myY;
  double Speed;
  double Angle;
  int myColor;
  NormalParticle()
  {
    myX=350;
    myY=350;
    myColor = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
    Speed = (Math.random()*3)+2;
    Angle = Math.random()*(Math.PI*2);
  }

  public void move()
  {
    myX=myX+(Math.sin(Angle)*Speed);
    myY=myY+(Math.cos(Angle)*Speed);
  }

  public void show()
  {
    ellipse((float)myX, (float)myY, 10, 10);
    fill(myColor);
  }
}

class Oddball implements Particle
{
  double myX;
  double myY;
  double Speed;
  double Angle;
  int myColor;
  Oddball()
  {
    myX=350;
    myY=350;
    myColor = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
  }
  public void move()
  {
    if (mouseX>myX)
      myX=myX+(int)(Math.random()*5)-1;
    else
      myX=myX+(int)(Math.random()*5)-3;
    if (mouseY>myY)
      myY=myY+(int)(Math.random()*5)-1;
    else
      myY=myY+(int)(Math.random()*5)-3;
  }
  public void show()
  {
    ellipse((float)myX, (float)myY, 30, 30);
    fill(myColor);
  }
}

class Jumbo extends NormalParticle
{
  float Size;
  Jumbo()
  {
    Size= (int)(Math.random()*100);
  }
  public void show()
  {
    ellipse((float)myX, (float)myY, Size + (int)(Math.random()*100), Size + (int)(Math.random()*100));
  }
}
