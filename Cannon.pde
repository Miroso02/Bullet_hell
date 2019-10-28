class Cannon {
  Bullet[] bullets;
  int numOfCurBullet;
  int bulletsCount;

  PVector position;
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
    this.position = new PVector(width / 2, height / 2);
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
      takeDamage(); // Comment this in test mode
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
