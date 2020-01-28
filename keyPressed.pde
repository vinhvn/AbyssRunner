void keyPressed() {
  //lastMove saves the users last move for ice tile
  if (menuState == 3) { //if in-game
    if (!game.gameOver) { // check if player is alive
      if (keyCode == UP) {
        knight.moveUp();
        knight.lastMove = 1;
      }
      if (keyCode == RIGHT) {
        knight.moveRight();
        knight.lastMove = 2;
      }
      if (keyCode == DOWN) {
        knight.moveDown();
        knight.lastMove = 3;
      }
      if (keyCode == LEFT) {
        knight.moveLeft();
        knight.lastMove = 4;
      }
    }
  }
}