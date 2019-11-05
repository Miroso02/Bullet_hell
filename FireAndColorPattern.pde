abstract class FCPattern extends PreparedFireAndColorPatterns {
  //----------------- Constructor ----------------------------------------------
  protected FCPattern() {} // To avoid errors in AFCPattern creating

  public FCPattern(int bulletsCount) {
    bullets = new Bullet[bulletsCount];
    this.bulletsCount = bulletsCount;

    for (int i = 0; i < bulletsCount; i++) {
      bullets[i] = new Bullet();
    }

    shotCooldown = 3;
    bulletsPerShot = 1;
  }

  //------------------- Abstract methods ---------------------------------------

  abstract public void fire();
  abstract public void setBulletColor();

  //------------------- Main methods -------------------------------------------

  public void fireAndColorize() { // Wrapper
    if (!shotCooldown()) {
      for (int i = 0; i < bulletsPerShot; i++) {
        fire();
        setBulletColor();
        nextBulNum();
      }
    }
  }
}
