abstract class MovePattern extends PreparedMovePatterns {
  abstract public PVector move(float x, float y, int time);
}

//--------------------------------------------------------------------

class PreparedMovePatterns {
  // TODO: Add some patterns
  
  public PVector rotateAroundRIGHT(float x, float y, int time, float radius, int period, boolean clockwise) {
    float angle = TWO_PI / period * time;
    
    x = x + radius * cos(angle);
    if (clockwise) y = y + radius * sin(angle);
    else y = y - radius * sin(angle);
    
    return new PVector(x, y);
  }
  
  public PVector rotateAroundLEFT(float x, float y, int time, float radius, int period, boolean clockwise) {
    float angle = TWO_PI / period * time;
    
    x = x - radius * cos(angle);
    if (clockwise) y = y - radius * sin(angle);
    else y = y + radius * sin(angle);
    
    return new PVector(x, y);
  }
  
  public PVector rotateAroundUP(float x, float y, int time, float radius, int period, boolean clockwise) {
    float angle = TWO_PI / period * time;
    
    y = y - radius * cos(angle);
    if (clockwise) x = x + radius * sin(angle);
    else x = x - radius * sin(angle);
    
    return new PVector(x, y);
  }
  
  public PVector rotateAroundDOWN(float x, float y, int time, float radius, int period, boolean clockwise) {
    float angle = TWO_PI / period * time;
    
    y = y + radius * cos(angle);
    if (clockwise) x = x - radius * sin(angle);
    else x = x + radius * sin(angle);
    
    return new PVector(x, y);
  }
}