# Bullet Hell Engine
*description*

## Instructions for use

### How to create a MPattern:
MPattern (Move pattern) is a bullet/cannon move algoritm.

          MPattern mPattern = new MPattern() {
            public void move() {
              // You can use a pointer to __gameObject__, which owns this pattern
              // Here you can do whatever you want

              this.time // Counts time in frames from creation this pattern

              gameObject.setPosition(__x__, __y__ OR __PVector__);

              // You can also use prepared methods from __PreparedMPatterns__
                super.moveWithConstSpeed()
                // Default method. Just moves object on velocity * speed
                super.moveWithConstSpeedAndRicochet()
                // Does the same, but also bounces from the screen borders using __ricochetModule__ parameters:
                  ricochetModule.numOfRicochets – how many times will the bullet bounce
                  ricochetModule.ricochetUP – if it ricochets from the top
                  ricochetModule.ricochetDOWN – if it ricochets from the bottom
                  ricochetModule.ricochetWALLS – if it ricochets from the left and right
                  OR
                  ricochetModule.setOptions(numOfRicochets, WALLS, UP, DOWN)
                // __!!!__ Set this parameters AFTER mPattern creating, not in move() method

                super.rotateAround(float _x_, float _y_, float _radius_, int _period_, boolean _clockwise_, float _phase0_):  	
                  // The cannon will rotate around point(_x_, _y_) on distance of _radius_
                  // with period = _period_ starting with _phase0_.  	
                  // _clockwise_:  	
                  //  true - clockwise rotation
                  //  false - counterclockwise rotation  
            }
          }

### How to create a FCPattern:
FCPattern (Fire and Color pattern) is a cannon fire algoritm. It is responsible
for bullets of this cannon and their behaviour. Cannon can has more than 1 FCPattern

          FCPattern fcPattern = new FCPattern() {
            public void fire() {
              // Firstly, you should create new Bullet and add it to the Array:
              Bullet bullet = new Bullet();
              this.bullets.add(bullet);

              // Then you should set some of bullet parameters to describe it's behaviour
              // Here you can do whatever you want

              bullet.setPosition(__x__, __y__ OR __PVector__);
              bullet.size - Radius

              // To set bullet color you can use
              bullet.col = ... OR bullet.setColor(__red__, __green__, __blue__)
              // You can also use prepared methods from __PreparedFCPatterns__
                super.getRandomColor() // Returns random color
                super.setColorOfAllShot(__color__)
                // Not only this bullet coolor changes, but also color of all
                // bullets, shot at the same time
                super.changeBulletColorHSB(__bulletsPerCycle__)
                // Bullets shimmer with bright HSB colors.
                // Every __bulletsPerCycle__ bullet will be RED

              // To set bullet moving algoritm you can use
              bullet.mPattern.setVelocity(__x__, __y__ OR __PVector__) // This vector will be normalized
              bullet.mPattern.speed // Scalar. It's multiplying by velocity

              // For default, bullet will just move with constant speed.
              // But if you want it to move more complicated, you can
              // initialize your own move pattern:
              bullet.setMPattern(__mPattern__);

              // You can also use prepared methods from __PreparedFCPatterns__
                super.targetPlayerFrom(PVector _startPoint_)  	
                // Returns PVector of speedX and speedY that must have bullet to  	
                // reach the player from _startPoint_.

                super.shootToAllSides(_int numOfDirections_)  	
                //Directs all bullets in the shot to one of _numOfDirections_ directions  	
                //depending on their number in array.
                super.shootToAllSides()
                // Automatically sets _numOfDirections_ depending on _bulletsPerShot_
            }
          }

### How to create a Cannon:
- Cannon cannon = new Cannon();
- cannons.add(cannon);
##### Optional:
- cannon.setPosition(__x__, __y__ OR __PVector__); - Default: center of the screen
- cannon.health - Default: 100
- cannon.col - Default: Violet

### How to make the cannon shoot:
- cannon.addFCPattern(__fcPattern__);
##### Optional:
- __fcPattern__.shotCooldown = _n_ - cannon shoots every _n_ frames; Default: 1
- __fcPattern__.bulletsPerShot - How many bullets shoots the cannon at once; Default: 1
- __fcPattern__.setTimeCounter(_value_) - Time counting for this pattern starts not from 0, but from _value_

### How to make the cannon move:
- cannon.setMPattern(__mPattern__);


#### What can you also use in FCPattern:
- this.getPrevBullet() - returns the bullet shot before this
- this.getBullet(_relativePosition_) - returns the bullet shot _relativePosition_ erlier than this
- this.getTimeFromShot()
- this.getTimeToShot()
- this.gameObject is a reference to the cannon that owns this pattern:
    __!!! If you want to use them, firstly cast gameObject to Cannon__
    - this.cannon.health
    - this.cannon.getPosition() - returns cannon position in PVector
    - this.cannon.getFCPattern(__index__) - to get information from other fcPatterns
    - this.cannon.mPattern
