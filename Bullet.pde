class Bullet extends GameObject {
  public Bullet() {
    // Default values
    setPosition(2000, 0); // Offscreen
    size = 10;
    col = color(255);

    setMPattern(new MPattern() {
      public void move() {
        moveWithConstSpeed();
      }
    });
  }

  void display() {
    fill(col);
    ellipse(position, size);
  }
}
