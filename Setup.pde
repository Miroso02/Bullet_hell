void settings() {
  //fullScreen();
  size(720, 1280);
  noSmooth();
}

void setup() {
  /*
  * I'd highly recommend to set this:
  *   int num = this.cannon.numOfCurBullet;
  *   Bullet bullet = this.cannon.bullets[num];
  * in the start of FCPattern realisation
  */

  s[0] = new Cannon(700, true);
  s[0].setPosition(width / 2, height / 2 - 200);
  s[0].health = 100;

  s[0].fcPattern = new FCPattern(s[0]) {
    public void fire()
    {
      int num = this.cannon.numOfCurBullet;
      Bullet bullet = this.cannon.bullets[num];

      float bulletSpeedX = 0;
      float bulletSpeedY = 0;
      int bulInShot = this.bulletsInShot;

      bulletSpeedX = 0.01 * (num % bulInShot + 15) * cos(1.06 * num);
      bulletSpeedY = 0.01 * (num % bulInShot + 15) * sin(1.06 * num);

      bullet.setPosition(this.cannon.getPosition());
      bullet.setVelocity(bulletSpeedX, bulletSpeedY);
      bullet.speed = 12;
    }
    
    public void setBulletColor() {
      int numOfCycles = 2;
      super.changeBulletColorHSB(numOfCycles);
    }
  };
  s[0].fcPattern.shotDelay = 50;
  s[0].fcPattern.bulletsInShot = 100;

  s[0].mPattern = new MPattern(s[0]) {
    public void move() {
      float x = width / 2;
      float y = height / 2 - 300;
      float radius = 200;
      int period = 300;
      float phase0 = 0;
      int time = this.getTime();

      super.rotateAround(x, y, radius, time, period, true, phase0);
    }
  };

  //---------------------------------------------------

  s[1] = new Cannon(700, true);
  s[1].setPosition(width / 2, height / 2 - 200);

  s[1].fcPattern = new FCPattern(s[1]) {
    public void fire()
    {
      int num = this.cannon.numOfCurBullet;
      Bullet bullet = this.cannon.bullets[num];

      float bulletSpeedX = 0;
      float bulletSpeedY = 0;
      int bulInShot = this.bulletsInShot;

      bulletSpeedX = 0.01 * (num % bulInShot + 15) * cos(1.06 * num);
      bulletSpeedY = -0.01 * (num % bulInShot + 15) * sin(1.06 * num);

      bullet.setPosition(this.cannon.getPosition());
      bullet.setVelocity(bulletSpeedX, bulletSpeedY);
      bullet.speed = 12;
    }
    
    public void setBulletColor() {
      int numOfCycles = 2;
      super.changeBulletColorHSB(numOfCycles);
    }
  };
  s[1].fcPattern.shotDelay = 50;
  s[1].fcPattern.bulletsInShot = 100;

  s[1].mPattern = new MPattern(s[1]) {
    public void move() {
      float x = width / 2;
      float y = height / 2 - 300;
      float radius = 200;
      int period = 300;
      float phase0 = 0;
      int time = this.getTime();

      super.rotateAround(x, y, radius, time, period, false, phase0);
    }
  };
  
  //--------------------------------------------------------

  test = new Cannon(100, true);
  test.setPosition(width / 2, 100);

  test.fcPattern = new FCPattern(test) {
    public void fire() {
      int num = this.cannon.numOfCurBullet;
      Bullet bullet = this.cannon.bullets[num];

      PVector startPos = this.cannon.getPosition();

      if (num % 2 == 0) {
        bullet.setPosition(startPos);
        bullet.w = 20;
        bullet.setVelocity(super.targetPlayerFrom(startPos));
      }
      else {
        PVector lastBulPos = this.cannon.getPrevBullet().getPosition();
        bullet.setPosition(lastBulPos);
        bullet.setVelocity(super.targetPlayerFrom(lastBulPos));
        bullet.w = 10;
      }

      bullet.speed = 8;
    }
    
    public void setBulletColor() {
      super.setBulletColor(color(255, 0, 0));
    }
  };
  test.fcPattern.shotDelay = 80;

  //--------------------------------------------------------

  restartButton = new Button(width / 2 - 150, height / 2 + 50);
  restartButton.setOptions("Restart");
  player = new Player(width / 2, height - 100, 8);
}
