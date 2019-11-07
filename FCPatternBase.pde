class FCPatternBase extends PatternBase {
  int shotCooldown;
  int bulletsPerShot;

  ArrayList<Bullet> bullets;
  int bulletsCount = 0;

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
    int bCount = bullets.size();

    if (relativePosition > bCount) return null;
    return bullets.get(bCount - relativePosition);
  }
  Bullet getPrevBullet() {
    // TODO: Fix PrevBullet (Problem in fireAndColorize())
    return getBullet(2);
  }
  Bullet getCurBullet() {
    return bullets.get(bullets.size() - 1);
  }

  protected boolean shotCooldown() {
    return !(time++ % shotCooldown == 0);
  }
  //---------------------
  int getTimeFromShot() {
    return time % shotCooldown;
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
