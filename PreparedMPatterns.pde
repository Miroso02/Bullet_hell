class PreparedMPatterns extends MPatternBase {
  // TODO: Add some patterns

  public void rotateAround(float x, float y, float radius, int period, boolean clockwise, float phase0) {
    // TODO: Reduce number of arguments
    float angle = phase0 + TWO_PI / period * this.time;

    y = y - radius * cos(angle);
    if (clockwise) x = x + radius * sin(angle);
    else x = x - radius * sin(angle);

    this.gameObject.setPosition(x, y);
  }

  public void moveWithConstSpeed() {
    PVector bulletPos = this.gameObject.position;
    PVector finalVel = PVector.mult(velocity, speed);
    bulletPos.add(finalVel);
  }
  public void moveWithConstSpeedAndRicochet() {
    moveWithConstSpeed();
    ricochetModule.ricochet();
  }
}
