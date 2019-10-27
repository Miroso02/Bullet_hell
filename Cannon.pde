class Cannon {
  Bullet[] bullets;
  int numOfCurBullet;
  int bulletsCount;

  float x;
  float y;
  int health;

  boolean isDead;
  boolean isKillingPlayer;

  MovePattern movePattern;
  FirePattern firePattern;

  //----------- Constructor --------------------------------------

  public Cannon(int bulletsCount) {
    bullets = new Bullet[bulletsCount];
    this.bulletsCount = bulletsCount;

    // Default values
    this.setPosition(width / 2, height / 2);
    health = 100;
    isKillingPlayer = true;

    numOfCurBullet = 0;
    isDead = false;

    for (int i = 0; i < bulletsCount; i++) {
      bullets[i] = new Bullet();
    }

    // Default move pattern and fire pattern realisations do nothing
    movePattern = new MovePattern(this) {
      public void move() {}
    };
    firePattern = new FirePattern(this) {
      public void fire() {}
    };
  }

  //--------- Multipurpose methods --------------------------

  public void update() {
    if (!isDead) {
      //takeDamage(); // Comment this in test mode
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
    firePattern.fireAndColorize();
  }

  void move() {
    movePattern._move();
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

  void takeDamage() {
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

  Bullet getPrevBullet() {
    if (numOfCurBullet > 0) {
      return bullets[numOfCurBullet - 1];
    } else {
      return bullets[bulletsCount - 1];
    }
  }
}
