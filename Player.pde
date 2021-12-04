class Player {
  PImage img;
  PVector pos;
  Player(int x, int y) {
    pos = new PVector(x, y);
    img = loadImage("cat.png");
  }
  
  void draw() {
    image(img,pos.x,pos.y);
  }
}
