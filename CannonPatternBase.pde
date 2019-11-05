class CannonPatternBase {
  Cannon cannon;  // Cannon that owns this pattern

  protected int shotCooldownCounter = -1;
  int shotCooldown;
  int bulletsPerShot;

  Bullet[] bullets; // TODO: Create as ArrayList (IN NEW BRANCH!!!!!!!!!!!!!!)
  ArrayList<Bullet> bullets_ = new ArrayList<Bullet>();
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
  protected void nextBulNum() {
    numOfCurBullet = ++numOfCurBullet % bulletsCount;
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
