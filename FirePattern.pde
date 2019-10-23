interface ForLaser {
  public float[] fire(float koef, float xL, float yL,float from, float to, float start);
}

//---------------------------------------------------

abstract class FirePattern extends PreparedFirePatterns {
  abstract public void fire(Bullet currentBullet, int numOfCurBullet, float cannonX, float cannonY);
}

//---------------------------------------------------

class PreparedFirePatterns {
  // ¯\_(ツ)_/¯
}
