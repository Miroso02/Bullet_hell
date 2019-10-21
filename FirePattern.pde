interface ForLaser {
  public float[] fire(float koef, float xL, float yL,float from, float to, float start);
}

abstract class FirePattern extends PreparedPatterns {
  abstract public void fire(Bullet currentBullet, int numOfCurBullet, float cannonX, float cannonY);
  abstract public void setBulletColor(Bullet currentBullet, int numOfCurBullet, int allBulletsCount);
}

class PreparedPatterns {
  public void staticBulletColor(Bullet bullet, color col) {
    bullet.col = col;
  }
  
  public void changeBulletColorHSB(Bullet bullet, int numOfCurBullet, int allBulletsCount) {
    float k = allBulletsCount / 562;
    float colK;
    colorMode(HSB);
    colK = (numOfCurBullet < allBulletsCount / 2) ? 
           (numOfCurBullet / k) : 
           (numOfCurBullet - allBulletsCount / 2) / k;
    bullet.col = color(colK, 255, 255);
    colorMode(RGB);
  }
}
