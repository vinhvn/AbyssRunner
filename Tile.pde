class Tile { // tiles + traps
  PVector p; //position
  int type; //type of tile

  Tile(int t, float x, float y) {
    type = t;
    p = new PVector(x, y);
  }

  void display() {
    tint(255); //no transparency pls
    switch(type) { //switch to display correct type of tile
    case 0: //empty space
      fill(30);
      rect(p.x*width/col, p.y*height/row, width/col, height/row);
      break;
    case 1: //stone tile
      image(stone, p.x*width/col, p.y*height/row, width/col, height/row);
      break;
    case 2: //ice tile
      image(ice, p.x*width/col, p.y*height/row, width/col, height/row);
      break;
    case 3: //fire tile
      image(fire, p.x*width/col, p.y*height/row, width/col, height/row);
      break;
    case 4: //web tile
      image(web, p.x*width/col, p.y*height/row, width/col, height/row);
      break;
    case 5: //coin tile
      image(coin, p.x*width/col, p.y*height/row, width/col, height/row);
      break;
    case 6: //furnace tile
      image(furnace, p.x*width/col, p.y*height/row, width/col, height/row);
      break;
    }
  }
}