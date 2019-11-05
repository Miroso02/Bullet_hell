class CannonPatternBase {
  Cannon cannon;  // Cannon that owns this pattern

  protected int shotCooldownCounter = -1;
  int shotCooldown;
  int bulletsPerShot;

  ArrayList<Bullet> bullets;
  int numOfCurBullet;

  //--------------- Main methods -----------------------------------------------

  protected void updateBullets() {
    for (Bullet bullet: bullets) {
      bullet.update();
    }
    killUselessBullets();
  }

  private void killUselessBullets() {
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
    int indexOfLast = bullets.size() - 1;

    if (relativePosition > indexOfLast) return null;
    return bullets.get(indexOfLast - relativePosition);
  }
  Bullet getPrevBullet() {
    return getBullet(1);
  }
  Bullet getCurBullet() {
    return bullets.get(bullets.size() - 1);
  }

  protected void nextBulNum() {
    numOfCurBullet++;
  }
  protected boolean shotCooldown() {
    shotCooldownCounter = ++shotCooldownCounter % shotCooldown;

    if (shotCooldownCounter == 0) return false;
    return true;
  }
  //---------------------
  int getTimeFromShot() {
    return shotCooldownCounter;
  }
  void setDelayCounter(int value) {
    shotCooldownCounter = value - 1;
  }
  //---------------------
  void setOptions(int shotCooldown, int bulletsPerShot) {
    this.shotCooldown = shotCooldown;
    this.bulletsPerShot = bulletsPerShot;
  }
  void setOptions(int shotCooldown, int bulletsPerShot, int startCounter) {
    setOptions(shotCooldown, bulletsPerShot);
    setDelayCounter(startCounter);
  }
}
