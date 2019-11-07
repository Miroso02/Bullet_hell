abstract class FCPattern extends PreparedFCPatterns {
  public FCPattern() {
    bullets = new ArrayList<Bullet>();
    shotCooldown = 3;
    bulletsPerShot = 1;
  }

  abstract public void fire();

  public void fireAndColorize() { // Wrapper
    if (shotCooldown()) return;

    for (int i = 0; i < bulletsPerShot; i++) {
      fire();
      bulletsCount++;
    }
  }
}
