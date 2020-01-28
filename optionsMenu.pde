void optionsMenu() {
  particleBackground(); //pretty particles
  
  //nice red backing
  fill(#FF0000, 80);
  rect(0,height/7,width,height/7*5);
  
  //display buttons and interaction
  back.display();
  back.interaction();
  random.display();
  random.interaction();
  
  //slider bar
  fill(0,150);
  rect(width/10,height/32*8,width/10*8,height/10);
  rect(width/10,height/32*15,width/10*8,height/10);
  
  //option menu sliders
  if (mouseOver(width/10, height/32*8, width/10*9, height/10) && mousePressed) {
    sliderSFX = constrain(mouseX, width/10, width/10*9);
  } else if (mouseOver(width/10, height/32*15, width/10*9, height/10) && mousePressed) {
    sliderMusic = constrain(mouseX, width/10, width/10*9);
  }
  
  // sound variables
  volSFX = map(sliderSFX,width/10,width/10*9,-38,24);
  volMusic = map(sliderMusic,width/10,width/10*9,-38,24);
  
  // slider buttons
  fill(200);
  rect(sliderSFX, height/32*8, width/20, height/10);
  rect(sliderMusic, height/32*15, width/20, height/10);
  
  // text for the options menu
  textSize(36);
  fill(0);
  text("Sound Effects", width/2+5, height/5+5); //shadow
  fill(255);
  text("Sound Effects", width/2, height/5);
  fill(0);
  text("Music", width/2+5, height/5*2+5); //shadow
  fill(255);
  text("Music", width/2, height/5*2);
  fill(0);
  text("Random Mode:       ", width/2+5, height/5*4+5); //shadow, etc.
  fill(255);
  text("Random Mode:       ", width/2, height/5*4);
  
  // show that random mode is on or off
  if (!randomMode) {
    fill(0);
    text("OFF", width/9*7+5, height/5*4+5);
    fill(#FF0000);
    text("OFF", width/9*7, height/5*4);
  } else {
    fill(0);
    text("ON", width/9*7+5, height/5*4+5);
    fill(#00FF00);
    text("ON", width/9*7, height/5*4);
  }
}