class Player {
  float x;
  float y;
  PVector position;
  int size;

  boolean isDead;

  Cannon playerGun;

  //----------- Constructor ---------------------------

  public Player(float x, float y, int size) {
    this.x = x;
    this.y = y;
    this.position = new PVector(x, y);
    this.size = size;

    isDead = false;

    playerGun = new Cannon(80, false);
    playerGun.setPosition(x, y);

    playerGun.fcPattern = new FCPattern(playerGun) {
      public void fire() {
        int num = this.cannon.numOfCurBullet;
        Bullet bullet = this.cannon.bullets[num];

        float bulletSpeedX = (num % 5 - 2) * 1.4;

        bullet.setPosition(player.getPosition().add(0, -5));
        bullet.setVelocity(bulletSpeedX, -30);
        bullet.w = 8;
      }
      
      public void setBulletColor() {};
    };
    playerGun.fcPattern.shotDelay = 4;
    playerGun.fcPattern.bulletsInShot = 5;
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
      position.x += sensitivity * (mouseX - pmouseX);
      position.y += sensitivity * (mouseY - pmouseY);
    }
  }

  void fire() {
    playerGun.fire();
    playerGun.updateBullets();
  }

  void display() {
    noStroke();
    fill(255);
    ellipse(position.x, position.y, size, size);
  }

  //------- Private inner methods --------------------

  private void stayOnTheScreen() {
    if (position.x <= 0) position.x = 1;
    else if (position.x >= width) position.x = width - 1;
    if (position.y <= 0) position.y = 1;
    else if (position.y >= height) position.y = height - 1;
  }

  private boolean isOnTheScreen() {
    return (position.x > 0 && position.x < width &&
            position.y > 0 && position.y < height);
  }

//---------- GETters and SETters -----------------------------------------------

  PVector getPosition() {
    return position.copy();
  }

  float getDistTo(PVector to) {
    return position.dist(to);
  }
}
