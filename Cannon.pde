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
  boolean isUnderFire;
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
    if (shotDelayCounter > shotDelay) {
      if (teleportDelay != 0) teleport();
      
      for (int i = 0; i < bulletShotsAtOnce; i++) {
        Bullet bullet = bullets[numOfCurBullet];
        firePattern.fire(bullet, numOfCurBullet, x, y);
        firePattern.setBulletColor(bullet, numOfCurBullet, bullets.length);
        
        numOfCurBullet = (numOfCurBullet < bullets.length - 1) ? ++numOfCurBullet : 0;
        shotDelayCounter = 0;
      }
    }
    shotDelayCounter++;
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
        isUnderFire = true;
      }
    }
    
    if (health <= 0) {
      isDead = true;
    }
  }
  
  //---------------------------------------------
  
  private void teleport() {
    if (teleportCounter % teleportDelay == 0) {
      x = random(width);
      y = random(400);
    } 
    teleportCounter++;
  }
  
  private boolean hit(Bullet bullet) {
    return (bullet.y - bullet.w < y + 20 - 2 
         && bullet.x + bullet.w > x - 20 
         && bullet.x - bullet.w < x + 20 
         && bullet.y + bullet.w > y - 20 + 2);
  }
  
  //---------------------------------------------
  
  void translate(float x, float y) {
    this.x = x;
    this.y = y;
  }
}