void setup() {
  size(displayWidth, displayHeight);
  noSmooth();
  rectMode(CENTER);

  s[0] = new Cannon(700);
  s[0].setPosition(width / 2, height / 2 - 200);
  s[0].health = 100;
  s[0].shotDelay = 40;
  s[0].bulletShotsAtOnce = 100;
  s[0].firePattern = new FirePattern() {
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
      
      bullet.ricochetModule.numOfRicochets = 1;
    }
  };
  s[0].bulletColPattern = new BulletColorPattern() {
    public void setBulletColor(Bullet bullet, int bulletNum, int bulletCount) {
      super.changeBulletColorHSB(bullet, bulletNum, bulletCount, 2);
    }
  };
  
  //---------------------------------------------------
  
  s[1] = new Cannon(700);
  s[1].setPosition(width / 2, height / 2 - 200);
  s[1].health = 100;
  s[1].shotDelay = 40;
  s[1].bulletShotsAtOnce = 100;
  s[1].firePattern = new FirePattern() {
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
      bullet.ricochetModule.numOfRicochets = 1;
    }
  };
  s[1].bulletColPattern = new BulletColorPattern() {
    public void setBulletColor(Bullet bullet, int bulletNum, int bulletCount) {
      super.changeBulletColorHSB(bullet, bulletNum, bulletCount, 2);
    }
  };
  
  restartButton = new Button(width / 2 - 150, height / 2 + 50, 400, 100);
  player = new Player(width / 2, height - 100, 8);
}