void settings() {
  fullScreen();
}

void setup() {
  noSmooth();;
  
  //--------------------------------------------------------
  int bulletsNum = 700;

  s[0] = new Cannon(bulletsNum);
  s[0].setPosition(width / 2, height / 2 - 200);
  s[0].fireModule.shotDelay = 50;
  s[0].fireModule.bulletShotsAtOnce = 100;
  s[0].fireModule.firePattern = new FirePattern() {
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
      bullet.speed = 12;
      //bullet.ricochetModule.numOfRicochets = 1;
    }
  };
  s[0].moveModule.movePattern = new MovePattern() {
    public PVector move(float x, float y, int time) {
      x = width / 2;
      y = height / 2 - 300;
      float radius = 200;
      int period = 300;
      float phase0 = 0;
      
      return super.rotateAround(
        x, y, time, radius, period, true, phase0);
    }
  };
  s[0].bulletColPattern = new BulletColorPattern() {
    public void setBulletColor(Bullet bullet, int bulletNum, int bulletCount) {
      super.changeBulletColorHSB(bullet, bulletNum, bulletCount, 2);
    }
  };
  
  //---------------------------------------------------
  
  s[1] = new Cannon(bulletsNum);
  s[1].setPosition(width / 2, height / 2 - 200);
  s[1].fireModule.shotDelay = 50;
  s[1].fireModule.bulletShotsAtOnce = 100;
  s[1].fireModule.firePattern = new FirePattern() {
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
      bullet.speed = 12;
      //bullet.ricochetModule.numOfRicochets = 1;
    }
  };
  s[1].moveModule.movePattern = new MovePattern() {
    public PVector move(float x, float y, int time) {
      x = width / 2;
      y = height / 2 - 300;
      float radius = 200;
      int period = 300;
      float phase0 = 0;
      
      return super.rotateAround(
        x, y, time, radius, period, false, phase0);
    }
  };
  s[1].bulletColPattern = new BulletColorPattern() {
    public void setBulletColor(Bullet bullet, int bulletNum, int bulletCount) {
      super.changeBulletColorHSB(bullet, bulletNum, bulletCount, 2);
    }
  };
  
  //--------------------------------------------------------
  
  restartButton = new Button(width / 2 - 150, height / 2 + 50);
  restartButton.setParameters("Restart");
  player = new Player(width / 2, height - 100, 8);
}
