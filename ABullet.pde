class ABullet extends Bullet { // Agressive bullet
  public ABullet() {
    super();
  }

  @Override void update() {
    if (isOnScreen()) {
      display();
      move();
      killPlayer(); // Comment this in test mode
    }
  }

  private void killPlayer() {
    if (touchingPlayer()) {
      player.isDead = true;
    }
  }

  private boolean touchingPlayer() {
    float sumOfRadiuses = (size + player.size) / 2;
    return getDistToPlayer() < sumOfRadiuses;
  }
}
