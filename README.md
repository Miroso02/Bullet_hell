# Bullet Hell Engine
*description*

### Instructions for use

1) Bullet:
    - bullet.x, bullet.y – position
    - bullet.speedX, bullet.speedY – velocity vector
    - bullet.speed – scalar. It's multiplying by speedX and speedY
    - bullet.accelerationY – clear
    - bullet.w – size
    - bullet.col – color
  
2) Bullet.RicochetModule:
    - bullet.ricochetModule.numOfRicochets – how many times will the bullet bounce
    - bullet.ricochetModule.ricochetUP – if it ricochets from the top
    - bullet.ricochetModule.ricochetDOWN – … … … … … … … … … … … bottom
    - bullet.ricochetModule.ricochetWALLS – … … … … … … … left and right
   
3) Cannon:
    - Constructor(allBulletsCount) – how many bullets will control the cannon
    - cannon.setPosition(x, y)
    - cannon.health – clear
    - cannon.shotDelay – time between shots
    - cannon.bulletShotsAtOnce – how many bullets does it shoot in each shot
    - cannon.isKillingPlayer – will this cannon's billets kill the player
    - cannon.teleportDelay = n – after n shots the cannon will teleport randomly
  
4)
        Cannon.firePattern = new FirePattern() {
            public void fire(...) {
                In this method you describe each bullet behaviour  
                depending on it's number in massive  
            }
        }
    
5)
        Cannon.bulletColPattern = new BulletColorPattern() {
            public void setBulletColor(...) {
                In this method you set bullet color
                depending on it's number in massive
            }
        }
