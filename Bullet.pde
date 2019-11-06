class Bullet extends GameObject {
  MPattern mPattern;
  
  color col;

  RicochetModule ricochetModule; // Inner class

  //--------- Constructor ------------------------------------------------------

  public Bullet() {
    // Default values
    this.position = new PVector(2000, 0); // Offscreen
    this.size = 10;
    col = color(255);
    
    ricochetModule = new RicochetModule();
    
    mPattern = new MPattern(this) {
      public void move() {
        moveWithConstSpeed();
        ((Bullet)gameObject).ricochetModule.ricochet();
      }
    };
  }

  //----------- Main methods ---------------------------------------------------

  void display() {
    noStroke();
    fill(col);
    ellipse(position.x, position.y, size, size);
  }

  void move() {
    /*velocity.add(acceleration);
    PVector finalVelocity = PVector.mult(velocity, speed);
    position.add(finalVelocity);
    ricochetModule.ricochet();*/
    mPattern.move();
  }

  //------- Private inner methods ----------------------------------------------

  //--------- Ricochet module --------------------------------------------------

  private class RicochetModule { 
    // TODO: Put this class between MPatternBase and Pr.MPatterns
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
      if (abs(position.x + mPattern.velocity.x - width / 2) > width / 2) {
        mPattern.velocity.x = -mPattern.velocity.x;
        numOfRicochets--;
      }
    }
    private void ricochetFromTop() {
      if (position.y + mPattern.velocity.y < 0) {
        mPattern.velocity.y = -mPattern.velocity.y;
        numOfRicochets--;
      }
    }
    private void ricochetFromBottom() {
      if (position.y + mPattern.velocity.y > height) {
        mPattern.velocity.y = -mPattern.velocity.y;
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

  //--------- GETters / SETters ------------------------------------------------

}
