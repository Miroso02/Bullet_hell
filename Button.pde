// Old Button. Nevermind
class Button // TODO: Create normal button!!!
{
  float x;
  float y;
  
  float w;
  float h;
  float paddingWidth;
  float paddingHeight;
  String text;
  color col;
  
  public Button(float x, float y)
  {
    text = "";
    col = color(180, 255, 0);
    setPosition(x, y);
    setPadding(10, 10);
    setParameters(text);
  }
  
  void display() {
    stroke(col);
    
    textSize(30);
    setParameters(text);
    fill(col);
    text(text, x + paddingWidth , y + paddingHeight);
    
    fill(0, 0);
    strokeWeight(0);
    rect(x, y, w, h);
  }
  
  boolean pressed() {
    return mousePressed && onButton();
  }
  
  boolean onButton() {  
    return abs(mouseX - x - w / 2) < w / 2 &&
           abs(mouseY - y - h / 2) < h / 2;
  }
  
  void setPosition(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void setPadding(float pw, float ph) {
    paddingWidth = pw;
    paddingHeight = ph;
  }
  
  void setParameters(String text) {
    this.text = text;
    
    h = 2 * paddingHeight + textAscent() + textDescent();
    w = 2 * paddingWidth + textWidth(text);
  }
}
