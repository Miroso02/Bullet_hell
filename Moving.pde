interface Moving {
  public float[] fire(int numberOfCurrentBullet,float xL, float yL, float...other);
}
interface ForLaser {
  public float[] fire(float koef, float xL, float yL,float from, float to, float start);
  public int a();
}
abstract class FireAlgoritm {
  abstract public void customFire(
  int numberOfCurrentBullet,
  Bullet thisBullet, 
  Bullet prevBullet, 
  float...other
  );
}
