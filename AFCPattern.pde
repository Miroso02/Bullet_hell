abstract class AFCPattern extends FCPattern {
  public AFCPattern(int bulletsCount) {
    bullets = new Bullet[bulletsCount];
    this.bulletsCount = bulletsCount;

    for (int i = 0; i < bulletsCount; i++) {
      bullets[i] = new ABullet();
    }

    shotDelay = 3;
    bulletsInShot = 1;
  }
}
