abstract class FCPattern extends PreparedFCPatterns {
  private int shotDelayCounter = -1;
  int shotDelay;
  int bulletsInShot;

  FCPattern(Cannon cannon) {
    this.cannon = cannon;
    shotDelay = 3;
    bulletsInShot = 1;
  }

  abstract public void fire();
  abstract public void setBulletColor();

  public void fireAndColorize() {
    if (shotCooldown()) {
      for (int i = 0; i < bulletsInShot; i++) {
        fire();
        setBulletColor();
        nextBulNum();
      }
    }
  }

  //----------------------------------------------------------------------------

  int getTimeFromDelay() {
    return shotDelayCounter;
  }

  //----------------------------------------------------------------------------

  private void nextBulNum() {
    if (cannon.numOfCurBullet < cannon.bulletsCount - 1) {
      cannon.numOfCurBullet++;
    } else {
      cannon.numOfCurBullet = 0;
    }
  }

  private boolean shotCooldown() {
    if (shotDelayCounter < shotDelay - 1) {
      shotDelayCounter++;
      return false;
    }
    shotDelayCounter = 0;
    return true;
  }
}