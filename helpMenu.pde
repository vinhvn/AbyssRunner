void helpMenu() {
  particleBackground();
  
  //nice red backing
  fill(#FF0000, 80);
  rect(0,height/7,width,height/7*5);
  
  //display buttons and interaction
  back.display();
  back.interaction();
  
  //instructions
  fill(255);
  textSize(24);
  text("Use the arrow keys to control Percival", width/2, height/6);
  text("Stone tiles are safe to walk over", width/5*3, height/12*5 + height/32);
  text("Ice tiles make you slip forward", width/5*3, height/12*6 + height/32);
  text("Fire tiles burn you (death)", width/5*3, height/12*7 + height/32);
  text("Furnace tiles switch to fire tiles", width/5*3, height/12*8 + height/32);
  text("Web tiles trap you for a second", width/5*3, height/12*9 + height/32);
  
  tint(255);
  image(character, width/2 - width/6, height/5, width/3, height/6);
  image(stone, width/12, height/12*5, width/8, height/16);
  image(ice, width/12, height/12*6, width/8, height/16);
  image(fire, width/12, height/12*7, width/8, height/16);
  image(furnace, width/12, height/12*8, width/8, height/16);
  image(web, width/12, height/12*9, width/8, height/16);
}