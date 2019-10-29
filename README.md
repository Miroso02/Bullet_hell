# Bullet Hell Engine
*description*

## Instructions for use

## __OUTDATED!!__

### What shall you set while creating a Cannon:
1) Bullet:
    - bullet.x, bullet.y OR bullet.setPosition() – position
    - bullet.speedX, bullet.speedY OR bullet.setVelocity() – velocity vector
    - bullet.speed – scalar. It's multiplying by speedX and speedY
    - bullet.accelerationY – clear
    - bullet.w – size
    - bullet.col – color (Set in BulletColorPattern)
2) Bullet.RicochetModule:
    - bullet.ricochetModule.numOfRicochets – how many times will the bullet bounce
    - bullet.ricochetModule.ricochetUP – if it ricochets from the top
    - bullet.ricochetModule.ricochetDOWN – if it ricochets from the bottom
    - bullet.ricochetModule.ricochetWALLS – if it ricochets from the left and right
    OR
    - bullet.ricochetModule.setOptions(numOfRicochets, WALLS, UP, DOWN)
3) Cannon:
    - Constructor(allBulletsCount) – how many bullets will control this cannon
    - cannon.x, cannon.y OR cannon.setPosition() - position (Also used in MovePattern)
    - cannon.health – clear
    - cannon.isKillingPlayer – will this cannon's billets kill the player
4) Cannon.MovePattern:
    -     _cannon_.movePattern = new MovePattern(_cannon_) {
              public void move() {
                 In this method you describe cannon moving (Look 3)
              }
          }
5) Cannon.FirePattern:
    -     _cannon_.firePattern = new FirePattern(_cannon_) {
              public void fire() {
                  In this method you describe each bullet behaviour (Look 1 and 2)    
              }
          }
    - cannon.firePattern.shotDelay – time between shots
    - cannon.firePattern.bulletShotsAtOnce – how many bullets does it shoot in each shot  
6) Cannon.firePattern.BulletColorPattern:
    -     _cannon_.firePattern.bulletColPattern = new BulletColorPattern(_cannon_) {
              public void setBulletColor() {
                  In this method you set bullet color (Look last line of 1)
              }
          }

### What can you use in MovePattern, FirePattern and BulletColorPattern:
1) this.cannon is a reference to the cannon that have shot this bullet:
    Fields:
    - this.cannon.numOfCurBullet - number of bullet, shooting now, in array
    - this.cannon.bullets - all bullets, controlled by this cannon  
        I'd highly recommend to set this:  
          ```
          int num = this.cannon.numOfCurBullet;
          ```  
          ```
          Bullet bullet = this.cannon.bullets[num]; // Reference to current bullet
          ``` \
        in the start of FirePattern and BulletColorPattern realisations
    - this.cannon.bulletsCount - amount of all bullets
    - this.cannon.health
    - this.cannon.x, this.cannon.y - cannon position

    Methods:
    - this.cannon.getPosition() - returns cannon position in PVector
    - this.cannon.getPrevBullet() - returns the last shot bullet
2) this (FirePattern):
    - this.shotDelay
    - this.shotDelayCounter - time, passed after the last shot
    - this.bulletShotsAtOnce
3) this (BulletColorPattern):

4) this (MovePattern):
    - this.timeCounter - time, passed after cannon creating

### What prepared patterns can you use in...
1) FirePattern:
    - super.targetPlayerFrom(PVector _startPoint_):  
        Returns PVector of speedX and speedY that must have bullet to  
        reach the player from _startPoint_.
    - super.shootToAllSides(_int numOfDirections_):  
        Directs all bullets in the shot to one of _numOfDirections_ directions  
        depending on their number in array.
2) BulletColorPattern:
    - super.randomColor():  
        Returns random color.
    - super.changeBulletColorHSB(int _numOfCycles_):  
        The bullets array of cannon divides into _numOfCycles_ parts.  
        For each part bullets shimmer with HSB colors starting with RED.
3) MovePattern:
    - super.rotateAround(  
      float _x_, float _y_, float _radius_,
      int _time_, int _period_,
      boolean _clockwise_, float _phase0_):  
        The cannon will rotate around point(_x_, _y_) on distance of _radius_  
        with period = _period_ starting with _phase0_.  
        You should pass this.timeCounter to _time_.  
        _clockwise_:  
          true - clockwise rotation;  
          false - counterclockwise rotation.  
