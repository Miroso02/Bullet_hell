abstract class MPattern extends PreparedMPatterns {
  private int timeCounter = 0;

  MPattern() {
    this.speed = 1;
    this.velocity = new PVector(0, 0);

    ricochetModule = new RicochetModule();
  }

  abstract public void move();

  public void wrappedMove() {
    move();
    timeCounter++;
  }

  int getTime() {
    return timeCounter;
  }
}
