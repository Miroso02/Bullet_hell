abstract class FirePattern extends PreparedFirePatterns {
  private int shotDelayCounter = -1;
  int shotDelay;
  int bulletsInShot;

  BulletColorPattern bulletColPattern;

  FirePattern(Cannon cannon) {
    this.cannon = cannon;
    shotDelay = 3;
    bulletsInShot = 1;

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
      for (int i = 0; i < bulletsInShot; i++) {
        fire();
        bulletColPattern.setBulletColor();
        nextBulNum();
      }
    }
  }

  //----------------------------------------------------------------------------

  int getTimeFromDelay() {
    return shotDelayCounter;
  }

  //----------------------------------------------------------------------------

  private void nextBulNum() {
    if (cannon.numOfCurBullet < cannon.bulletsCount - 1) {
      cannon.numOfCurBullet++;
    } else {
      cannon.numOfCurBullet = 0;
    }
  }

  private boolean shotCooldown() {
    if (shotDelayCounter < shotDelay - 1) {
      shotDelayCounter++;
      return false;
    }
    shotDelayCounter = 0;
    return true;
  }
}

//---------------------------------------------------------------------------------------------------

class PreparedFirePatterns extends CannonData {
  // TODO: Add some patterns

  public PVector targetPlayerFrom(PVector startPoint) {
    float distToPlayerX = player.position.x - startPoint.x;
    float distToPlayerY = player.position.y - startPoint.y;
    float distToPlayer = sqrt(sq(distToPlayerX) + sq(distToPlayerY));

    float speedX = distToPlayerX / distToPlayer;
    float speedY = distToPlayerY / distToPlayer;

    return new PVector(speedX, speedY);
  }

  public void shootToAllSides(int numOfDirections) {
    int num = this.cannon.numOfCurBullet;
    Bullet bullet = this.cannon.bullets[num];

    float angle = TWO_PI * num / numOfDirections;

    bullet.setVelocity(cos(angle), sin(angle));
  }
}
