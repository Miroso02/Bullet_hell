class Bullet {
  float x;
  float y;

  int w;
  color col;

  float speed;
  float speedX = 0;
  float speedY = 0;
  float accelerationY;


  RicochetModule ricochetModule; // Inner class

  //--------- Constructor ------------------------------

  public Bullet() {
    // DefaultValues
    x = 2000;
    y = 0;
    w = 10;

    col = color(255);

    speed = 1;
    accelerationY = 0;

    ricochetModule = new RicochetModule();
  }

  //---------- Multipurpose methods -------------------------

  public void update() {
    if (isOnScreen()) {
      display();
      move();
      //killPlayer();
    }
  }

  public void updatePeacefully() {
    if (isOnScreen()) {
      display();
      move();
    }
  }

  //----------- Main methods --------------

  void display() {
    noStroke();
    fill(col);
    ellipse(x, y, w, w);
  }

  void move() {
    x += speed * speedX;
    y += speed * speedY;
    speedY += accelerationY;
    ricochetModule.ricochet();
  }

  void killPlayer() {
    if (touchingPlayer()) {
      player.isDead = true;
    }
  }

  //------- Private inner methods -------------------

  private boolean touchingPlayer() {
    float sumOfRadiuses = (w + player.size) / 2;

    return (getDistToPlayerSq() < sq(sumOfRadiuses));
  }

  private boolean isOnScreen() {
    return (x + w > 0 && x - w < width &&
            y + w > 0 && y - w < height);
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

    private void ricochet() {
      if (numOfRicochets > 0) {
        if (ricochetWALLS) ricochetFromWalls();
        if (ricochetUP)    ricochetFromTop();
        if (ricochetDOWN)  ricochetFromBottom();
      }
    }

    private void ricochetFromWalls() {
      if (x + speedX > width || x - speedX < 0) {
        speedX = -speedX;
        numOfRicochets--;
      }
    }
    private void ricochetFromTop() {
      if (y - speedY < 0) {
        speedY = -speedY;
        numOfRicochets--;
      }
    }
    private void ricochetFromBottom() {
      if (y + speedY > height) {
        speedY = -speedY;
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

  //--------- GETters / SETters ----------------------

  void setPosition(float x, float y) {
    this.x = x;
    this.y = y;
  }
  void setPosition(PVector newPosition) {
    this.x = newPosition.x;
    this.y = newPosition.y;
  }

  void setVelocity(float speedX, float speedY) {
    this.speedX = speedX;
    this.speedY = speedY;
  }

  float getDistToPlayerSq() {
    float distToPlayerX = player.x - x;
    float distToPlayerY = player.y - y;

    return sq(distToPlayerX) + sq(distToPlayerY);
  }
}
