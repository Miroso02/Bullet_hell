class Player {
  float x;
  float y;
  int size;
  int numOfCurBullet;
  Bullet[] bullets = new Bullet[150];
  
  public Player(float x, float y, int size) {
    this.x = x;
    this.y = y;
    this.size = size;
    
    for(int a = 0; a < bullets.length; a++) {
      bullets[a] = new Bullet(x, y, 6, 
      new Moving() {
        public float[] fire(int a, float xL, float yL, float... other) {
          float bulletSpeedX = 0;
          float bulletSpeedY = 0;
          int shootDirection = numOfCurBullet % 3;
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
  
  //------------------------------------------
  
  public void doAll() {
    move();
    shoot();
    display();
  }
  
  //------------------------------------------
  
  void move() {
    if (!isOnTheScreen()) stayOnTheScreen();
  
    if (mousePressed) {
      float sensitivity = 1;
      x += sensitivity * (mouseX - pmouseX);
      y += sensitivity * (mouseY - pmouseY);
    }
  }
  
  void shoot() {
    for(int a = 0; a < 2; a++) {
      bullets[numOfCurBullet].fire(numOfCurBullet, x, y, null);
      numOfCurBullet++;
      if(numOfCurBullet >= 149) numOfCurBullet = 0;
    }
    
    for(int a = 0; a < bullets.length; a++) {
      boolean IS_KILLING_PLAYER = false;
      bullets[a].doAll(IS_KILLING_PLAYER);
    }
  }
  
  void display() {
    noStroke();
    fill(255);
    ellipse(x, y, size, size);
  }
  
  //--------------------------------------------
  
  private void stayOnTheScreen() {
    if (x <= 0) x = 1;
    else if (x >= width) x = width - 1;
    if (y <= 0) y = 1;
    else if (y >= height) y = height - 1;
  }
  
  private boolean isOnTheScreen() {
    return (x > 0 && x < width &&
            y > 0 && y < height);
  }
}