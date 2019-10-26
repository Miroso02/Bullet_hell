void settings() {
  fullScreen();
}

void setup() {
  noSmooth();;
  
  //--------------------------------------------------------
  int bulletsNum = 700;

  s[0] = new Cannon(bulletsNum);
  s[0].setPosition(width / 2, height / 2 - 200);
<<<<<<< HEAD
  s[0].health = 100;
  
=======
>>>>>>> 5e041f4c124e9b998cc7b44b71007383d9e21f37
  s[0].fireModule.shotDelay = 50;
  s[0].fireModule.bulletShotsAtOnce = 100;
  s[0].fireModule.firePattern = new FirePattern() {
    public void fire(Bullet bullet, int bulletNum, float cannonX, float cannonY)
    {
      float bulletSpeedX = 0;
      float bulletSpeedY = 0;
      
      bulletSpeedX = 0.01 * (bulletNum % 100 + 15) * cos(1.06 * bulletNum);
      bulletSpeedY = 0.01 * (bulletNum % 100 + 15) * sin(1.06 * bulletNum);
      
      bullet.setPosition(cannonX, cannonY);
      bullet.setVelocity(bulletSpeedX, bulletSpeedY);
      bullet.speed = 12;
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
      float bulletSpeedX = 0;
      float bulletSpeedY = 0;
      
      bulletSpeedX=0.01*(bulletNum%100+15)*cos(1.06*bulletNum);
      bulletSpeedY=-0.01*(bulletNum%100+15)*sin(1.06*bulletNum);
      
      bullet.setPosition(cannonX, cannonY);
      bullet.setVelocity(bulletSpeedX, bulletSpeedY);
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
  
<<<<<<< HEAD
  s[2] = new Cannon(400);
  s[2].setPosition(200, height / 2 - 300);
  s[2].health = 200;
  s[2].fireModule.shotDelay = 20;
  s[2].fireModule.bulletShotsAtOnce = 10;
  s[2].fireModule.firePattern = new FirePattern() {
    public void fire(Bullet bullet, int bulletNum, float cannonX, float cannonY)
    {
      float bulletSpeedX = 0;
      float bulletSpeedY = 0;
      
      PVector speedKoef = 
        super.targetPlayerFrom(cannonX, cannonY);
      
      float k = 0.6 + ((float)bulletNum % 10) / 10;
      bulletSpeedX = speedKoef.x * k;
      bulletSpeedY = speedKoef.y * k;
      
      bullet.setPosition(cannonX, cannonY);
      bullet.setVelocity(bulletSpeedX, bulletSpeedY);
      bullet.speed = 8;
      
      bullet.ricochetModule
        .setOptions(1, true, true, true);
    }
  };
  s[2].bulletColPattern = new BulletColorPattern() {
    public void setBulletColor(Bullet bullet, int bulletNum, int bulletCount) {
      super.changeBulletColorHSB(bullet, bulletNum, bulletCount, 2);
    }
  };
  
  //--------------------------------------------------------
  
  restartButton = new Button(width / 2 - 150, height / 2 + 50, 400, 100);
=======
  restartButton = new Button(width / 2 - 150, height / 2 + 50);
  restartButton.setParameters("Restart");
>>>>>>> 5e041f4c124e9b998cc7b44b71007383d9e21f37
  player = new Player(width / 2, height - 100, 8);
}
