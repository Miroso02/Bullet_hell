class FCPatternBase {
  Cannon cannon;

  protected int shotDelayCounter = -1;
  int shotDelay;
  int bulletsInShot;

  Bullet[] bullets;
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
    if (numOfCurBullet < bulletsCount - 1) {
      numOfCurBullet++;
    } else {
      numOfCurBullet = 0;
    }
  }
  protected boolean shotCooldown() {
    if (shotDelayCounter < shotDelay - 1) {
      shotDelayCounter++;
      return false;
    }
    shotDelayCounter = 0;
    return true;
  }
  //---------------------
  int getTimeFromShot() {
    return shotDelayCounter;
  }
  void setDelayCounter(int value) {
    shotDelayCounter = value - 1;
  }
  //---------------------
  void setOptions(int shotDelay, int bulletsInShot) {
    this.shotDelay = shotDelay;
    this.bulletsInShot = bulletsInShot;
  }
  void setOptions(int shotDelay, int bulletsInShot, int startCounter) {
    setOptions(shotDelay, bulletsInShot);
    setDelayCounter(startCounter);
  }
}
