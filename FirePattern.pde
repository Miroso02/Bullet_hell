abstract class FirePattern extends PreparedFirePatterns {
  int shotDelayCounter = 0;
  int shotDelay;
  int bulletShotsAtOnce;

  BulletColorPattern bulletColPattern;

  FirePattern(Cannon cannon) {
    this.cannon = cannon;
    shotDelay = 3;
    bulletShotsAtOnce = 1;

    // Default color pattern makes all bullets white
    bulletColPattern = new BulletColorPattern(cannon) {
      public void setBulletColor() {
        for (Bullet b: this.cannon.bullets) {
          b.col = color(255);
        }
      }
    };
  }

  abstract public void fire();

  public void fireAndColorize() {
    if (shotCooldown()) {
      for (int i = 0; i < bulletShotsAtOnce; i++) {
        fire();
        bulletColPattern.setBulletColor();
        nextBulNum();
      }
    }
  }

  private void nextBulNum() {
    if (cannon.numOfCurBullet < cannon.bulletsCount - 1) {
      cannon.numOfCurBullet++;
    } else {
      cannon.numOfCurBullet = 0;
    }
  }

  private boolean shotCooldown() {
    if (shotDelayCounter > shotDelay) {
      shotDelayCounter = 2;
      // TODO: Find out why is it asynchronous
      return true;
    }
    shotDelayCounter++;
    return false;
  }
}

//---------------------------------------------------------------------------------------------------

class PreparedFirePatterns extends CannonData {
  // TODO: Add some patterns

  public PVector targetPlayerFrom(PVector startPoint) {
    float distToPlayerX = player.x - startPoint.x;
    float distToPlayerY = player.y - startPoint.y;
    float distToPlayer =
      sqrt(sq(distToPlayerX) + sq(distToPlayerY));

    float speedX = distToPlayerX / distToPlayer;
    float speedY = distToPlayerY / distToPlayer;

    return new PVector(speedX, speedY);
  }

  public void shootToAllSides(int numOfDirections) {
    int num = this.cannon.numOfCurBullet;
    Bullet bullet = this.cannon.bullets[num];

    float angle = TWO_PI * num / numOfDirections;

    bullet.speedX = cos(angle);
    bullet.speedY = sin(angle);
  }
}
