void setup() {
  size(displayWidth, displayHeight);
  noSmooth();
  rectMode(CENTER);

  s[0]=new Cannon(width/2, height/2-200, 100, 1000, 40, 100, 0, true, new FirePattern() {
    public void fire(Bullet bullet, int bulletNum, float cannonX, float cannonY)
    {
      float x = 2000;
      float y = 0;
      float bulletSpeedX = 0;
      float bulletSpeedY = 0;
      
      x = cannonX;
      y = cannonY;
      bulletSpeedX=0.01*(bulletNum%100+15)*cos(1.06*bulletNum);
      bulletSpeedY=0.01*(bulletNum%100+15)*sin(1.06*bulletNum);
      
      bullet.x = x;
      bullet.y = y;
      bullet.speedX = bulletSpeedX;
      bullet.speedY = bulletSpeedY;
      bullet.speed = 14;
      
    //  bullet.ricochetModule.numOfRicochets = 1;
    }
    
    public void setBulletColor(Bullet bullet, int bulletNum, int bulletCount) {
      super.changeBulletColorHSB(bullet, bulletNum, bulletCount, 2);
    }
  }
  );
  s[1]=new Cannon(width/2, height/2-200, 100, 1000, 40, 100, 0, true, new FirePattern() {
    public void fire(Bullet bullet, int bulletNum, float cannonX, float cannonY)
    {
      float x = 2000;
      float y = 0;
      float bulletSpeedX = 0;
      float bulletSpeedY = 0;
      
      x = cannonX;
      y = cannonY;
      bulletSpeedX=0.01*(bulletNum%100+15)*cos(1.06*bulletNum);
      bulletSpeedY=-0.01*(bulletNum%100+15)*sin(1.06*bulletNum);
      
      bullet.x = x;
      bullet.y = y;
      bullet.speedX = bulletSpeedX;
      bullet.speedY = bulletSpeedY;
      bullet.speed = 14;
     // bullet.ricochetModule.numOfRicochets = 1;
    }
    
    public void setBulletColor(Bullet bullet, int bulletNum, int bulletCount) {
      super.changeBulletColorHSB(bullet, bulletNum, bulletCount, 2);
    }
  }
  );
  //              x        y    hp   bull 
  s[2]=new Cannon(width/2, 100, 100, 600, 3, 4, 0, true, new FirePattern() {
    public void fire(Bullet bullet, int bulletNum, float cannonX, float cannonY)
    {
      float x = 2000;
      float y = 0;
      float bulletSpeedX = 0;
      float bulletSpeedY = 0;
      
      float m=-120+80*(bulletNum%4);
      x = cannonX - m;
      y = cannonY;
      /*float tx=player.x - x, ty=player.y - y;
      float sqt = sqrt(sq(tx) + sq(ty)) / 1.2;
      bulletSpeedX = tx / sqt;
      bulletSpeedY = ty / sqt;*/
      float k = 1 + 0.3*sin(PI*(float)bulletNum/200);
      float k2 = 25*sin(HALF_PI*(float)bulletNum/2);
      bulletSpeedY = k * abs(0.8*cos(PI*bulletNum/(100)))+0.2;
      bulletSpeedX = k * sin(PI*bulletNum/(100));
      
      bullet.x = x;
      bullet.y = y;
      bullet.speedX = bulletSpeedX;
      bullet.speedY = bulletSpeedY;
      bullet.speed = 5;
      bullet.w = 15;
      
      bullet.ricochetModule.numOfRicochets = 1;
    }
    
    public void setBulletColor(Bullet bullet, int bulletNum, int bulletCount) {
      bullet.col = color(255, 255, 0);
    }
  }
  );
  
  s[3] = new Cannon(width / 2, 100, 200, 300, 3, 2, 0, true, new FirePattern() {
    public void fire(Bullet bullet, int bulletNum, float cannonX, float cannonY) {
      float direct = (bulletNum % 2 - 0.5) * 2;
      float x = cannonX + direct * 50;
      float y = cannonY + 5;
      float speedX = direct * cos(PI * bulletNum / 30);
      float speedY = 0.5 + abs(0.5 * sin(PI * bulletNum / 30));
      
      bullet.x = x;
      bullet.y = y;
      bullet.speedX = speedX;
      bullet.speedY = speedY;
      bullet.speed = 10;
      bullet.w = 15;
      
      bullet.ricochetModule.numOfRicochets = 2;
      bullet.ricochetModule.ricochetWALLS = true;
      bullet.ricochetModule.ricochetDOWN = true;
    }
    
    public void setBulletColor(Bullet bullet, int bulletNum, int bulletCount) {
      super.changeBulletColorHSB(bullet, bulletNum, bulletCount, 4);
    }
  });
  
  restartButton = new Button(width / 2 - 150, height / 2 + 50, 400, 100);
  player = new Player(width / 2, height - 100, 8);
}