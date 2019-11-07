abstract class MPattern extends PreparedMPatterns {
  MPattern() {
    this.speed = 1;
    this.velocity = new PVector(0, 0);

    ricochetModule = new RicochetModule();
  }

  abstract public void move();

  public void wrappedMove() {
    move();
    time++;
  }
}
