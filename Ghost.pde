/*
Ghost object by Vinh
*/
class Ghost {
  PVector p; //position
  
  Ghost() {
    p = new PVector(width/2,height*2); //starts off screen
  }
  
  void display() {
    fill(0,200); //shadow body
    ellipse(p.x,p.y,width*2,height);
    fill(#FF0000); //the beady eyes
    ellipse(p.x-width/6,p.y-height/5*2, width/8, height/24);
    ellipse(p.x+width/6,p.y-height/5*2, width/8, height/24);
  }
  
  void move() {
    p.y--; //moves up
  }
  
  void kill() {
    if (dist(0,p.y-height/2,0,knight.getY()*(height/row)) <= 0) { //if knight & shadow are on same tile
      game.gameOver = true; //despair :C
    }
  }
  
  void reset() { //sets the position back to original
    p.set(width/2,height*2);
  }
}