class FCPatternBase extends PatternBase {
  int shotCooldown;
  int bulletsPerShot;

  ArrayList<Bullet> bullets;
  
  //--------------- Main methods -----------------------------------------------

  protected void updateBullets() {
    for (Bullet bullet: bullets) {
      bullet.update();
    }
    killUselessBullets();
  }

  private void killUselessBullets() { // Delete from ArrayList
    ArrayList<Bullet> uselessBullets = new ArrayList<Bullet>();

    for (Bullet bullet: bullets) {
      if (!bullet.isOnScreen()) {
        uselessBullets.add(bullet);
      }
    }

    for (Bullet bullet: uselessBullets) {
      bullets.remove(bullet);
    }
  }

  //-------------- GETters and SETters -----------------------------------------

  Bullet getBullet(int relativePosition) {
    int indOfLast = bullets.size() - 1;

    if (relativePosition > indOfLast) {
      int badIndex = indOfLast - relativePosition;
      String message =
        "\nBullet with index " + badIndex + " does not exist."
      + "\nPlease, add the bullet in the START of fire() method realisation.";

      throw new ArrayIndexOutOfBoundsException(message);
    }
    return bullets.get(indOfLast - relativePosition);
  }
  Bullet getPrevBullet() {
    return getBullet(1);
  }
  Bullet getCurBullet() {
    return getBullet(0);
  }

  protected boolean shotCooldown() {  // Cannon shoots when it returns true
    return !(time++ % shotCooldown == 0);
  }
  //---------------------
  int getTimeFromShot() {
    return time % shotCooldown;
  }
  int getTimeToShot() {
    return shotCooldown - getTimeFromShot();
  }
  void setTimeCounter(int value) {
    time = value - 1;
  }
  //---------------------
  void setOptions(int shotCooldown, int bulletsPerShot) {
    this.shotCooldown = shotCooldown;
    this.bulletsPerShot = bulletsPerShot;
  }
  void setOptions(int shotCooldown, int bulletsPerShot, int startCounter) {
    setOptions(shotCooldown, bulletsPerShot);
    setTimeCounter(startCounter);
  }
}
