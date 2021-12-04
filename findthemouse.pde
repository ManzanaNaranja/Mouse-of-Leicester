ArrayList<Node> nodes;
Game game;
Player player;
PImage mouseImg;
int red, green, blue;
boolean game_over, is_animating;
void setup() { 
  size(800, 600);
  textSize(40);
  nodes = new ArrayList<Node>();
  init_nodes();
  game = new Game(1);
  player = new Player(125, 250);
  game_over = false;
  is_animating = false;
  red = color(139, 0, 0);
  green = color(0, 140, 0);
  blue = color(0, 0, 140);
  mouseImg = loadImage("mouse.png");
}

void draw() {
  background(189);
  image(mouseImg, 380, 250);
  if (game_over) {
  } else if (is_animating == false) {
    set_visible_nodes();
    draw_time_of_day();
    draw_paths();
    draw_nodes();
    player.draw();
  } else {
    Node n = getNodeByCharacter(game.node);
    player.pos.x = n.bounds.x;
    player.pos.y = n.bounds.y;
    is_animating = false;
  }
}

void draw_time_of_day() {
  push();
  textSize(20);
  textAlign(CENTER);
  fill(blue);
  text("   Morning", 40, 40);
  fill(green);
  text("Noon", 40, 80);
  fill(red);
  text("Night", 40, 120);
  pop();
}

void draw_paths() {
  for (Character c : game.stuff.get(GColor.RED).keySet()) {
    for (Character e : game.stuff.get(GColor.RED).get(c)) {
      l(red, c, e);
    }
  }
  for (Character c : game.stuff.get(GColor.GREEN).keySet()) {
    for (Character e : game.stuff.get(GColor.GREEN).get(c)) {
      l(green, c, e);
    }
  }

  for (Character c : game.stuff.get(GColor.BLUE).keySet()) {
    for (Character e : game.stuff.get(GColor.BLUE).get(c)) {
      l(blue, c, e);
    }
  }
}

void l(int col, char c1, char c2) {
  push();
  strokeWeight(10);
  stroke(col);
  Node n1 = getNodeByCharacter(c1);
  Node n2 = getNodeByCharacter(c2);
  line(n1.bounds.x+25, n1.bounds.y+25, n2.bounds.x+25, n2.bounds.y+25);
  pop();
}

void set_visible_nodes() {
  ArrayList<Character> apple = game.moves();
  for (Character c : apple) {
    Node n = getNodeByCharacter(c);
    n.set_visibility(true);
  }
}

void hide_nodes() {
  for (Node n : nodes) {
    n.visible = false;
  }
}


void draw_nodes() {
  for (Node n : nodes) {
    n.show();
  }
}

void _rect(int x, int y, char c) {

  x += 75;
  nodes.add(new Node(x, y, c));
}

Node getNodeByCharacter(char c) {
  for (Node n : nodes) {
    if (c == n.name) {
      return n;
    }
  }
  return null;
}

void init_nodes() {
  _rect(50, 50, 'V');
  _rect(50, 250, 'M');
  _rect(50, 450, 'F');

  _rect(200, 50, 'C');
  _rect(150, 150, 'A');   
  _rect(200, 250, 'H');
  _rect(150, 350, 'E');
  _rect(200, 450, 'S');


  _rect(350, 150, 'T');
  _rect(350, 250, 'G');
  _rect(350, 350, 'R');

  _rect(500, 50, 'I');
  _rect(550, 150, 'D');   
  _rect(500, 250, 'K');
  _rect(550, 350, 'L');
  _rect(500, 450, 'P');


  _rect(650, 50, 'B');
  _rect(650, 250, 'J');
  _rect(650, 450, 'N');
}
