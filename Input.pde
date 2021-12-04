void mousePressed() {
  for(Node n : nodes) {
    if(mouseX > n.bounds.x && mouseX < n.bounds.x + n.bounds.width && mouseY > n.bounds.y && mouseY < n.bounds.y + n.bounds.height) {
      ArrayList<Character> moves = game.moves();
      for(Character c : moves) {
        if(c == n.name) {
          is_animating = true;
          hide_nodes();
          game.move(c);
          set_visible_nodes();
          
        }
        
      }
    }
  }
}
