class Player { // main character
  PVector p; //position
  boolean stuck;
  int lastMove; //stores last move

  Player(int x, int y) {
    p = new PVector(x, y);
    stuck = false;
    lastMove = 0; //empty
  }

  void display() {
    tint(255);
    image(character, int(p.x)*(width/col), int(p.y)*(height/row), width/col, height/row);
  }

  void moveUp() {
    if (p.y > 0 && !stuck) {
      p.y--;
    }
  }

  void moveDown() {
    if (p.y < row-1 && !stuck) {
      p.y++;
    }
  }

  void moveLeft() {
    if (p.x > 0 && !stuck) {
      p.x--;
    }
  }

  void moveRight() {
    if (p.x < col-1 && !stuck) {
      p.x++;
    }
  }
  
  void reset() { // set player at center bottom of screen
    p.set(3,13);
  }
  
  float getX() { //returns x position
    return p.x;
  }
  
  float getY() { //returns y position
    return p.y;
  }
}