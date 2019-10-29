abstract class FCPattern extends PreparedFireAndColorPatterns {
  private int shotDelayCounter = -1;

  FCPattern(int bulletsCount, boolean isKillingPlayer) {
    bullets = new Bullet[bulletsCount];
    this.bulletsCount = bulletsCount;

    if (isKillingPlayer) {
      for (int i = 0; i < bulletsCount; i++) {
        bullets[i] = new ABullet();
      }
    } else {
      for (int i = 0; i < bulletsCount; i++) {
        bullets[i] = new Bullet();
      }
    }

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

  private void updateBullets() {
    for (Bullet bullet: bullets) {
      bullet.update();
    }
  }

  public void update() {
    fireAndColorize();
    updateBullets();
  }

  //----------------------------------------------------------------------------

  int getTimeFromDelay() {
    return shotDelayCounter;
  }

  //----------------------------------------------------------------------------

  private void nextBulNum() {
    /*if (cannon.numOfCurBullet < cannon.bulletsCount - 1) {
      cannon.numOfCurBullet++;
    } else {
      cannon.numOfCurBullet = 0;
    }*/
    if (numOfCurBullet < bulletsCount - 1) {
      numOfCurBullet++;
    } else {
      numOfCurBullet = 0;
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
