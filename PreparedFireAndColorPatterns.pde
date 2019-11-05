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
    Bullet bullet = getCurBullet();
    bullet.col = col;
  }

  public void changeBulletColorHSB(int bulletsPerCycle) {
    int num = this.numOfCurBullet;
    Bullet bullet = getCurBullet();

    colorMode(HSB);
    float colK = (num * 255 / bulletsPerCycle) % 255;

    bullet.col = color(colK, 255, 255);
    colorMode(RGB);
  }

  public void setColorOfAllShot(color col) {
    int num = this.numOfCurBullet;
    Bullet bullet = getCurBullet();
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
