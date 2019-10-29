class CannonData {
  Cannon cannon;

  int shotDelay;
  int bulletsInShot;

  Bullet[] bullets;
  int numOfCurBullet;
  int bulletsCount;

  Bullet getPrevBullet() {
    if (numOfCurBullet > 0) {
      return bullets[numOfCurBullet - 1];
    } else {
      return bullets[bulletsCount - 1];
    }
  }
  Bullet getCurBullet() {
    return bullets[numOfCurBullet];
  }
}
