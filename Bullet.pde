class Bullet {
  private float x, y, speed, x0, y0;
  private float a;
  private float bulletSpeedX = 0, bulletSpeedY = 0;
  private int rn = 0;
  private int w, opp;
  private color col;
  private Moving m;
  Bullet(float xx, float yy, int ww, Moving mm) {
    x = xx;
    y = yy;
    w = ww;
    m = mm;
    col = color(255);
    //opp = 255;
  }
  
  private void display() {
    noStroke();
    fill(col, opp);
    ellipse(x, y, w, w);
    
   // stroke(col, opp);
   // strokeWeight(6);
   // fill(255, opp);
   // ellipse(x, y, w, w);
  }
  
  private void move() {
    x+= speed * bulletSpeedX;
    y+= speed * bulletSpeedY;
    bulletSpeedY += a;
    if(rn > 0) rikoshet(true, false);// rikoshet(x, y)
  } 
  public void fire(int numberOfCurrentBullet, float xx, float yy, Bullet arLast) {
    rn = 0;
    float[] uselessData = null;
    if(arLast != null) uselessData = arLast.getData();
    float[] res = m.fire(numberOfCurrentBullet, xx, yy, uselessData);
    x = res[0];
    x0 = x;
    y = res[1];
    y0 = y;
    speed = res[4];
    bulletSpeedX = res[2];
    bulletSpeedY = res[3];
    try {
      rn = int(res[5]);
      w = int(res[6]);
      a = res[7];
    } catch(Exception e) {}
    opp = 255;
  }
  
  public void death() {
    if(sqrt(sq(player.x - x) + sq(player.y - y)) < (w + player.w) / 2) {
      death = true;
      player = new Player(width / 2, height - 100, 8);
    }
    /*float a=mouseX-pmouseX,b=mouseY-pmouseY;
    if(a!=0 && b!=0)
    if(w+player.w>=abs(b*x-a*y-pmouseX*mouseY+pmouseY*mouseX)/sqrt(sq(b)+sq(a)))
    {
      int m,n;
      if(a>0){m=pmouseX;n=mouseX;}else{m=mouseX;n=pmouseX;}
      if(x+w>=m-player.w && x-w<=n+player.w)death=true;
    }*/
  }
  
  private void changeColor(float numberOfCurrentBullet, float length) {
    float k = length / 562;
    float colK;
    colorMode(HSB);
    colK = (numberOfCurrentBullet < length / 2) ? (numberOfCurrentBullet / k) : (numberOfCurrentBullet - length / 2) / k;
    col = color(colK, 255, 255);
    colorMode(RGB);
  }
  
  private void rikoshet(boolean rx, boolean ry) {
      if(rx) {
        if(x + bulletSpeedX > width || x - bulletSpeedX < 0) {
          bulletSpeedX=- bulletSpeedX;
          rn--;
        }
      }
      if(ry) {
        if(y + bulletSpeedY > height || y - bulletSpeedY < 0) {
          bulletSpeedY = -bulletSpeedY;
          rn--;
        }
      }
  }
  
  public void doAll() {
    if(isOnScreen()) {
      display();
      move();
    }
  }
  
  public boolean isOnScreen() {
    return (x + w > 0
         && x - w < width 
         && y + w > 0 
         && y - w < height);
  }
  
  public float[] getData() {
    float[] res = {x0, y0, bulletSpeedX, bulletSpeedY, x, y};
    return res;
  }
}