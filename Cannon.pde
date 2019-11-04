class Cannon extends GameObject {
  int health;
  boolean isDead;

  MPattern mPattern;
  ArrayList<FCPattern> fcPatterns = new ArrayList<FCPattern>();

  //----------- Constructor --------------------------------------

  public Cannon() {
    // Default values
    this.position = new PVector(width / 2, height / 2);
    this.size = 40;
    health = 100;

    isDead = false;

    // Default move pattern realisations do nothing
    mPattern = new MPattern(this) {
      public void move() {}
    };
  }

  //--------- Multipurpose methods --------------------------

  @Override public void update() {
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
    for (FCPattern fc: fcPatterns) {
      fc.updateBullets();
    }
  }

  void fire() {
    for (FCPattern fc: fcPatterns) {
      fc.fireAndColorize();
    }
  }

  void move() {
    mPattern._move();
  }

  void display() {
    noFill();
    strokeWeight(1);
    stroke(200, 0, 255);
    rectMode(CENTER);
    rect(position.x, position.y, size, size);
    rectMode(CORNER);

    fill(200, 0, 255);
    textSize(20);
    textAlign(CENTER);
    text(health, position.x, position.y);
    textAlign(LEFT, TOP);
  }

  void takeDamage() {
    for (Bullet bullet: player.playerGun.getFCPattern(0).bullets) {
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
    return (position.dist(bullet.position) < bullet.size + size / 2);
  }

  //--------- GETters / SETters ----------------------

  void addFCPattern(FCPattern newPattern) {
    newPattern.cannon = this;
    fcPatterns.add(newPattern);
  }
  FCPattern getFCPattern(int index) {
    return fcPatterns.get(index);
  }
}
