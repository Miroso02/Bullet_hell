class Player extends GameObject {
  boolean isDead;
  Cannon gun;

  //----------- Constructor ---------------------------

  public Player(float x, float y, int size) {
    this.position = new PVector(x, y);
    this.size = size;

    isDead = false;

    gun = new Cannon();
    gun.setPosition(x, y);

    gun.addFCPattern(new FCPattern() {
      public void fire() {
         int num = this.bulletsCount;
        Bullet bullet = new Bullet();

        float bulletSpeedX = (num % 5 - 2) * 1.4;

        bullet.setPosition(player.getPosition().add(0, -5));
        bullet.setVelocity(bulletSpeedX, -30);
        bullet.size = 8;

        bullets.add(bullet);
      }

      public void setBulletColor() {}
    });
    gun.getFCPattern(0).shotCooldown = 4;
    gun.getFCPattern(0).bulletsPerShot = 5;
  }

  //--------- Multipurpose methods --------------------------

  @Override public void update() {
    move();
    fire();
    display();
  }

  //--------- Main methods ----------------------

  void move() {
    if (!isOnScreen()) stayOnTheScreen();

    if (mousePressed) {
      final float SENSITIVITY = 1;
      position.x += SENSITIVITY * (mouseX - pmouseX);
      position.y += SENSITIVITY * (mouseY - pmouseY);
    }
  }

  void fire() {
    gun.fire();
    gun.updateBullets();
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

  //---------- GETters and SETters ---------------------------------------------

}
