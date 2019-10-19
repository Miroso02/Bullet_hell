class Cannon {
  public boolean isUnderFire;
  
  public float x;
  public float y;
  
  private Bullet[] bullets;
  private int numberOfCurrentBullet;
  private int hp;
  private int delta;
  private int toDelta;
  private int nInTime;
  private int nOfRandom;
  private int rand;
  private boolean dead;
  private boolean advanced;
  private FireAlgoritm fireAlgoritm;
  
  Cannon(int nOfAr, float x, float y,
         int toDelta, int nInTime, int rand,
         int hp, boolean advanced, 
         FireAlgoritm fireAlgoritm) {
    bullets = new Bullet[nOfAr];
    dead = false;
    this.hp = hp;
    this.x = x;
    this.y = y;
    this.rand = rand;
    this.toDelta = toDelta;
    delta = 0;
    this.advanced = advanced;
    this.nInTime = nInTime;
    this.fireAlgoritm = fireAlgoritm;
    
    for (int i = 0; i < nOfAr; i++) {
      bullets[i] = new Bullet(x, y, 10);
    }
  }
  
  public void dos() {
    //death();
    fire();
    for (Bullet bullet: bullets) {
      bullet.doAll();
      if(bullet.isOnScreen()) bullet.death();
    }
    display();
  }
  
  private void xyRandom() {
    x = random(width);
    y = random(400);
  }
  
  private void fire() {
    if(toDelta + 1 <= delta && !dead) {
      if(nOfRandom == 0 && rand != 0) xyRandom();
      nOfRandom++;
      if(nOfRandom >= rand) nOfRandom = 0;
      for(int a=0; a < nInTime; a++) {
        Bullet thisBullet = bullets[numberOfCurrentBullet];
        Bullet prevBullet = null;
        if(advanced && numberOfCurrentBullet > nInTime - 1) {
          prevBullet = bullets[numberOfCurrentBullet - nInTime];
        }
        fireAlgoritm.customFire(numberOfCurrentBullet, thisBullet, prevBullet);
        thisBullet.changeColor(numberOfCurrentBullet, bullets.length);
        numberOfCurrentBullet = (numberOfCurrentBullet < bullets.length - 1) ? ++numberOfCurrentBullet : 0;
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
   // isUnderFire=false;
    for(int i = 0; i < ar.length; i++) {
      Bullet ar0 = ar[i];
      if(ar0.y - ar0.w < y + 20 - 2 
      && ar0.x + ar0.w > x - 20 
      && ar0.x - ar0.w < x + 20 
      && ar0.y + ar0.w > y - 20 + 2) {
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
}