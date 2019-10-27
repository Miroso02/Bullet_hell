abstract class BulletColorPattern extends PreparedBulletColorPatterns {
  BulletColorPattern(Cannon cannon) {
    this.cannon = cannon;
  }
  abstract public void setBulletColor();
}

//--------------------------------------------------------------------------------------------------------------

class PreparedBulletColorPatterns extends CannonData {
  // TODO: Add some patterns

  public void changeBulletColorHSB(int cyclesPerEnd) {
    int num = cannon.numOfCurBullet;
    Bullet bullet = cannon.bullets[num];

    float k = 255 / (float)cannon.bulletsCount;
    colorMode(HSB);
    float colK = num * k * cyclesPerEnd;

    for (int i = cyclesPerEnd; i > 0; i--) {
      if (colK > 255 * i) {
        colK -= 255 * i;
        break;
      }
    }

    bullet.col = color(colK, 255, 255);
    colorMode(RGB);
  }

  public color randomColor() {
    return color(random(255), random(255), random(255));
  }
}
