PVector pressPos;
PVector releasePos;
boolean mouseReleased = false;

class Button
{
  float x;
  float y;

  float w;
  float h;
  float paddingWidth;
  float paddingHeight;

  String text;
  color col;
  color pcol;

  public Button(float x, float y)
  {
    text = "";
    col = color(180, 255, 0);
    pcol = color(255, 100, 0);
    setPosition(x, y);
    setPadding(10, 10);
    setOptions(text);

    pressPos = new PVector(0, 0);
    releasePos = new PVector(0, 0);
  }

  void display() {
    color fillCol = (onButton(mouseX, mouseY)) ? pcol : col;
    stroke(fillCol);

    textSize(30);
    setOptions(text);
    fill(fillCol);
    text(text, x, y + paddingHeight);

    fill(0, 0);
    strokeWeight(0);
    rect(x, y, w, h);
  }

  boolean pressed() {
    return onButton(pressPos) && onButton(releasePos);
  }

  boolean onButton(PVector v)  {
    return onButton(v.x, v.y);
  }

  boolean onButton(float mx, float my) {
    return abs(mx - x) < w / 2 &&
           abs(my - y) < h / 2;
  }

  void setPosition(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void setPadding(float pw, float ph) {
    paddingWidth = pw;
    paddingHeight = ph;
  }

  void setOptions(String text) {
    this.text = text;

    h = 2 * paddingHeight + textAscent() + textDescent();
    w = 2 * paddingWidth + textWidth(text);
  }
}

void mousePressed() {
  pressPos = new PVector(mouseX, mouseY);
  releasePos = new PVector(0, 0);
}

void mouseReleased() {
  releasePos = new PVector(mouseX, mouseY);
  mouseReleased = true;
}
