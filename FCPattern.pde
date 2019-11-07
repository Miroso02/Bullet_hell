abstract class FCPattern extends PreparedFCPatterns {
  //----------------- Constructor ----------------------------------------------

  public FCPattern() {
    bullets = new ArrayList<Bullet>();

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
        bulletsCount++;
      }
    }
  }
}
