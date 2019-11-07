class MPatternBase extends PatternBase {
  // TODO: Add content (more information)
  PVector velocity;
  float speed;

  RicochetModule ricochetModule;

  //--------- GETters / SETters ------------------------------------------------

  void setVelocity(float speedX, float speedY) {
    setVelocity(new PVector(speedX, speedY));
  }
  void setVelocity(PVector newSpeed) {
    this.velocity = newSpeed.copy().normalize();
  }
  PVector getVelocity() {
    return velocity.copy();
  }

  //--------- Ricochet module --------------------------------------------------

  protected class RicochetModule {
    int numOfRicochets;
    boolean ricochetUP;
    boolean ricochetDOWN; // TODO: ???????????????? create ricochetTypeIndex
    boolean ricochetWALLS;

    RicochetModule() {
      // Default values
      numOfRicochets = 0;
      ricochetUP = false;
      ricochetDOWN = false;
      ricochetWALLS = true;
    }

    void ricochet() {
      if (numOfRicochets > 0) {
        if (ricochetWALLS) ricochetFromWalls();
        if (ricochetUP)    ricochetFromTop();
        if (ricochetDOWN)  ricochetFromBottom();
      }
    }

    private void ricochetFromWalls() {
      if (abs(gameObject.position.x + velocity.x - width / 2) > width / 2) {
        velocity.x = -velocity.x;
        numOfRicochets--;
      }
    }
    private void ricochetFromTop() {
      if (gameObject.position.y + velocity.y < 0) {
        velocity.y = -velocity.y;
        numOfRicochets--;
      }
    }
    private void ricochetFromBottom() {
      if (gameObject.position.y + velocity.y > height) {
        velocity.y = -velocity.y;
        numOfRicochets--;
      }
    }

    public void setOptions(int ricNum, boolean sides, boolean up, boolean down) {
      numOfRicochets = ricNum;
      ricochetWALLS = sides;
      ricochetUP = up;
      ricochetDOWN = down;
    }
  }
}
