class Bullet extends GameObject {
  //--------- Constructor ------------------------------------------------------

  public Bullet() {
    // Default values
    position = new PVector(2000, 0); // Offscreen
    size = 10;
    col = color(255);

    setMPattern(new MPattern() {
      public void move() {
        moveWithConstSpeed();
      }
    });
  }

  //----------- Main methods ---------------------------------------------------

  void display() {
    noStroke();
    fill(col);
    ellipse(position.x, position.y, size, size);
  }

  //--------- GETters / SETters ------------------------------------------------
  
}
