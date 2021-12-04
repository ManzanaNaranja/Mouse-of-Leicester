class Game {
   int game_mode; // 0 = greenstart, else bluestart
   GColor active_color;
   ArrayList<Character> history;
   HashMap<GColor, HashMap<Character, ArrayList<Character>>>  stuff;
   char node;
   Game(int m) {
     game_mode = m;
     if(m == 0) { 
       active_color = GColor.GREEN;
     } else {
       active_color = GColor.BLUE;
     }
     history = new ArrayList<Character>();
     history.add('M');
     node = 'M';
     stuff = new HashMap<GColor, HashMap<Character, ArrayList<Character>>>();
     stuff.put(GColor.RED, new HashMap<Character, ArrayList<Character>>());
     stuff.put(GColor.GREEN, new HashMap<Character, ArrayList<Character>>());
     stuff.put(GColor.BLUE, new HashMap<Character, ArrayList<Character>>());
     load_maps();
   }
   
   ArrayList<Character> moves() {
     return stuff.get(active_color).get(node);
   }
   
   void move(char m) {
     if(is_move_valid(m) == false) return;
     node = m;
     history.add(m);
     increment_color();
   }
   
   void undo() {
     if(history.size() == 1) return;
     history.remove(history.size()-1);
     node = history.get(history.size()-1);
     decrement_color();
   }
   
   void print_history() {
     for(Character c : history) {
       print(c + " ");
       
     }
     println();
   }
   
   boolean is_move_valid(char c) {
     ArrayList<Character> _moves = this.moves();
     for(int i = 0; i < _moves.size(); i++) {
       if(c == _moves.get(i)) return true;
     }
     return false;
   }
   
   void print_maps() {
     for(Character c : stuff.get(GColor.RED).keySet()) {
       print(c + ": ");
       for(Character e : stuff.get(GColor.RED).get(c)) {
         print(e + " ");
         
       }
       println();
     }
   }
   
   private void increment_color() {
     if(game_mode == 0) {
       if(active_color == GColor.GREEN) {
         active_color = GColor.BLUE;
       } else if(active_color == GColor.BLUE) {
         active_color = GColor.RED;
       } else {
         active_color = GColor.GREEN;
       }
     } else {
        if(active_color == GColor.GREEN) {
            active_color = GColor.RED;
        } else if(active_color == GColor.RED) {
            active_color = GColor.BLUE;
        } else {
            active_color = GColor.GREEN;
        }
     }
   } 
   
   private void decrement_color() {
     increment_color();
     increment_color();
   }
   
   private void load_maps() {
     String[] lines = loadStrings("input.txt");
     for(int i = 0; i < lines.length; i++) {
       String[] line = lines[i].split(" ");
        Character a, b, c;
        GColor col;
        a = line[0].charAt(0);
        b = line[1].charAt(0);
        c = line[2].charAt(0);
        if(c == 'R') col = GColor.RED;
        else if(c == 'B') col = GColor.BLUE;
        else col = GColor.GREEN;
        
        if(stuff.get(col).containsKey(a) == false) {
          ArrayList<Character> arr = new ArrayList<Character>();
          arr.add(b);
          stuff.get(col).put(a,arr);
        } else {
          stuff.get(col).get(a).add(b);
        }
        
        if(stuff.get(col).containsKey(b) == false) {
          ArrayList<Character> arr = new ArrayList<Character>();
          arr.add(a);
          stuff.get(col).put(b, arr);
        } else {
          stuff.get(col).get(b).add(a);
        }
     }
   }
   
   
   
   
   
}
