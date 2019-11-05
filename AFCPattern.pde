abstract class AFCPattern extends FCPattern { // Agressive FCPattern
  public AFCPattern(int bulletsCount) {
    bullets = new Bullet[bulletsCount];
    this.bulletsCount = bulletsCount;

    bullets_ = new ArrayList<Bullet>();

    for (int i = 0; i < bulletsCount; i++) {
      bullets[i] = new ABullet();
    }

    shotCooldown = 3;
    bulletsPerShot = 1;
  }
}
