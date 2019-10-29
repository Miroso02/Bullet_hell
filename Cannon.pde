class Cannon {
  Bullet[] bullets;
  int numOfCurBullet;
  int bulletsCount;

  PVector position;
  int health;

  boolean isDead;

  MPattern mPattern;
  FCPattern fcPattern;

  //----------- Constructor --------------------------------------

  public Cannon(int bulletsCount, boolean isKillingPlayer) {
    bullets = new Bullet[bulletsCount];
    this.bulletsCount = bulletsCount;

    // Default values
    this.position = new PVector(width / 2, height / 2);
    health = 100;

    numOfCurBullet = 0;
    isDead = false;

    if (isKillingPlayer) {
      for (int i = 0; i < bulletsCount; i++) {
        bullets[i] = new ABullet();
      }
    } else {
      for (int i = 0; i < bulletsCount; i++) {
        bullets[i] = new Bullet();
      }
    }

    // Default move pattern and fire pattern realisations do nothing
    mPattern = new MPattern(this) {
      public void move() {}
    };
    fcPattern = new FCPattern(this) {
      public void fire() {}
      public void setBulletColor() {}
    };
  }

  //--------- Multipurpose methods --------------------------

  public void update() {
    if (!isDead) {
      takeDamage(); // Comment this in test mode
      fire();
      move();
      display();
    }
    updateBullets();
  }

  //--------- Main methods --------------------------------

  private void updateBullets() {
    for (Bullet bullet: bullets) {
      bullet.update();
    }
  }

  void fire() {
    fcPattern.fireAndColorize();
  }

  void move() {
    mPattern._move();
  }

  void display() {
    noFill();
    strokeWeight(1);
    stroke(200, 0, 255);
    rectMode(CENTER);
    rect(position.x, position.y, 40, 40);
    rectMode(CORNER);

    fill(200, 0, 255);
    textSize(20);
    textAlign(CENTER);
    text(health, position.x, position.y);
    textAlign(LEFT, TOP);
  }

  void takeDamage() {
    for (Bullet bullet: player.playerGun.bullets) {
      if (hit(bullet)) {
        health--;
        bullet.position.x = 2000;
      }
    }

    if (health <= 0) {
      isDead = true;
    }
  }

  //--------- Private inner methods -------------------------

  private boolean hit(Bullet bullet) {
    return (position.dist(bullet.position) < bullet.w + 20);
  }

  //--------- GETters / SETters ----------------------

  void setPosition(float x, float y) {
    this.position.set(x, y);
  }
  void setPosition(PVector newPosition) {
    this.position = newPosition.copy();
  }
  PVector getPosition() {
    return position.copy();
  }

  Bullet getPrevBullet() {
    if (numOfCurBullet > 0) {
      return bullets[numOfCurBullet - 1];
    } else {
      return bullets[bulletsCount - 1];
    }
  }
}
