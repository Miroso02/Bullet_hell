class Cannon extends GameObject {
  int health;
  boolean isDead;

  MPattern mPattern;
  private ArrayList<FCPattern> fcPatterns = new ArrayList<FCPattern>();

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
      move();
      fire();
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
    mPattern.wrappedMove();
  }

  void display() {
    noFill();
    strokeWeight(1);
    stroke(200, 0, 255);
    rect(position.x, position.y, size, size);

    fill(200, 0, 255);
    textSize(20);
    text(health, position.x, position.y); // TODO: Fix text display
  }

  void takeDamage() {
    ArrayList<Bullet> playerBullets = new ArrayList<Bullet>();
    for (FCPattern fcp: player.gun.fcPatterns) {
      playerBullets.addAll(fcp.bullets);
    }

    for (Bullet bullet: playerBullets) {
      if (isTouching(bullet)) {
        health--;
        bullet.position.x = 2000;
      }
    }

    if (health <= 0) {
      isDead = true;
    }
  }

  //--------- Private inner methods -------------------------

  //--------- GETters / SETters ----------------------

  void addFCPattern(FCPattern newPattern) {
    newPattern.cannon = this;
    fcPatterns.add(newPattern);
  }
  FCPattern getFCPattern(int index) {
    return fcPatterns.get(index);
  }
}
