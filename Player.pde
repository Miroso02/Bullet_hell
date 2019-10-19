class Player {
  float x, y;
  int w;
  int numberOfCurrentBullet;
  Bullet[] bullets = new Bullet[150];
  public Player(float xx, float yy, int ww) {
    x = xx;
    y = yy;
    w = ww;
    for(int a = 0; a < bullets.length; a++) {
      bullets[a] = new Bullet(x, y, 6, 
      new Moving() {
        public float[] fire(int a, float xL, float yL, float... other) {
          float bulletSpeedX = 0;
          float bulletSpeedY = 0;
          int shootDirection = numberOfCurrentBullet % 3;
          switch(shootDirection) {
            case 0: 
              bulletSpeedX = 0;
            break;
            case 1:
              bulletSpeedX = 2;
            break;
            case 2:
              bulletSpeedX = -2;
            break;
          }
          bulletSpeedY = -30;
          
          float[] res = {xL, yL, bulletSpeedX, bulletSpeedY, 1};
          return res;
        }
      } );
    }
  }
  private void display() {
    noStroke();
    fill(255);
    ellipse(x, y, w, w);
  }
  public void move() {
    for(int a = 0; a < 2; a++) {
      bullets[numberOfCurrentBullet].fire(numberOfCurrentBullet, x, y, null);
      numberOfCurrentBullet++;
      if(numberOfCurrentBullet >= 149) numberOfCurrentBullet = 0;
    }
    if(mousePressed) {
      if(x > 0 && x < width && y > 0 && y < height) {
        float k = 1;
        x += k * (mouseX - pmouseX);
        y += k * (mouseY - pmouseY);
      } else {
        if(x <= 0) x = 1;
        else if(x >= width) x = width - 1;
        if( y <= 0)y = 1;
        else if(y >= height) y = height - 1;
      }
    }
    for(int a = 0; a < bullets.length; a++) {
      bullets[a].doAll();
    }
    display();
  }
}