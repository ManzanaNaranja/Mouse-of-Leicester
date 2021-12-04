import java.awt.Rectangle;

class Node {
  Rectangle bounds;
  char name;
  boolean visible;
  Node(int x, int y, char c) {
    bounds = new Rectangle(x, y, 50, 50);
    name = c;
    visible = false;
  }
  
  public void set_visibility(boolean b) {
    visible = b;
  }
  
  public void show() {
    push();
    int x = bounds.x;
    int y = bounds.y;
    if(visible) {
      fill(0,220,0);
      rect(x, y, 50, 50);
      fill(0);
      textAlign(CENTER);
      text(name, x+25,y+40);
    } else {
      fill(255);
      rect(x, y, 50, 50);
      fill(0);
      textAlign(CENTER);
      text(name, x+25,y+40);
    }
    pop();
  }
}
