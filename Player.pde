class Player {
  float x;
  float y;
  int size;

  boolean isDead;

  Cannon playerGun;

  //----------- Constructor ---------------------------

  public Player(float x, float y, int size) {
    this.x = x;
    this.y = y;
    this.size = size;

    isDead = false;

    playerGun = new Cannon(150);
    playerGun.setPosition(x, y);
    playerGun.isKillingPlayer = false;

    playerGun.firePattern = new FirePattern(playerGun) {
      public void fire() {
        int num = this.cannon.numOfCurBullet;
        Bullet bullet = this.cannon.bullets[num];

        float bulletSpeedX = (num % 5 - 2) * 1.4;

        bullet.setPosition(player.x, player.y - 5);
        bullet.setVelocity(bulletSpeedX, -30);
        bullet.w = 8;
      }
    };
    playerGun.firePattern.shotDelay = 4;
    playerGun.firePattern.bulletsInShot = 5;
  }

  //--------- Multipurpose methods --------------------------

  public void update() {
    move();
    fire();
    display();
  }

  //--------- Main methods ----------------------

  void move() {
    if (!isOnTheScreen()) stayOnTheScreen();

    if (mousePressed) {
      float sensitivity = 1;
      x += sensitivity * (mouseX - pmouseX);
      y += sensitivity * (mouseY - pmouseY);
    }
  }

  void fire() {
    playerGun.fire();
    playerGun.updateBullets();
  }

  void display() {
    noStroke();
    fill(255);
    ellipse(x, y, size, size);
  }

  //------- Private inner methods --------------------

  private void stayOnTheScreen() {
    if (x <= 0) x = 1;
    else if (x >= width) x = width - 1;
    if (y <= 0) y = 1;
    else if (y >= height) y = height - 1;
  }

  private boolean isOnTheScreen() {
    return (x > 0 && x < width &&
            y > 0 && y < height);
  }
}
