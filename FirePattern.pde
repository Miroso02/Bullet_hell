abstract class FirePattern extends PreparedFirePatterns {
  abstract public void fire(Bullet currentBullet, int numOfCurBullet, float cannonX, float cannonY);
}

//---------------------------------------------------------------------------------------------------

class PreparedFirePatterns {
  // TODO: Add some patterns
  
  public PVector targetPlayerFrom(float x, float y) {
    float distToPlayerX = player.x - x;
    float distToPlayerY = player.y - y;
    float distToPlayer = 
      sqrt(sq(distToPlayerX) + sq(distToPlayerY));
    
    float speedX = distToPlayerX / distToPlayer;
    float speedY = distToPlayerY / distToPlayer;
    
    return new PVector(speedX, speedY);
  }
}
