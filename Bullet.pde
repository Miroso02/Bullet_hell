class Bullet extends GameObject {
  PVector velocity;
  PVector acceleration; // TODO: Add MPattern to Bullet
  float speed;

  color col;

  RicochetModule ricochetModule; // Inner class

  //--------- Constructor ------------------------------

  public Bullet() {
    // Default values
    this.position = new PVector(2000, 0);
    this.size = 10;
    col = color(255);
    speed = 1;
    acceleration = new PVector(0, 0);

    velocity = new PVector(0, 0);
    ricochetModule = new RicochetModule();
  }

  //---------- Multipurpose methods -------------------------

  public void update() {
    if (isOnScreen()) {
      display();
      move();
    }
  }

  //----------- Main methods --------------

  void display() {
    noStroke();
    fill(col);
    ellipse(position.x, position.y, size, size);
  }

  void move() {
    velocity.add(acceleration);
    PVector finalSpeed = velocity.copy().mult(speed);
    position.add(finalSpeed);
    ricochetModule.ricochet();
  }

  //------- Private inner methods -------------------

  //--------- Ricochet module -----------+------------------------

  private class RicochetModule {
    int numOfRicochets;
    boolean ricochetUP;
    boolean ricochetDOWN;
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
      if (position.x + velocity.x > width
      || position.x - velocity.x < 0) {
        velocity.x = -velocity.x;
        numOfRicochets--;
      }
    }
    private void ricochetFromTop() {
      if (position.y - velocity.y < 0) {
        velocity.y = -velocity.y;
        numOfRicochets--;
      }
    }
    private void ricochetFromBottom() {
      if (position.y + velocity.y > height) {
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

  //--------- GETters / SETters ------------------------------------------------

  void setVelocity(float speedX, float speedY) {
    this.velocity.set(speedX, speedY);
  }
  void setVelocity(PVector newSpeed) {
    this.velocity = newSpeed.copy();
  }
  PVector getVelocity() {
    return velocity.copy();
  }
  //--------------------------
  void setAccel(float accelX, float accelY) {
    this.acceleration.set(accelX, accelY);
  }
  void setAccel(PVector newAccel) {
    this.acceleration = newAccel.copy();
  }
  PVector getAccel() {
    return acceleration.copy();
  }
  //--------------------------
  float getDistToPlayer() {
    return player.getDistTo(position);
  }
}
