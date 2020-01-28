int timer = 0;
void startup() { // displays our opening screen 
  timer++;
  if (timer > 0 && timer < 120) { // if statement controls timing of assets appearing
    fill(255, 15);
    rect(0, 0, width, height); //white fade
  } else if (timer > 120 && timer < 300) {
    tint(255, timer/12);
    image(logo, width/8, height/3, width/5*4, height/3); //tobey maguire
    fill(0, timer/12);
    textSize(32);
    text("created by\nNick & Vinh", width/2, height/4); //shoddy text
  } else if (timer > 300 && timer < 420) {
    fill(0, 5);
    rect(0, 0, width, height); //black fade
  } else if (timer > 420) {
    menuState= 1; //next menu
  }

  if (mousePressed) { // skips the opening screen if user clicks
    menuState= 1;
    mousePressed = false;
  }
}