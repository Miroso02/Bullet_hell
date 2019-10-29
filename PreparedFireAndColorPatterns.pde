class PreparedFireAndColorPatterns extends CannonData {
  // TODO: Add some patterns

  //-------------- Fire patterns --------------------------

  public PVector targetPlayerFrom(PVector startPoint) {
    float distToPlayerX = player.position.x - startPoint.x;
    float distToPlayerY = player.position.y - startPoint.y;
    float distToPlayer = sqrt(sq(distToPlayerX) + sq(distToPlayerY));

    float speedX = distToPlayerX / distToPlayer;
    float speedY = distToPlayerY / distToPlayer;

    return new PVector(speedX, speedY);
  }

  public void shootToAllSides(int numOfDirections) {
    int num = this.numOfCurBullet;
    Bullet bullet = this.bullets[num];

    float angle = TWO_PI * num / numOfDirections;

    bullet.setVelocity(cos(angle), sin(angle));
  }

  //------------ Color Patterns --------------------------

  public void setBulletColor(color col) {
    int num = this.numOfCurBullet;
    Bullet bullet = this.bullets[num];

    bullet.col = col;
  }

  public void changeBulletColorHSB(int cyclesPerEnd) {
    int num = this.numOfCurBullet;
    Bullet bullet = this.bullets[num];

    float k = 255 / (float)this.bulletsCount;
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

  public void setColorOfAllShot(color col) {
    int num = this.numOfCurBullet;
    Bullet bullet = this.bullets[num];
    int bulletsInShot = this.bulletsInShot;

    if (num % bulletsInShot == 0) {
      bullet.col = col;
    }
    else {
      Bullet prevBullet = this.getPrevBullet();
      bullet.col = prevBullet.col;
    }
  }

  public color randomColor() {
    return color(random(255), random(255), random(255));
  }
}
