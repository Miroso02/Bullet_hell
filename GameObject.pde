abstract class GameObject {
  PVector position;
  int size;

  //--------------- Default methods --------------------------------------------

  public void update() {
    if (isOnScreen()) {
      display();
      move();
    }
  }

  //--------------- Abstract methods -------------------------------------------

  abstract void display();
  abstract void move();

  //--------------- Info methods -----------------------------------------------

  protected boolean isOnScreen() {
    return abs(position.x - width / 2) < width / 2 + size &&
           abs(position.y - height / 2) < height / 2 + size;
  }

  //------------- GETters and SETters ------------------------------------------

  void setPosition(float x, float y) {
    this.position.set(x, y);
  }
  void setPosition(PVector newPosition) {
    this.position = newPosition.copy();
  }
  PVector getPosition() {
    return position.copy();
  }
}
