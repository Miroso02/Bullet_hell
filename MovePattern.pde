abstract class MovePattern extends PreparedMovePatterns {
  abstract public PVector move(float x, float y, int time);
}

//--------------------------------------------------------------------

class PreparedMovePatterns {
  // TODO: Add some patterns
  
  public PVector rotateAround(float x, float y, int time, float radius, int period, boolean clockwise, float phase0) {
    float angle = phase0 + TWO_PI / period * time;
    
    y = y - radius * cos(angle);
    if (clockwise) x = x + radius * sin(angle);
    else x = x - radius * sin(angle);
    
    return new PVector(x, y);
  }
}