class Bullet {
  float x;
  float y;
  
  float speed;
  int w;
  int opp;
  color col;
  
  float accelerationY;
  float speedX = 0;
  float speedY = 0;
  int numOfRicochets = 0;
  
  public Bullet(float x, float y) {
    this.x = x;
    this.y = y;
    w = 10;
    
    col = color(255);
    opp = 0;
    
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
    fill(col, opp);
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
  
  void changeColor(float numOfCurBullet, float length) {
    float k = length / 562;
    float colK;
    colorMode(HSB);
    colK = (numOfCurBullet < length / 2) ? (numOfCurBullet / k) : (numOfCurBullet - length / 2) / k;
    col = color(colK, 255, 255);
    colorMode(RGB);
    opp = 255;
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