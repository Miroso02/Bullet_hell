class CannonPatternBase {
  Cannon cannon;  // Cannon that owns this pattern

  protected int shotCooldownCounter = -1;
  int shotCooldown;
  int bulletsPerShot;

  Bullet[] bullets; // TODO: Create as ArrayList (IN NEW BRANCH!!!!!!!!!!!!!!)
  int numOfCurBullet;
  int bulletsCount;

  //--------------- Main methods -----------------------------------------------

  protected void updateBullets() {
    for (Bullet bullet: bullets) {
      bullet.update();
    }
  }

  //-------------- GETters and SETters -----------------------------------------

  Bullet getBullet(int relativePosition) {
    int index = numOfCurBullet + relativePosition;

    if (index < 0) return bullets[bulletsCount + index];
    if (index >= bulletsCount) return bullets[index - bulletsCount];
    return bullets[index];
  }
  Bullet getPrevBullet() {
    return getBullet(-1);
  }
  Bullet getCurBullet() {
    return bullets[numOfCurBullet];
  }
  //---------------------
  protected void nextBulNum() { // TODO: Rewrite with %
    if (numOfCurBullet < bulletsCount - 1) {
      numOfCurBullet++;
    } else {
      numOfCurBullet = 0;
    }
    //numOfCurBullet = numOfCurBullet++ % bulletsCount;
  }
  protected boolean shotCooldown() { // TODO: Rewrite with %
    if (shotCooldownCounter < shotCooldown - 1) {
      shotCooldownCounter++;
      return true;
    }
    shotCooldownCounter = 0;
    return false;
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
