void settings() {
  //fullScreen();
  size(720, 1280);
  noSmooth();
}

void setup() {
  cannons = new ArrayList<Cannon>();

  Cannon c1 = new Cannon();
  cannons.add(c1);
  c1.setPosition(width / 2, height / 2 - 200);
  c1.health = 100;

  c1.addFCPattern(new FCPattern() {
    public void fire()
    {
      int num = this.bulletsCount;
      Bullet bullet = new ABullet();
      bullets.add(bullet);

      float bulletSpeedX = 0;
      float bulletSpeedY = 0;
      int bulInShot = this.bulletsPerShot;

      bulletSpeedX = cos(1.06 * num);
      bulletSpeedY = sin(1.06 * num);

      bullet.setPosition(this.gameObject.getPosition());

      bullet.setMPattern(new MPattern() {
        public void move() {
          super.moveWithConstSpeedAndRicochet();
        }
      });

      bullet.mPattern.setVelocity(bulletSpeedX, bulletSpeedY);
      bullet.mPattern.speed = 0.12 * (num % bulInShot + 15);

      int numOfCycles = 300;
      super.changeBulletColorHSB(numOfCycles);
    }
  });
  c1.getFCPattern(0).setOptions(50, 100);

  c1.setMPattern(new MPattern() {
    public void move() {
      float x = width / 2;
      float y = height / 2 - 300;
      float radius = 200;
      int period = 300;
      float phase0 = 0;

      super.rotateAround(x, y, radius, period, true, phase0);
    }
  });

  //----------------------------------------------------------------------------

  Cannon c2 = new Cannon();
  cannons.add(c2);
  c2.setPosition(width / 2, height / 2 - 200);

  c2.addFCPattern(new FCPattern() {
    public void fire()
    {
      int num = this.bulletsCount;
      Bullet bullet = new ABullet();
      bullets.add(bullet);

      float bulletSpeedX = 0;
      float bulletSpeedY = 0;
      int bulInShot = this.bulletsPerShot;

      bulletSpeedX = cos(1.06 * num);
      bulletSpeedY = -sin(1.06 * num);

      bullet.setPosition(this.gameObject.getPosition());

      bullet.mPattern.setVelocity(bulletSpeedX, bulletSpeedY);
      bullet.mPattern.speed = 0.12 * (num % bulInShot + 15);

      int numOfCycles = 300;
      super.changeBulletColorHSB(numOfCycles);
    }
  });
  c2.getFCPattern(0).setOptions(50, 100);

  c2.setMPattern(new MPattern() {
    public void move() {
      float x = width / 2;
      float y = height / 2 - 300;
      float radius = 200;
      int period = 300;
      float phase0 = 0;

      super.rotateAround(x, y, radius, period, false, phase0);
    }
  });

  //----------------------------------------------------------------------------

  test = new Cannon();
  test.setPosition(width / 2, height / 2 - 200);
  test.health = 500;
  test.setColor(0, 255, 200);

  test.addFCPattern(new FCPattern() {
    public void fire() {
      Bullet bullet = new ABullet();
      bullets.add(bullet);

      bullet.size = 20;
      bullet.setPosition(this.gameObject.getPosition());
      bullet.mPattern.setVelocity(super.shootToAllSides());
      bullet.mPattern.speed = 5;

      super.setColorOfAllShot(color(0, 255, 0));
    }
  });
  test.getFCPattern(0).setOptions(60, 8);

  test.addFCPattern(new FCPattern() {
    public void fire() {
      int num = this.bulletsCount % 48;
      Bullet bullet = new ABullet();
      bullets.add(bullet);

      Bullet zeroBul = ((Cannon)gameObject).getFCPattern(0).getBullet(num % 8);
      PVector zeroBulPos = zeroBul.getPosition();

      bullet.setPosition(zeroBulPos);
      bullet.mPattern.setVelocity(super.targetPlayerFrom(zeroBulPos));
      bullet.size = 10;
      bullet.mPattern.speed = 5 + (num - num % 8) / 8;

      super.changeBulletColorHSB(48 * 6);

      if (num > 39) zeroBul.setPosition(2000, 0);
    }
  });
  test.getFCPattern(1).setOptions(60, 48);
  test.getFCPattern(1).setTimeCounter(-50);

  //----------------------------------------------------------------------------

  player = new Player();
  restartButton = new Button(width / 2 - 150, height / 2 + 50);
  restartButton.setOptions("Restart");

  rectMode(CENTER);
  textAlign(CENTER);

  mouseX = 0;
  mouseY = 0;
}
