abstract class FirePattern extends PreparedFirePatterns {
  FirePattern(Cannon cannon) {
    this.cannon = cannon;
  }
  abstract public void fire(Bullet currentBullet, int numOfCurBullet);
}

//---------------------------------------------------------------------------------------------------

class PreparedFirePatterns extends CannonData {
  // TODO: Add some patterns

  public PVector targetPlayerFrom(float x, float y) {
    float distToPlayerX = player.x - x;
    float distToPlayerY = player.y - y;
    float distToPlayer =
      sqrt(sq(distToPlayerX) + sq(distToPlayerY));

    float speedX = distToPlayerX / distToPlayer;
    float speedY = distToPlayerY / distToPlayer;

    return new PVector(speedX, speedY);
  }

  public void shootToAllSides(Bullet bullet, int bulletNum, int numOfDirections) {
    float angle = TWO_PI * bulletNum / numOfDirections;
    bullet.speedX = cos(angle);
    bullet.speedY = sin(angle);
  }
}
