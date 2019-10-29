class CannonData {
  Cannon cannon;

  int shotDelay;
  int bulletsInShot;

  Bullet[] bullets;
  int numOfCurBullet;
  int bulletsCount;

  Bullet getPrevBullet() {
    return getBullet(-1);
  }
  Bullet getCurBullet() {
    return bullets[numOfCurBullet];
  }

  Bullet getBullet(int relativePosition) {
    int index = numOfCurBullet + relativePosition;

    if (index < 0) return bullets[bulletsCount + index];
    if (index >= bulletsCount) return bullets[index - bulletsCount];
    return bullets[index];
  }
}
