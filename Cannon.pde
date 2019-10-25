class Cannon {
  Bullet[] bullets;
  int numOfCurBullet;
  int bulletsCount;
  
  float x;
  float y;
  int health;
  
  boolean isDead;
  boolean isKillingPlayer;
  // TODO: Move this variable to Bullet
  
  BulletColorPattern bulletColPattern;
  // TODO: Create module for color
  FireModule fireModule;
  MoveModule moveModule;
  // TODO: Add connection between modules
  
  //----------- Constructor --------------------------------------
  
  public Cannon(int bulletsCount) {
    bullets = new Bullet[bulletsCount];
    this.bulletsCount = bulletsCount;
    
    // Default values
    x = width / 2;
    y = height / 2;
    
    health = 100;
    
    isKillingPlayer = true;
    isDead = false;
    
    // Default realisations do nothing
    bulletColPattern = new BulletColorPattern() {
      public void setBulletColor(Bullet b, int n, int c) {
        b.col = color(255);
      }
    };
    
    for (int i = 0; i < bulletsCount; i++) {
      bullets[i] = new Bullet();
    }
    
    fireModule = new FireModule();
    moveModule = new MoveModule();
  }
  
  //--------- Multipurpose methods --------------------------
  
  public void doAll() {
    if (!isDead) {
      takeDamage();
      fire();
      move();
      display();
    }
    controlBullets();
  }
  
  //--------- Main methods --------------------------------
  
  private void controlBullets() {
    for (Bullet bullet: bullets) {
      bullet.doAll(isKillingPlayer);
    }
  }
  
  void fire() {
    fireModule.fire();
  }
  
  void move() {
    moveModule.move();
  }
  
  void display() {
    noFill();
    strokeWeight(1);
    stroke(200, 0, 255);
    rect(x, y, 40, 40);
    
    fill(200, 0, 255);
    textSize(20);
    textAlign(CENTER);
    text(health, x, y);
  }
  
  void takeDamage()
  {
    for (Bullet bullet: player.playerGun.bullets) {
      if (hit(bullet)) {
        health--;
        bullet.x = 2000;
      }
    }
    
    if (health <= 0) {
      isDead = true;
    }
  }
  
  //--------- Private inner methods -------------------------
  
  private boolean hit(Bullet bullet) {
    return (bullet.y - bullet.w < y + 20 - 2 
         && bullet.x + bullet.w > x - 20 
         && bullet.x - bullet.w < x + 20 
         && bullet.y + bullet.w > y - 20 + 2);
  }
  
  //--------- GETters / SETters ----------------------
  
  void setPosition(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  //------------ Modules -------------------------------
  //----------- Fire module ----------------------------
  
  private class FireModule {
    private int shotDelayCounter = 0;
    int shotDelay;
    int bulletShotsAtOnce;
    
    FirePattern firePattern;
    
    public FireModule() {
      shotDelay = 3;
      bulletShotsAtOnce = 1;
      
      firePattern = new FirePattern() {
        public void fire(Bullet b, int n, float x, float y) {}
      };
    }
    
    void fire() {
      if (shotCooldown()) {
        for (int i = 0; i < bulletShotsAtOnce; i++) {
          int bNum = nextBulNum();
          Bullet bullet = bullets[bNum];
          firePattern.fire(bullet, bNum, x, y);
          bulletColPattern.setBulletColor(bullet, bNum, bulletsCount);
        }
      }
    }
      
    private int nextBulNum() {
      if (numOfCurBullet < bulletsCount - 1) {
        return numOfCurBullet++;
      } else {
        return numOfCurBullet = 0;
      }
    }
  
    private boolean shotCooldown() {
      if (shotDelayCounter > shotDelay) {
        shotDelayCounter = 2;
        return true;
      }
      shotDelayCounter++;
      return false;
    }
  }
  
  //----------- Move module -----------------------------------
  
  private class MoveModule {
    MovePattern movePattern;
    
    private int timeCounter = 0;
    
    public MoveModule() {
      movePattern = new MovePattern() {
        public PVector move(float x, float y, int t) {
          return new PVector(x, y);
        }
      };
    }
    
    void move() {
      PVector newPosition
        = movePattern.move(x, y, timeCounter);
        
      x = newPosition.x;
      y = newPosition.y;
      
      timeCounter++;
    }
  }
}