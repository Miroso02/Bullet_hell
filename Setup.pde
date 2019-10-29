void settings() {
  //fullScreen();
  size(720, 1280);
  noSmooth();
}

void setup() {
  /*
  * I'd highly recommend to set this:
  *   int num = this.numOfCurBullet;
  *   Bullet bullet = this.bullets[num];
  * in the start of FCPattern realisation
  */

  s[0] = new Cannon();
  s[0].setPosition(width / 2, height / 2 - 200);
  s[0].health = 100;

  s[0].addFCPattern(new FCPattern(700, true) {
    public void fire()
    {
      int num = this.numOfCurBullet;
      Bullet bullet = this.bullets[num];

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
  });
  s[0].getFCPattern(0).shotDelay = 50;
  s[0].getFCPattern(0).bulletsInShot = 100;

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

  s[1] = new Cannon();
  s[1].setPosition(width / 2, height / 2 - 200);

  s[1].addFCPattern(new FCPattern(700, true) {
    public void fire()
    {
      int num = this.numOfCurBullet;
      Bullet bullet = this.bullets[num];

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
  });
  s[1].getFCPattern(0).shotDelay = 50;
  s[1].getFCPattern(0).bulletsInShot = 100;

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

  test = new Cannon();
  test.setPosition(width / 2, 100);
  test.health = 500;

  test.addFCPattern(new FCPattern(400, true) {
    public void fire() {
      int num = this.numOfCurBullet;
      if (num < 80) return;
      Bullet bullet = this.bullets[num];

      int index = num % 4;
      PVector startPos = this.cannon.fcPatterns.get(1)
                          .getBullet(-index - 1).getPosition();

      bullet.setPosition(startPos);
      bullet.setVelocity(super.targetPlayerFrom(startPos));
      bullet.speed = (float)(int((num % 80) / 4) + 1) / 4 + 2;
      bullet.w = 10;
    }
    public void setBulletColor() {
      super.changeBulletColorHSB(5);
    }
  });
  test.getFCPattern(0).shotDelay = 80;
  test.getFCPattern(0).bulletsInShot = 80;

  test.addFCPattern(new FCPattern(30, true) {
    public void fire() {
      int num = this.numOfCurBullet;
      Bullet bullet = this.bullets[num];

      float speedX = (num % 4) - 1.5;

      bullet.setVelocity(speedX, 0);
      bullet.setPosition(this.cannon.getPosition());
      bullet.w = 15;
      bullet.speed = 3;
    }

    public void setBulletColor() {
      super.setBulletColor(color(255, 255, 0));
    }
  });
  test.getFCPattern(1).shotDelay = 80;
  test.getFCPattern(1).bulletsInShot = 4;

  //--------------------------------------------------------

  restartButton = new Button(width / 2 - 150, height / 2 + 50);
  restartButton.setOptions("Restart");
  player = new Player(width / 2, height - 100, 8);
}
