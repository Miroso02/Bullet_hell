abstract class BulletColorPattern extends PreparedBulletColorPatterns {
  abstract public void setBulletColor(Bullet currentBullet, int numOfCurBullet, int allBulletsCount);
}

//--------------------------------------------------------------------------------------------------------------

class PreparedBulletColorPatterns extends CannonData {
  // TODO: Add some patterns

  public void changeBulletColorHSB(Bullet bullet, int numOfCurBullet, int allBulletsCount, int cyclesPerEnd) {
    float k = 255 / (float)allBulletsCount;
    float colK;
    colorMode(HSB);
    colK = numOfCurBullet * k * cyclesPerEnd;

    for (int i = cyclesPerEnd; i > 0; i--) {
      if (colK > 255 * i) {
        colK -= 255 * i;
        break;
      }
    }

    bullet.col = color(colK, 255, 255);
    colorMode(RGB);
  }

  public void randomBulletColor(Bullet bullet) {
    bullet.col = color(random(255), random(255), random(255));
  }
}
