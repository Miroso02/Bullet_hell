PVector pressPos;
PVector releasePos;

class Button extends GameObject
{
  PVector sizes = new PVector(0, 0);
  PVector padding= new PVector(0, 0);

  String text;

  color pcol;

  public Button(float x, float y)
  {
    setPosition(x, y);

    col = color(180, 255, 0);
    pcol = color(255, 100, 0);

    textSize(30);
    setPadding(10, 10);
    setOptions("");

    pressPos = new PVector(0, 0);
    releasePos = new PVector(0, 0);
  }

  void display() {
    color fillCol = (onButton(mouseX, mouseY)) ? pcol : col;
    stroke(fillCol);

    textSize(30);
    fill(fillCol);
    text(text, position.x, position.y + padding.y);

    fill(0, 0);
    rect(position.x, position.y, sizes.x, sizes.y);
  }

  boolean pressed() {
    return onButton(pressPos) && onButton(releasePos);
  }

  boolean onButton(PVector v)  {
    return onButton(v.x, v.y);
  }

  boolean onButton(float mx, float my) {
    return abs(mx - position.x) < sizes.x / 2 &&
           abs(my - position.y) < sizes.y / 2;
  }

  void setPadding(float pw, float ph) {
    padding.x = pw;
    padding.y = ph;
  }

  void setOptions(String text) {
    this.text = text;

    sizes.x = 2 * padding.x + textWidth(text);
    sizes.y = 2 * padding.y + textAscent() + textDescent();
  }
}

//------------------------------------------------------------------------------

void mousePressed() {
  pressPos = new PVector(mouseX, mouseY);
  releasePos = new PVector(0, 0);
}

void mouseReleased() {
  releasePos = new PVector(mouseX, mouseY);
}
