class Laser
{
  float koef;
  float x, y, xt, yt;
  int hp;
  float from = 90, to = 180, start = 90;
  boolean dead, isUnderFire;
  ForLaser method;
  
  Laser(float xx, float yy, float koef0, int hpp, ForLaser fl)
  {
    dead = false;
    hp = hpp;
    x = xx;
    y = yy;
    koef = koef0;
    method = fl;
  }
  
  void doAll()
  {
    float[] data=method.fire(koef,x,y,from, to, start);
    x=data[0];
    y=data[1];
    xt=data[2];
    yt=data[3];
    koef=data[4];
    from=data[5];
    to=data[6];
    start=data[7];
    
    death();
    float a=x-xt,b=y-yt;
    float m,n,k,t;
    if(a>0){m=xt;n=x;}else{m=x;n=xt;}
    if(b>0){k=yt;t=y;}else{k=y;t=yt;}
    if(3+player.size>=abs(b*player.x-a*player.y-xt*y+yt*x)/sqrt(sq(b)+sq(a)) &&
       player.x>m && player.x<n && player.y>k && player.y<t)
      player.isDead = true;
      display();
    
    if(koef>627)
      koef=0;
  }
  
  void display()
  {
    if(!dead)
    {
      noFill();
      strokeWeight(1);
      stroke(0,255,150);
      rect(x,y,40,40);
      fill(0,255,150);
      textSize(20);
      textAlign(CENTER);
      text(hp,x,y);
      
      if(x!=xt && y!=yt)
      {
        strokeWeight(15);
        line(x,y,xt,yt);
      }
    }
  }
  
  void death()
  {
    Bullet[] ar=player.bullets;
    for(int i=0;i<ar.length;i++)
    {
      Bullet ar0=ar[i];
      if(ar0.y-ar0.w<y+20-2 && ar0.x+ar0.w>x-20 && ar0.x-ar0.w<x+20 && ar0.y+ar0.w>y-20+2)
      {
        hp--;
        player.bullets[i].x=2000;
        isUnderFire=true;
      }
    }
    if(hp<=0)
    {
      dead=true;
      x=2000;
    }
  }
}