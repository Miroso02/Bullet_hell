class Cannon {
  Bullet[] bullets;
  int numOfCurBullet;
  
  float x;
  float y;
  int health;
  
  private int shotDelayCounter;
  int shotDelay;
  int bulletShotsAtOnce;
  
  private int teleportCounter;
  int teleportDelay;
  
  boolean isDead;
  boolean isKillingPlayer;
  
  FirePattern firePattern;
  
  public Cannon(float x, float y, int health,
                int bulletsCount, int shotDelay,
                int bulletShotsAtOnce, 
                int teleportDelay, 
                boolean isKillingPlayer,
                FirePattern firePattern) {
    bullets = new Bullet[bulletsCount];
    this.firePattern = firePattern;
    
    this.isKillingPlayer = isKillingPlayer;
    
    this.x = x;
    this.y = y;
    
    this.health = health;
    this.bulletShotsAtOnce = bulletShotsAtOnce;
    
    this.shotDelay = shotDelay;
    this.teleportDelay = teleportDelay;
    
    shotDelayCounter = 0;
    teleportCounter = 0;
    isDead = false;
    
    for (int i = 0; i < bullets.length; i++) {
      bullets[i] = new Bullet();
    }
  }
  
  //---------------------------------------------
  
  public void doAll() {
    if (!isDead) {
      takeDamage();
      fire();
      display();
    }
    controlBullets();
  }
  
  //---------------------------------------------
  
  private void controlBullets() {
    for (Bullet bullet: bullets) {
      bullet.doAll(isKillingPlayer);
    }
  }
  
  void fire() {
    if (shotCooldown()) {
      teleport();
      
      for (int i = 0; i < bulletShotsAtOnce; i++) {
        int bNum = nextBulNum();
        Bullet bullet = bullets[bNum];
        firePattern.fire(bullet, bNum, x, y);
        firePattern.setBulletColor(bullet, bNum, bullets.length);
      }
    }
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
  
  //---------------------------------------------
  
  private int nextBulNum() {
    if (numOfCurBullet < bullets.length - 1) {
      return numOfCurBullet++;
    } else {
      return numOfCurBullet = 0;
    }
  }
  
  private boolean shotCooldown() {
    if (shotDelayCounter > shotDelay) {
      shotDelayCounter = 0;
      return true;
    }
    shotDelayCounter++;
    return false;
  }
  
  private void teleport() {
    if (teleportDelay != 0) {
      if (teleportCounter % teleportDelay == 0) {
        x = random(width);
        y = random(400);
      } 
      teleportCounter++;
    }
  }
  
  private boolean hit(Bullet bullet) {
    return (bullet.y - bullet.w < y + 20 - 2 
         && bullet.x + bullet.w > x - 20 
         && bullet.x - bullet.w < x + 20 
         && bullet.y + bullet.w > y - 20 + 2);
  }
}