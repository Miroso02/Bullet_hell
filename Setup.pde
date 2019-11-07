void settings() {
  //fullScreen();
  size(720, 1280);
  noSmooth();
}

void setup() {
  s[0] = new Cannon();
  s[0].setPosition(width / 2, height / 2 - 200);
  s[0].health = 100;

  s[0].addFCPattern(new FCPattern() {
    public void fire()
    {
      int num = this.bulletsCount;
      Bullet bullet = new ABullet();

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
      
      bullets.add(bullet);
    }

    public void setBulletColor() {
      int numOfCycles = 300;
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
      int time = this.time;

      super.rotateAround(x, y, radius, time, period, true, phase0);
    }
  });

  //---------------------------------------------------

  s[1] = new Cannon();
  s[1].setPosition(width / 2, height / 2 - 200);

  s[1].addFCPattern(new FCPattern() {
    public void fire()
    {
      int num = this.bulletsCount;
      Bullet bullet = new ABullet();

      float bulletSpeedX = 0;
      float bulletSpeedY = 0;
      int bulInShot = this.bulletsPerShot;

      bulletSpeedX = 0.01 * (num % bulInShot + 15) * cos(1.06 * num);
      bulletSpeedY = -0.01 * (num % bulInShot + 15) * sin(1.06 * num);

      bullet.setPosition(this.gameObject.getPosition());
      
      /*bullet.setMPattern(new MPattern() {
        public void move() {
          super.moveWithConstSpeedAndRicochet();
        }
      });*/
      bullet.mPattern.setVelocity(bulletSpeedX, bulletSpeedY);
      bullet.mPattern.speed = 12;
      //bullet.mPattern.ricochetModule.setOptions(1, true, true, true);

      bullets.add(bullet);
    }

    public void setBulletColor() {
      int numOfCycles = 300;
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
      int time = this.time;

      super.rotateAround(x, y, radius, time, period, false, phase0);
    }
  });

  //--------------------------------------------------------

  test = new Cannon();
  test.setPosition(width / 2, height / 2 - 200);
  test.health = 500;
  test.setColor(0, 255, 200);

  test.addFCPattern(new FCPattern() {
    public void fire() {
      Bullet bullet = new ABullet();

      bullet.size = 20;
      bullet.mPattern.speed = 5;
      bullet.setPosition(this.gameObject.getPosition());
      bullet.mPattern.setVelocity(super.shootToAllSides());

      bullets.add(bullet);
    }

    public void setBulletColor() {
      super.setColorOfAllShot(color(0, 255, 0));
    }
  });
  test.getFCPattern(0).setOptions(60, 8);

  test.addFCPattern(new FCPattern() {
    public void fire() {
      int num = this.bulletsCount % 48;
      Bullet bullet = new ABullet();

      Bullet zeroBul = ((Cannon)gameObject).getFCPattern(0).getBullet(num % 8 + 1);
      PVector zeroBulPos = zeroBul.getPosition();

      bullet.setPosition(zeroBulPos);
      bullet.mPattern.setVelocity(super.targetPlayerFrom(zeroBulPos));
      bullet.size = 10;
      bullet.mPattern.speed = 5 + (num - num % 8) / 8;

      bullets.add(bullet);

      if (num > 39) zeroBul.setPosition(2000, 0);
    }

    public void setBulletColor() {
      super.changeBulletColorHSB(48 * 6);
    }
  });
  test.getFCPattern(1).setOptions(60, 48);
  test.getFCPattern(1).setTimeCounter(-50);

  //--------------------------------------------------------

  player = new Player();
  restartButton = new Button(width / 2 - 150, height / 2 + 50);
  restartButton.setOptions("Restart");

  rectMode(CENTER);
  textAlign(CENTER);

  mouseX = 0;
  mouseY = 0;
}
