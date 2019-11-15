PVector pressPos;
PVector releasePos;
boolean mouseReleased = false;

class Button extends GameObject
{
  PVector dimensions = new PVector(0, 0);
  
  String text;

  color pcol;

  public Button(float x, float y)
  {
    setPosition(x, y);

    col = color(180, 255, 0);
    pcol = color(255, 100, 0);

    textSize(30);
    setText("");
    setPadding(10, 10);

    pressPos = new PVector(0, 0);
    releasePos = new PVector(0, 0);
  }

  void display() {
    color fillCol = (onButton(mouseX, mouseY)) ? pcol : col;
    stroke(fillCol);

    textSize(30);
    textAlign(CENTER, CENTER);
    fill(fillCol);
    text(text, position.x, position.y);
    textAlign(CENTER);

    fill(0, 0);
    rect(position.x, position.y, dimensions.x, dimensions.y);
  }

  boolean pressed() {
    return mouseReleased && onButton(pressPos) && onButton(releasePos);
  }

  boolean onButton(PVector v)  {
    return onButton(v.x, v.y);
  }

  boolean onButton(float mx, float my) {
    return abs(mx - position.x) < dimensions.x / 2 &&
           abs(my - position.y) < dimensions.y / 2;
  }
  
  private void setText(String text) {
    this.text = text;
  }

  private void setPadding(PVector padding) {
    dimensions.x = 2 * padding.x + textWidth(text);
    dimensions.y = 2 * padding.y + textAscent() + textDescent();
  }
  
  private void setPadding(float pw, float ph) {
    setPadding(new PVector(pw, ph));
  }
  
  void setOptions(String text, float pw, float ph) {
    setText(text);
    setPadding(pw, ph);
  }
  
  void setOptions(String text, PVector padding) {
    setText(text);
    setPadding(padding);
  }
  
  void setOptions(String text) {
    setOptions(text, 10, 10);
  }
}

//------------------------------------------------------------------------------

void mousePressed() {
  pressPos = new PVector(mouseX, mouseY);
  releasePos = new PVector(0, 0);
}

void mouseReleased() {
  releasePos = new PVector(mouseX, mouseY);

  mouseReleased = true;
}
