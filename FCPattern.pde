abstract class FCPattern extends PreparedFCPatterns {
  public FCPattern() {
    bullets = new ArrayList<Bullet>();
    shotCooldown = 3;
    bulletsPerShot = 1;
  }

  abstract protected void beforeShot();
  abstract protected void fire();
  abstract protected void afterShot();

  public void fireAndColorize() { // Wrapper
    if (shotCooldown()) return;

    beforeShot();
    for (int i = 0; i < bulletsPerShot; i++) {
      fire();
      bulletsCount++;
    }
    afterShot();
  }
}
