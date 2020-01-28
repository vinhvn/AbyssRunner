void mainGame() {
  if (!game.gameOver) { //run the game if the player has not died
    
    //game functionality
    game.display();
    game.interaction(knight.getX(), knight.getY());
    game.timer();
    
    //display and move characters
    knight.display();
    ghost.display();
    ghost.move();
    ghost.kill();
    
    //display score
    textSize(32);
    fill(0);
    text("SCORE: " + game.score, width/4+5, height/32+5);
    fill(255);
    text("SCORE: " + game.score, width/4, height/32);
    
    //map reset
    if (int(knight.getY()) == 0) { // give points if the user finishes the map and load a new map
      game.score += 500;
      game.build();
      knight.reset();
      ghost.reset();
    }
    
  } else { //if player has died
  
    fill(#330000,10);
    rect(0,0,width,height); //fade to black
    
    textSize(48);
    //shadow
    fill(0);
    text("GAME OVER!", width/2+5, height/3+5);
    text("Final Score: " + game.score, width/2+5, height/5*2+5);
    fill(255);
    text("GAME OVER!", width/2, height/3);
    text("Final Score: " + game.score, width/2, height/5*2);
    
    //button for them to leave
    back.display();
    back.interaction();
  }
}