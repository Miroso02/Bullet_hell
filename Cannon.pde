class Cannon {
  private Bullet[] bullets;
  private float x, y;
  private int numberOfCurrentBullet, hp;
  private int delta, toDelta;
  private int nInTime, nOfRandom,rand;
  private boolean dead, advanced;
  public boolean isUnderFire;
  private FireAlgoritm fireAlgoritm;
  
  Cannon(int nOfAr, float xx, float yy, int td, int nit, int rando, int hpp, boolean adv, Moving m) {
    bullets = new Bullet[nOfAr];
    dead = false;
    hp = hpp;
    x = xx;
    y = yy;
    rand = rando;
    toDelta = td;
    delta = 0;
    advanced = adv;
    nInTime = nit;
    for(int a = 0; a < bullets.length; a++) {
      bullets[a] = new Bullet(xx, yy, 10, m);
    }
  }
  
  public void dos() {
    death();
    fire();
    for (int i = 0; i < bullets.length; i++) {
      Bullet ar = bullets[i];
      ar.doAll();
       if(ar.isOnScreen()) ar.death();
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
        Bullet ar = bullets[numberOfCurrentBullet];
        Bullet arLast = null;
        if(advanced && numberOfCurrentBullet > nInTime - 1) {
          arLast = bullets[numberOfCurrentBullet - nInTime];
        }
        ar.fire(numberOfCurrentBullet, x, y, arLast);
        ar.changeColor(numberOfCurrentBullet, bullets.length);
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