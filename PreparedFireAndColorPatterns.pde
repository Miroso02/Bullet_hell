class PreparedFireAndColorPatterns extends CannonPatternBase {
  // TODO: Add some patterns

  //-------------- Fire patterns --------------------------

  public PVector targetPlayerFrom(PVector startPoint) {
    PVector axisDist = player.getPosition().sub(startPoint);
    float absDist = axisDist.mag();

    float speedX = axisDist.x / absDist;
    float speedY = axisDist.y / absDist;

    return new PVector(speedX, speedY);
  }

  public PVector shootToAllSides() {
    int num = this.numOfCurBullet;
    int numOfDirections = this.bulletsPerShot;
    float angle = TWO_PI * num / numOfDirections;

    return new PVector(cos(angle), sin(angle));
  }

  //------------ Color Patterns --------------------------

  public void setBulletColor(color col) {
    Bullet bullet = this.bullets[numOfCurBullet];
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
    int bulletsPerShot = this.bulletsPerShot;

    if (num % bulletsPerShot == 0) {
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
