class Cannon extends GameObject {
  int health;
  boolean isDead;

  protected ArrayList<FCPattern> fcPatterns = new ArrayList<FCPattern>();

  //----------- Constructor --------------------------------------

  public Cannon() {
    // Default values
    this.position = new PVector(width / 2, height / 2);
    this.size = 40;
    this.col = color(200, 0, 255);
    health = 100;

    isDead = false;

    // Default move pattern realisation does nothing
    setMPattern(new MPattern() {
      public void move() {}
    });
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

  protected void updateBullets() {
    for (FCPattern fc: fcPatterns) {
      fc.updateBullets();
    }
  }

  void fire() {
    for (FCPattern fc: fcPatterns) {
      fc.fireAndColorize();
    }
  }

  void display() {
    noFill();
    strokeWeight(1);
    stroke(col);
    rect(position.x, position.y, size, size);

    fill(col);
    textSize(20);
    text(health, position.x, position.y); // TODO: Fix text display
  }

  void takeDamage() {
    ArrayList<Bullet> playerBullets = new ArrayList<Bullet>();
    for (FCPattern playerFCP: player.fcPatterns) {
      playerBullets.addAll(playerFCP.bullets);
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

  //--------- GETters / SETters ----------------------

  void addFCPattern(FCPattern newPattern) {
    newPattern.gameObject = this;
    fcPatterns.add(newPattern);
  }
  FCPattern getFCPattern(int index) {
    return fcPatterns.get(index);
  }
}
