abstract class FCPattern extends PreparedFireAndColorPatterns {
  //----------------- Constructor ----------------------------------------------
  protected FCPattern() {}

  public FCPattern(int bulletsCount) {
    bullets = new Bullet[bulletsCount];
    this.bulletsCount = bulletsCount;

    for (int i = 0; i < bulletsCount; i++) {
      bullets[i] = new Bullet();
    }

    shotDelay = 3;
    bulletsInShot = 1;
  }

  //------------------- Abstract methods ---------------------------------------

  abstract public void fire();
  abstract public void setBulletColor();

  //------------------- Main methods -------------------------------------------

  public void fireAndColorize() {
    if (shotCooldown()) {
      for (int i = 0; i < bulletsInShot; i++) {
        fire();
        setBulletColor();
        nextBulNum();
      }
    }
  }
}
