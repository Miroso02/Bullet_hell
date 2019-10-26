class Cannon {
  // TODO: Rewrite this class:
  //         1) Create link to cannon in patterns
  //         2) Move module content to patterns

  Bullet[] bullets;
  int numOfCurBullet;
  int bulletsCount;

  float x;
  float y;
  int health;

  boolean isDead;
  boolean isKillingPlayer;

  BulletColorPattern bulletColPattern;
  MovePattern movePattern;
  FireModule fireModule;

  //----------- Constructor --------------------------------------

  public Cannon(int bulletsCount) {
    bullets = new Bullet[bulletsCount];
    this.bulletsCount = bulletsCount;

    // Default values
    this.setPosition(width / 2, height / 2);

    health = 100;

    isKillingPlayer = true;
    isDead = false;

    // Default color pattern realisation do nothing
    bulletColPattern = new BulletColorPattern() {
      public void setBulletColor(Bullet b, int n, int c) {
        b.col = color(255);
      }
    };
    movePattern = new MovePattern(null) {
      public void move(int t) {}
    };

    for (int i = 0; i < bulletsCount; i++) {
      bullets[i] = new Bullet();
    }

    fireModule = new FireModule();
  }

  //--------- Multipurpose methods --------------------------

  public void update() {
    if (!isDead) {
      //takeDamage();
      fire();
      move();
      display();
    }
    updateBullets();
  }

  //--------- Main methods --------------------------------

  private void updateBullets() {
    if (isKillingPlayer) {
      for (Bullet bullet: bullets) {
        bullet.update();
      }
    } else {
      for (Bullet bullet: bullets) {
        bullet.updatePeacefully();
      }
    }
  }

  void fire() {
    fireModule.fire();
  }

  void move() {
    movePattern.move();
  }

  void display() {
    noFill();
    strokeWeight(1);
    stroke(200, 0, 255);
    rectMode(CENTER);
    rect(x, y, 40, 40);
    rectMode(CORNER);

    fill(200, 0, 255);
    textSize(20);
    textAlign(CENTER);
    text(health, x, y);
    textAlign(LEFT, TOP);
  }

  void takeDamage()
  {
    for (Bullet bullet: player.playerGun.bullets) {
      if (hit(bullet)) {
        health--;
        bullet.x = 2000;
      }
    }

    if (health <= 0) {
      isDead = true;
    }
  }

  //--------- Private inner methods -------------------------

  private boolean hit(Bullet bullet) {
    return (bullet.y - bullet.w < y + 20 - 2
         && bullet.x + bullet.w > x - 20
         && bullet.x - bullet.w < x + 20
         && bullet.y + bullet.w > y - 20 + 2);
  }

  //--------- GETters / SETters ----------------------

  void setPosition(float x, float y) {
    this.x = x;
    this.y = y;
  }
  void setPosition(PVector newPosition) {
    this.x = newPosition.x;
    this.y = newPosition.y;
  }
  PVector getPosition() {
    return new PVector(x, y);
  }

  //------------ Modules -------------------------------
  //----------- Fire module ----------------------------

  private class FireModule {
    private int shotDelayCounter = 0;
    int shotDelay;
    int bulletShotsAtOnce;

    FirePattern firePattern;

    public FireModule() {
      shotDelay = 3;
      bulletShotsAtOnce = 1;

      firePattern = new FirePattern(null) {
        public void fire(Bullet b, int n) {}
      };
    }

    void fire() {
      if (shotCooldown()) {
        for (int i = 0; i < bulletShotsAtOnce; i++) {
          int bNum = nextBulNum();
          Bullet bullet = bullets[bNum];
          firePattern.fire(bullet, bNum);
          bulletColPattern.setBulletColor(bullet, bNum, bulletsCount);
        }
      }
    }

    private int nextBulNum() {
      if (numOfCurBullet < bulletsCount - 1) {
        return numOfCurBullet++;
      } else {
        return numOfCurBullet = 0;
      }
    }

    private boolean shotCooldown() {
      if (shotDelayCounter > shotDelay) {
        shotDelayCounter = 2;
        return true;
      }
      shotDelayCounter++;
      return false;
    }
  }
}
