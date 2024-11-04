Particle[] particles=new Particle[100];
void setup(){
  size(300,300);
  background(0);
  noStroke();
  for(int n=0;n<particles.length;n++){
    particles[n]=new Particle();
  }
  particles[0]=new OddballParticle();
}
void draw(){
  for(int n=0;n<particles.length;n++){
    particles[n].show();
    particles[n].move();
  }
}
class Particle{
  double x,y,speed,angle;
  int Color,sizeX,sizeY;
  Particle(){
    x=150;
    y=150;
    speed=(Math.random()*6)+5;
    angle=Math.random()*(2*Math.PI);
    Color=color((int)(Math.random()*81)+175, (int)(Math.random()*81)+175, (int)(Math.random()*81)+175);
    sizeX=(int)(Math.random()*5)+1;
    sizeY=sizeX;
  }
  void move(){
    x=x+Math.cos(angle)*speed;
    y=y+Math.sin(angle)*speed;
    if(x>300||x<0) x=y=150;
    if(y>300||y<0) x=y=150;
  }
  void show(){
    fill(Color);
    ellipse((float)x,(float)y,sizeX,sizeY);
  }
}

class OddballParticle extends Particle{
  OddballParticle(){
    x=Math.random()*301;
    y=Math.random()*301;
    speed=(Math.random()*5)+3;
    angle=Math.random()*(2*Math.PI);
    Color=color(150,150,150);
  }
  void move(){
    x=x+Math.cos(angle)*speed;
    y=y+Math.sin(angle)*speed;
    if((x>450||y>450)||(x<-150||y<-150)){
      if(Math.random()*2<=0.5) x=0;
      else x=300;
      y=(Math.random()*101)+100;
      speed=(Math.random()*5)+3;
      angle=Math.random()*(2*Math.PI);
    }
  }
  void show(){
    fill(0);
    rect(0,0,300,300);
    fill(Color);
    triangle((float)x,(float)y,(float)x+10,(float)y-15,(float)x+20,(float)y);
  }
}
