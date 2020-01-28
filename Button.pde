/*
Button Object by Vinh
*/
class Button {

  PVector p; //position
  float b, h; //base, height
  color idle, hover, clicked;
  String title;

  Button(String t, float tx, float ty, float tb, float th, color one, color two, color three) {
    title = t;
    p = new PVector(tx, ty);
    b = tb;
    h = th;
    idle = one;
    hover = two;
    clicked = three;
  }

  void display() {
    //button drop shadow
    fill(0, 200);
    rect(p.x+5, p.y+5, b, h);

    //fill according to mouse
    fill(idle);
    if (mouseOver(p.x, p.y, b, h)) {
      fill(hover);
      if (mousePressed) {
        fill(clicked);
      }
    }
    //draw button
    rect(p.x, p.y, b, h);

    //text drop shadow
    textSize(32);
    fill(0, 200);
    text(title, p.x+b/2+5, p.y+h/2+5);

    //draw text
    fill(255);
    text(title, p.x+b/2, p.y+h/2);
  }

  void interaction() {
    //my implementation is kind of crap but it works
    if (mouseOver(p.x, p.y, b, h) && mousePressed) { //if mouse is over & mouse is pressed
      click.pause();
      click.rewind();
      click.play(); //play click noise
      if (title == "START") { //start button functionality
        game = new Game(); //creates new game
        game.build(); //builds the map
        knight.reset(); //reset the characters
        ghost.reset();
        menuState = 3; //change to game screen
      } else if (title == "OPTIONS") { //options menu
        menuState = 2;
      } else if (title == "HELP") { //close game
        menuState = 4;
      } else if (title == "EXIT") { //close game
        exit();
      } else if (title == "BACK") { //back to main menu
        menuState = 1;
      } else if (title == "RANDOM") { //toggle for randomMode
        if (!randomMode) {
          randomMode = true;
        } else {
          randomMode = false;
        }
      }
      mousePressed = false;
    }
  }
}