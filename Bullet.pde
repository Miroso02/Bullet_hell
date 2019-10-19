class Bullet {
  float x;
  float y;
  int w;
  
  float speed;
  float speedX = 0;
  float speedY = 0;
  float acceleration = 0;
  
  int numberOfRicoshets = 0;
  int opp;
  color col;
  
  Bullet(float xx, float yy, int ww) {
    x = xx;
    y = yy;
    w = ww;
    col = color(255);
    speed = 4;
    //opp = 255;
  }
  
  private void display() {
    noStroke();
    fill(col, opp);
    ellipse(x, y, w, w);
  }
  
  private void move() {
    x += speed * speedX;
    y += speed * speedY;
    speedY += acceleration;
    if(numberOfRicoshets > 0) rikoshet(true, false);// rikoshet(x, y)
  } 
  /*public void fire(int numberOfCurrentBullet, float xx, float yy, Bullet arLast) {
    numberOfRicoshets = 0;
    float[] uselessData = null;
    if(arLast != null) uselessData = arLast.getData();
    float[] res = m.fire(numberOfCurrentBullet, xx, yy, uselessData);
    x = res[0];
    x0 = x;
    y = res[1];
    y0 = y;
    speed = res[4];
    speedX = res[2];
    speedY = res[3];
    try {
      numberOfRicoshets = int(res[5]);
      w = int(res[6]);
      acceleration = res[7];
    } catch(Exception e) {}
    opp = 255;
  }*/
  
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
  
  public void changeColor(float numberOfCurrentBullet, float length) {
    float k = length / 562;
    float colK;
    colorMode(HSB);
    colK = (numberOfCurrentBullet < length / 2) ? (numberOfCurrentBullet / k) : (numberOfCurrentBullet - length / 2) / k;
    col = color(colK, 255, 255);
    colorMode(RGB);
  }
  
  private void rikoshet(boolean rx, boolean ry) {
      if(rx) {
        if(x + speedX > width || x - speedX < 0) {
          speedX=- speedX;
          numberOfRicoshets--;
        }
      }
      if(ry) {
        if(y + speedY > height || y - speedY < 0) {
          speedY = -speedY;
          numberOfRicoshets--;
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
  
  /*public float[] getData() {
    float[] res = {x0, y0, speedX, speedY, x, y};
    return res;
  }*/
}