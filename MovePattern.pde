abstract class MovePattern extends PreparedMovePatterns {
  int timeCounter = 0;

  MovePattern(Cannon cannon) {
    this.cannon = cannon;
  }

  abstract public void move();

  public void _move() {
    move();
    timeCounter++;
  }

  int getTime() {
    return timeCounter;
  }
}

//--------------------------------------------------------------------

class PreparedMovePatterns extends CannonData {
  // TODO: Add some patterns

  public void rotateAround(float x, float y, float radius, int time, int period, boolean clockwise, float phase0) {
    float angle = phase0 + TWO_PI / period * time;

    y = y - radius * cos(angle);
    if (clockwise) x = x + radius * sin(angle);
    else x = x - radius * sin(angle);

    this.cannon.setPosition(new PVector(x, y));
  }
}
