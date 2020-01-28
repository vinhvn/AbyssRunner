/*
Game object by Vinh
*/
class Game {
  Tile[][] map; //2D array of tiles for map
  int score;
  boolean gameOver;

  Game() {
    map = new Tile[col][row];
    score = 0;
    gameOver = false;
  }

  void display() {
    for (int i = 0; i < col; i++) { // draws map
      for (int j = 0; j < row; j++) {
        map[i][j].display();
      }
    }
  }

  void interaction(float x, float y) { //if the player walks over...
    if (map[int(x)][int(y)].type == 0) { //empty tile
      death.pause();
      death.rewind();
      death.play(); //they die!
      gameOver = true; //despair :C
    } else if (map[int(x)][int(y)].type == 2) { //ice tile
      if (knight.lastMove == 1) { //if lastMove is up
        knight.moveUp();
      } else if (knight.lastMove == 2) { //lastMove is right
        knight.moveRight();
      } else if (knight.lastMove == 3) { //lastMove is down
        knight.moveDown();
      } else if (knight.lastMove == 4) { //lastMove is left
        knight.moveLeft();
      }
    } else if (map[int(x)][int(y)].type == 3) { //fire
      death.pause();
      death.rewind();
      death.play(); //they die!
      gameOver = true; //more despair :C
    } else if (map[int(x)][int(y)].type == 4) { //web tile
      knight.stuck = true; //oh no
      if (!webbed.isPlaying()) {
        webbed.pause();
        webbed.rewind();
      }
      webbed.play(); //play the splash
      tint(255, 100); //transparent
      image(webOverlay, 0, 0, width, height); //display the web image
      if (frameCount % 60 == 0) { //every second, it resets
        map[int(x)][int(y)].type = 1; //change web to stone
        knight.stuck = false; //no longer stuck
      }
    } else if (map[int(x)][int(y)].type == 5) { //coin tile
      coinGet.pause();
      coinGet.rewind();
      coinGet.play(); //play the annoying sound
      score+=100; //score up
      map[int(x)][int(y)].type = 1; //change coin to stone
    }
  }

  void timer() {
    for (int i = 0; i < col; i++) { //check every map tile
      for (int j = 0; j < row; j++) {
        if (frameCount % 180 == 0) { //every 3 seconds
          if (map[i][j].type == 3) { //if fire tile
            map[i][j].type = 6; //switch to furnace tile
          } else if (map[i][j].type == 6) { //if furnace tile
            map[i][j].type = 3; //switch to fire tile
          }
        }
      }
    }
  }

  void build() {
    if (randomMode) {
      for (int i = 0; i < col; i++) {
        for (int j = 0; j < row; j++) {
          map[i][j] = new Tile(int(random(1, 7)), i, j); //set every tile to be randomly set
        }
      }
      map[3][13].type = 1; //first tile is always stone
    } else {
      //reset map to empty space
      for (int i = 0; i < col; i++) {
        for (int j = 0; j < row; j++) {
          map[i][j] = new Tile(0, i, j);
        }
      }
      int mapChoice = int(random(3)); //choose between 3 layouts
      switch(mapChoice) {
      case 0:
        map[3][13].type = 1; //handmade maps by Nick
        map[3][12].type = 1;
        map[3][11].type = 5;
        map[2][11].type = 1;
        map[3][10].type = 2;
        map[2][10].type = 1;
        map[1][10].type = 3;
        map[1][9].type = 1;
        map[1][8].type = 1;
        map[2][8].type = 2;
        map[3][8].type = 6;
        map[4][8].type = 5;
        map[4][7].type = 1;
        map[4][6].type = 4;
        map[4][5].type = 5;
        map[5][5].type = 2;
        map[3][5].type = 1;
        map[2][5].type = 3;
        map[2][4].type = 1;
        map[3][4].type = 6;
        map[2][3].type = 2;
        map[2][2].type = 4;
        map[3][2].type = 5;
        map[3][1].type = 2;
        map[3][0].type = 5;
        break;
      case 1:
        map[3][13].type = 1;
        map[4][13].type = 1;
        map[3][12].type = 2;
        map[4][12].type = 1;
        map[5][12].type = 3;
        map[6][12].type = 5;
        map[4][11].type = 2;
        map[4][10].type = 6;
        map[5][10].type = 5;
        map[3][10].type = 1;
        map[3][9].type = 2;
        map[4][9].type = 1;
        map[6][8].type = 5;
        map[5][8].type = 3;
        map[4][8].type = 1;
        map[3][8].type = 2;
        map[4][7].type = 1;
        map[4][6].type = 5;
        map[3][6].type = 4;
        map[2][6].type = 6;
        map[1][6].type = 5;
        map[3][5].type = 1;
        map[2][4].type = 4;
        map[3][4].type = 1;
        map[2][3].type = 1;
        map[3][3].type = 2;
        map[4][3].type = 5;
        map[5][3].type = 2;
        map[4][2].type = 1;
        map[4][1].type = 3;
        map[4][0].type = 5;
        break;
      case 2:
        map[3][13].type = 1;
        map[3][12].type = 2;
        map[4][12].type = 5;
        map[2][12].type = 1;
        map[1][12].type = 1;
        map[3][11].type = 1;
        map[4][11].type = 6;
        map[1][11].type = 2;
        map[1][10].type = 6;
        map[1][9].type = 5;
        map[1][8].type = 4;
        map[2][8].type = 1;
        map[3][8].type = 2;
        map[4][8].type = 3;
        map[5][8].type = 5;
        map[2][7].type = 1;
        map[2][6].type = 1;
        map[3][6].type = 1;
        map[3][5].type = 2;
        map[4][5].type = 5;
        map[5][5].type = 1;
        map[6][5].type = 1;
        map[4][4].type = 6;
        map[3][4].type = 1;
        map[6][4].type = 2;
        map[6][3].type = 3;
        map[6][2].type = 5;
        map[6][1].type = 1;
        map[6][0].type = 5;
        break;
      }
    }
  }
}