void mainMenu() {
  // displays the menu
  particleBackground();
  
  //displays buttons & their interactivity
  start.display();
  start.interaction();
  options.display();
  options.interaction();
  help.display();
  help.interaction();
  exit.display();
  exit.interaction();
  
  //nice red backing
  fill(#FF0000, 80);
  rect(0, height/13*2, width, height/5);
  tint(255);
  image(title, 0, height/6, width, height/6); //le title

  fill(255, 180); //display who made this :D
  textSize(18);
  text("Created by Nick El-Khoury & Vinh Nguyen 2018", width/2, height/16*15);
}