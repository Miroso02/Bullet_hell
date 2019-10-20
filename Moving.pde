interface Moving {
  public float[] fire(int numOfCurBullet,float xL, float yL, float...other);
}
interface ForLaser {
  public float[] fire(float koef, float xL, float yL,float from, float to, float start);
}
abstract class FireAlgoritm {
  abstract public void customFire(int numOfCurBullet, Bullet[] currentBullet, float... other);
}
