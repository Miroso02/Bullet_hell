class Cannon {
  Bullet[] bullets;
  int numOfCurBullet;
  
  float x;
  float y;
  int hp;
  
  int delta;
  int toDelta;
  
  int nInTime;
  int nOfRandom;
  int rand;
  
  boolean dead;
  boolean advanced;
  boolean isUnderFire;
  
  FireAlgoritm fireAlgoritm;
  
  public Cannon(int bulletsCount, float x, float y, int toDelta, int nInTime, int rand, int hp, boolean advanced, Moving m) {
    bullets = new Bullet[bulletsCount];
    dead = false;
    this.hp = hp;
    this.x = x;
    this.y = y;
    this.rand = rand;
    this.toDelta = toDelta;
    delta = 0;
    this.advanced = advanced;
    this.nInTime = nInTime;
    for(int i = 0; i < bullets.length; i++) {
      bullets[i] = new Bullet(x, y, 10, m);
    }
  }
  
  public void doAll() {
    death();
    fire();
    controlBullets();
    display();
  }
  
  private void xyRandom() {
    x = random(width);
    y = random(400);
  }
  
  private void controlBullets() {
    for (Bullet bullet: bullets) {
      boolean IS_KILLING_PLAYER = true;
      bullet.doAll(IS_KILLING_PLAYER);
    }
  }
  
  private void fire() {
    if(toDelta + 1 <= delta && !dead) {
      if(nOfRandom == 0 && rand != 0) xyRandom();
      nOfRandom++;
      if(nOfRandom >= rand) nOfRandom = 0;
      for(int a=0; a < nInTime; a++) {
        Bullet ar = bullets[numOfCurBullet];
        Bullet arLast = null;
        if(advanced && numOfCurBullet > nInTime - 1) {
          arLast = bullets[numOfCurBullet - nInTime];
        }
        ar.fire(numOfCurBullet, x, y, arLast);
        ar.changeColor(numOfCurBullet, bullets.length);
        numOfCurBullet = (numOfCurBullet < bullets.length - 1) ? ++numOfCurBullet : 0;
        delta = 0;
      }
    }
    delta++;
  }
  
  public void display() {
    if(!dead) {
      noFill();
      strokeWeight(1);
      stroke(200, 0, 255);
      rect(x, y, 40, 40);
      fill(200, 0, 255);
      textSize(20);
      textAlign(CENTER);
      text(hp, x, y);
    }
  }
  
  private void death()
  {
    Bullet[] ar = player.bullets;
    for(int i = 0; i < ar.length; i++) {
      Bullet bullet = ar[i];
      if (hit(bullet)) {
        hp--;
        player.bullets[i].x = 2000;
        isUnderFire = true;
      }
    }
    if(hp <= 0) {
      dead = true;
      x = 2000;
    }
  }
  
  private boolean hit(Bullet bullet) {
    return (bullet.y - bullet.w < y + 20 - 2 
         && bullet.x + bullet.w > x - 20 
         && bullet.x - bullet.w < x + 20 
         && bullet.y + bullet.w > y - 20 + 2);
  }
}