class MPatternBase extends PatternBase {
  PVector velocity;
  float speed;
  
  void setVelocity(float speedX, float speedY) {
    this.velocity.set(speedX, speedY);
  }
  void setVelocity(PVector newSpeed) {
    this.velocity = newSpeed.copy();
  }
  PVector getVelocity() {
    return velocity.copy();
  }
}