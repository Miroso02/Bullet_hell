class Bullet {
  PVector position;
  PVector velocity;

  int w;
  color col;

  float speed;
  float accelerationY;

  RicochetModule ricochetModule; // Inner class

  //--------- Constructor ------------------------------

  public Bullet() {
    // DefaultValues
    position = new PVector(2000, 0);
    w = 10;
    col = color(255);
    speed = 1;
    accelerationY = 0;

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
    ellipse(position.x, position.y, w, w);
  }

  void move() {
    //x += speed * speedX;
    //y += speed * speedY;
    PVector finalSpeed = velocity.copy().mult(speed);
    position.add(finalSpeed);
    //speedY += accelerationY;
    ricochetModule.ricochet();
  }

  //------- Private inner methods -------------------

  protected boolean isOnScreen() {
    return (position.x + w > 0 && position.x - w < width &&
            position.y + w > 0 && position.y - w < height);
  }

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

  void setPosition(float x, float y) {
    this.position.set(x, y);
  }
  void setPosition(PVector newPosition) {
    this.position = newPosition.copy();
  }
  PVector getPosition() {
    return position.copy();
  }
//--------------------------
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
  float getDistToPlayer() {
    return player.getDistTo(position);
  }
}
