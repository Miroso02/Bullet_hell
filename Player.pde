class Player extends Cannon {

  //----------- Constructor ----------------------------------------------------

  public Player() {
    this.position = new PVector(width / 2, height / 2 + 200);

    this.size = 8;
    isDead = false;

    addFCPattern(new FCPattern() {
      public void fire() {
         int num = this.bulletsCount;
        Bullet bullet = new Bullet();

        float bulletSpeedX = (num % 5 - 2) * 1.4;

        bullet.setPosition(player.getPosition().add(0, -5));
        bullet.mPattern.setVelocity(bulletSpeedX, -30);
        bullet.size = 8;

        bullets.add(bullet);
      }
    });
    getFCPattern(0).shotCooldown = 4;
    getFCPattern(0).bulletsPerShot = 5;

    setMPattern(new MPattern() {
      public void move() {
        if (mousePressed) {
          final float SENSITIVITY = 1;
          PVector pos = gameObject.getPosition();

          pos.x += SENSITIVITY * (mouseX - pmouseX);
          pos.y += SENSITIVITY * (mouseY - pmouseY);

          gameObject.setPosition(pos);
        }
      }
    });
  }

  //--------- Multipurpose methods ---------------------------------------------

  @Override public void update() {
    if (!isDead) {
      move();
      fire();
      display();
      updateBullets();
    }
  }

  //--------- Main methods -----------------------------------------------------

  void move() {
    if (!isOnScreen()) stayOnTheScreen();
    super.move();
  }

  void display() {
    noStroke();
    fill(255);
    ellipse(position.x, position.y, size, size);
  }

  //------- Private inner methods ----------------------------------------------

  private void stayOnTheScreen() {
    if (position.x <= 0) position.x = 1;
    else if (position.x >= width) position.x = width - 1;
    if (position.y <= 0) position.y = 1;
    else if (position.y >= height) position.y = height - 1;
  }
}
