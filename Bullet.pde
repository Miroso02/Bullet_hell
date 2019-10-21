class Bullet {
  float x;
  float y;
  
  float speed;
  int w;
  color col;
  
  float accelerationY;
  float speedX = 0;
  float speedY = 0;
  
  int numOfRicochets = 0;
  boolean ricochetUP;
  boolean ricochetDOWN;
  boolean ricochetSIDES;
  
  public Bullet() {
    x = 2000;
    y = 0;
    w = 10;
    
    col = color(255);
    
    speed = 4;
    accelerationY = 0;
    numOfRicochets = 0;
    ricochetUP = false;
    ricochetDOWN = false;
    ricochetSIDES = true;
  }
  
  //-------------------------------------------
  
  public void doAll(boolean isKillingPlayer) {
    if (isOnScreen()) {
      display();
      move();
      if (isKillingPlayer) killPlayer();
    }
  }
  
  //-------------------------------------------
  
  void display() {
    noStroke();
    fill(col);
    ellipse(x, y, w, w);
  }
  
  void move() {
    x += speed * speedX;
    y += speed * speedY;
    speedY += accelerationY;
    if (numOfRicochets > 0) {
      ricochet(ricochetSIDES, ricochetUP, ricochetDOWN);
    }
  } 
  
  void killPlayer() {
    if (touchingPlayer()) {
      player.isDead = true;
    }
  }
  
  //-------------------------------------------
  
  private boolean touchingPlayer() {
    float distToPlayerX = player.x - x;
    float distToPlayerY = player.y - y;
    float distToPlayerSq = sq(distToPlayerX) + sq(distToPlayerY);
    
    float sumOfRadiuses = (w + player.size) / 2;
    
    return (distToPlayerSq < sq(sumOfRadiuses));
  }
  
  private void ricochet(boolean rs, boolean ru, boolean rd) {
    if (rs) {
      if (x + speedX > width || x - speedX < 0) {
        speedX = -speedX;
        numOfRicochets--;
      }
    }
    if (ru) {
      if (y - speedY < 0) {
        speedY = -speedY;
        numOfRicochets--;
      }
    }
    if (rd) {
      if (y + speedY > height) {
        speedY = -speedY;
        numOfRicochets--;
      }
    }
  }
  
  private boolean isOnScreen() {
    return (x + w > 0 && x - w < width && 
            y + w > 0 && y - w < height);
  }
}