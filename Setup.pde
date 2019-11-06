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

  s[0].addFCPattern(new AFCPattern(700) {
    public void fire()
    {
      int num = this.numOfCurBullet;
      Bullet bullet = this.bullets[num];

      float bulletSpeedX = 0;
      float bulletSpeedY = 0;
      int bulInShot = this.bulletsPerShot;

      bulletSpeedX = 0.01 * (num % bulInShot + 15) * cos(1.06 * num);
      bulletSpeedY = 0.01 * (num % bulInShot + 15) * sin(1.06 * num);

      bullet.setPosition(this.gameObject.getPosition());

      bullet.setMPattern(new MPattern() {
        public void move() {
          super.moveWithConstSpeedAndRicochet();
        }
      });

      bullet.mPattern.setVelocity(bulletSpeedX, bulletSpeedY);
      bullet.mPattern.speed = 12;
      bullet.mPattern.ricochetModule.setOptions(1, true, true, true);
    }

    public void setBulletColor() {
      int numOfCycles = 2;
      super.changeBulletColorHSB(numOfCycles);
    }
  });
  s[0].getFCPattern(0).setOptions(50, 100);

  s[0].setMPattern(new MPattern() {
    public void move() {
      float x = width / 2;
      float y = height / 2 - 300;
      float radius = 200;
      int period = 300;
      float phase0 = 0;
      int time = this.getTime();

      super.rotateAround(x, y, radius, time, period, true, phase0);
    }
  });

  //---------------------------------------------------

  s[1] = new Cannon();
  s[1].setPosition(width / 2, height / 2 - 200);

  s[1].addFCPattern(new AFCPattern(700) {
    public void fire()
    {
      int num = this.numOfCurBullet;
      Bullet bullet = this.bullets[num];

      float bulletSpeedX = 0;
      float bulletSpeedY = 0;
      int bulInShot = this.bulletsPerShot;

      bulletSpeedX = 0.01 * (num % bulInShot + 15) * cos(1.06 * num);
      bulletSpeedY = -0.01 * (num % bulInShot + 15) * sin(1.06 * num);

      bullet.setPosition(this.gameObject.getPosition());
      bullet.mPattern.setVelocity(bulletSpeedX, bulletSpeedY);
      bullet.mPattern.speed = 12;
    }

    public void setBulletColor() {
      int numOfCycles = 2;
      super.changeBulletColorHSB(numOfCycles);
    }
  });
  s[1].getFCPattern(0).setOptions(50, 100);

  s[1].setMPattern(new MPattern() {
    public void move() {
      float x = width / 2;
      float y = height / 2 - 300;
      float radius = 200;
      int period = 300;
      float phase0 = 0;
      int time = this.getTime();

      super.rotateAround(x, y, radius, time, period, false, phase0);
    }
  });

  //--------------------------------------------------------

  test = new Cannon();
  test.setPosition(width / 2, 100);
  test.health = 500;

  test.addFCPattern(new AFCPattern(100) {
    public void fire() {
      int num = this.numOfCurBullet;
      Bullet bullet = this.getCurBullet();

      PVector startPos = this.gameObject.getPosition();
      bullet.setPosition(startPos);
      bullet.mPattern.setVelocity(super.targetPlayerFrom(startPos));
      bullet.size = 13;
      bullet.mPattern.speed = 5;
      bullet.ricochetModule.setOptions(1, true, false, true);
    }

    public void setBulletColor() {
      bullets[numOfCurBullet].col = color(0, 255, 0);
    }
  });
  test.getFCPattern(0).setOptions(10, 1);

  //--------------------------------------------------------

  player = new Player(width / 2, height - 100, 8);
  restartButton = new Button(width / 2 - 150, height / 2 + 50);
  restartButton.setOptions("Restart");

  rectMode(CENTER);
  textAlign(CENTER);

  mouseX = 0;
  mouseY = 0;
}
