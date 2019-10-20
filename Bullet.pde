class Bullet {
  float x;
  float y;
  float x0;
  float y0;
  
  float speed;
  int w;
  int opp;
  color col;
  
  float accelerationY;
  float bulletSpeedX = 0;
  float bulletSpeedY = 0;
  int numOfRicochets = 0;
  Moving m;
  
  public Bullet(float x, float y, int w, Moving m) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.m = m;
    col = color(255);
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
    x += speed * bulletSpeedX;
    y += speed * bulletSpeedY;
    bulletSpeedY += accelerationY;
    if(numOfRicochets > 0) ricochet(true, false); // ricochet(x, y)
  } 
  
  void killPlayer() {
    if (touchingPlayer()) {
      death = true;
      player = new Player(width / 2, height - 100, 8);
    }
  }
  
  //-------------------------------------------
  
  public void fire(int numOfCurBullet, float xx, float yy, Bullet arLast) {
    numOfRicochets = 0;
    float[] uselessData = null;
    if(arLast != null) uselessData = arLast.getData();
    float[] res = m.fire(numOfCurBullet, xx, yy, uselessData);
    x = res[0];
    x0 = x;
    y = res[1];
    y0 = y;
    speed = res[4];
    bulletSpeedX = res[2];
    bulletSpeedY = res[3];
    try {
      numOfRicochets = int(res[5]);
      w = int(res[6]);
      accelerationY = res[7];
    } catch(Exception e) {}
    opp = 255;
  }
  
  //---------------------------------------
  
  private boolean touchingPlayer() {
    float distToPlayerX = player.x - x;
    float distToPlayerY = player.y - y;
    float distToPlayerSq = sq(distToPlayerX) + sq(distToPlayerY);
    
    float sumOfRadiuses = (w + player.size) / 2;
    
    return (distToPlayerSq < sq(sumOfRadiuses));
  }
  
  private void changeColor(float numOfCurBullet, float length) {
    float k = length / 562;
    float colK;
    colorMode(HSB);
    colK = (numOfCurBullet < length / 2) ? (numOfCurBullet / k) : (numOfCurBullet - length / 2) / k;
    col = color(colK, 255, 255);
    colorMode(RGB);
  }
  
  private void ricochet(boolean rx, boolean ry) {
    if(rx) {
      if(x + bulletSpeedX > width || x - bulletSpeedX < 0) {
        bulletSpeedX = -bulletSpeedX;
        numOfRicochets--;
      }
    }
    if(ry) {
      if(y + bulletSpeedY > height || y - bulletSpeedY < 0) {
        bulletSpeedY = -bulletSpeedY;
        numOfRicochets--;
      }
    }
  }
  
  private boolean isOnScreen() {
    return (x + w > 0 && x - w < width && 
            y + w > 0 && y - w < height);
  }
  
  public float[] getData() {
    float[] res = {x0, y0, bulletSpeedX, bulletSpeedY, x, y};
    return res;
  }
}