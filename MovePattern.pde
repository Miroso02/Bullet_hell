abstract class MPattern extends PreparedMovePatterns {
  private int timeCounter = 0;

  MPattern(GameObject gObj) {
    this.gameObject = gObj;
    
    this.speed = 1;
    this.velocity = new PVector(0, 0);
  }
  
  abstract public void move();

  public void wrappedMove() {
    move();
    timeCounter++;
  }

  int getTime() {
    return timeCounter;
  }
}

//--------------------------------------------------------------------

class PreparedMovePatterns extends MPatternBase {
  // TODO: Add some patterns

  public void rotateAround(float x, float y, float radius, int time, int period, boolean clockwise, float phase0) {
    float angle = phase0 + TWO_PI / period * time;

    y = y - radius * cos(angle);
    if (clockwise) x = x + radius * sin(angle);
    else x = x - radius * sin(angle);
    
    this.gameObject.setPosition(new PVector(x, y));
  }
  
  public void moveWithConstSpeed() {
    PVector bulletPos = this.gameObject.position;
    PVector finalVel = PVector.mult(velocity, speed);
    bulletPos.add(finalVel);
  }
}
