class ABullet extends Bullet { // Agressive bullet
  public ABullet() {
    super();
  }

  void update() {
    if (isOnScreen()) {
      display();
      move();
      killPlayer(); // Comment this in test mode
    }
  }

  void killPlayer() {
    if (touchingPlayer()) {
      player.isDead = true;
    }
  }

  private boolean touchingPlayer() {
    float sumOfRadiuses = (w + player.size) / 2;
    return getDistToPlayer() < sumOfRadiuses;
  }
}
