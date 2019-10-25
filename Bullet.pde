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
  
  public void doAll(boolean isKillingPlayer) {
    if (isOnScreen()) {
      display();
      move();
      if (isKillingPlayer) killPlayer();
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
    float distToPlayerX = player.x - x;
    float distToPlayerY = player.y - y;
    float distToPlayerSq = sq(distToPlayerX) + sq(distToPlayerY);
    
    float sumOfRadiuses = (w + player.size) / 2;
    
    return (distToPlayerSq < sq(sumOfRadiuses));
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
  }
}