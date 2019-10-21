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
  
  public Bullet() {
    x = 2000;
    y = 0;
    w = 10;
    
    col = color(255);
    
    speed = 4;
    accelerationY = 0;
    numOfRicochets = 0;
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
    if (numOfRicochets > 0) ricochet(true, false); // ricochet(x, y)
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
  
  private void ricochet(boolean rx, boolean ry) {
    if (rx) {
      if (x + speedX > width || x - speedX < 0) {
        speedX = -speedX;
        numOfRicochets--;
      }
    }
    if (ry) {
      if (y + speedY > height || y - speedY < 0) {
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