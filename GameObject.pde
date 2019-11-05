abstract class GameObject {
  PVector position;
  int size;

  //--------------- Default methods --------------------------------------------

  public void update() {
    display();
    move();
  }

  //--------------- Abstract methods -------------------------------------------

  abstract void display();
  abstract void move();

  //--------------- Info methods -----------------------------------------------

  protected boolean isOnScreen() {
    return abs(position.x - width / 2) < width / 2 + size &&
           abs(position.y - height / 2) < height / 2 + size;
  }

  public float getDistTo(GameObject obj) {
    return PVector.dist(position, obj.position);
  }
  public boolean isTouching(GameObject obj) {
    float dist = getDistTo(obj);
    return dist < (size + obj.size) / 2;
  }
  /*public static float getDist(GameObject obj1, GameObject obj2) {
    return PVector.dist(obj1.position, obj2.position);
  }*/
  // It has to work, but it doesn't

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
