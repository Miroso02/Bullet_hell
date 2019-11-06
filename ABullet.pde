class ABullet extends Bullet { // Agressive bullet
  public ABullet() {
    super();
  }

  @Override void update() {
      display();
      move();
      killPlayer(); // Comment this in test mode
  }

  private void killPlayer() {
    if (isTouching(player)) {
      player.isDead = true;
    }
  }
}
