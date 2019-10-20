/*
s[3]=new Cannon(500, width/2, 300, 30, 30, 0, 300, new Moving() {
    public float[] fire(int numOfCurBullet, float xL, float yL, float...other)
    {
      float x, y, bulletSpeedX, bulletSpeedY=0;
      x=xL;
      y=yL;
      if(numOfCurBullet%30<15 && numOfCurBullet%30>10 || numOfCurBullet%30<5 && numOfCurBullet%30>0)
      {
        bulletSpeedY=sin(PI*2/30*numOfCurBullet);
        bulletSpeedX=cos(PI*2/30*numOfCurBullet);
      }
      else bulletSpeedX=1000;
      float[] res= {
        x, y, bulletSpeedX, bulletSpeedY, 4, 2, 10, 0.1
      };
      return res;
    }
  }
  );
  s[4]=new Cannon(500, width/2+300, height/2, 40, 20, 3, 300, new Moving() {
    public float[] fire(int numOfCurBullet, float xL, float yL, float... other)
    {
      float x, y, bulletSpeedX, bulletSpeedY;
      x=xL;
      y=yL;
      bulletSpeedY=sin(PI*2/20*numOfCurBullet);
      bulletSpeedX=cos(PI*2/20*numOfCurBullet);
      float[] res= {
        x, y, bulletSpeedX, bulletSpeedY, 8, 1, 15
      };
      return res;
    }
  }
  );
  s[5]=new Cannon(500, width/2, 40, 5, 1, 0, 300, new Moving() {
    public float[] fire(int numOfCurBullet, float xL, float yL, float... other)
    {
      float x, y, bulletSpeedX, bulletSpeedY;
      x=xL;
      y=yL;
      bulletSpeedY=sin(-0.4*numOfCurBullet);
      bulletSpeedX=cos(0.4*numOfCurBullet);
      float[] res= {
        x, y, bulletSpeedX, bulletSpeedY, 3, 1
      };
      return res;
    }
  });
l=new Laser(400,100,0,200, new ForLaser(){
    public float[] fire(float koef, float xL, float yL, float from,float to, float start)
    {
      float x,y,xt=xL,yt=yL;
      float leng=400;
      x=xL;
      y=yL;
      if(koef>from && koef<to)
      {
        xt=xL+leng*cos(0.01*koef);
        yt=yL+leng*sin(0.01*koef);
        if(koef>=to-1)
        {
          koef=start;
          x=random(/*I.x-leng/2,I.x+leng/2*//*width);
          y=random(/*I.y-leng/2,I.y+leng/2*//*height);
          koef=acos((player.x-x)/leng)*100-1;
          if(player.y<y && player.x>x)koef+=157;
          else if(player.x>x && player.y>y)koef-=78.5;
          else if(player.x<x && player.y>y)koef+=78.5;
          from=koef-135;
          to=koef+45;
          start=koef-135;
        }
      }
      
      koef+=1;
      float[] res={x,y,xt,yt,koef,from,to,start};
      return res;
    }
  });

*/