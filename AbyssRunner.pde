/*

 Abyss Runner
 Nick El-Khoury & Vinh Nguyen
 05/02/2018
 
 */
 
//imports Minim & audio functionality
import ddf.minim.*;
Minim minim;
AudioPlayer startup, menuMusic, gameMusic, click, death, coinGet, webbed;

//declare variables
int menuState, col, row;
PImage logo, title, character, stone, ice, fire, web, coin, furnace, webOverlay;
ArrayList<Particle> particles;
float sliderSFX, sliderMusic, volSFX, volMusic;
boolean randomMode;

//declare objects
Button start, options, exit, back, random, help;
Player knight;
Ghost ghost;
Game game;

void setup() {
  size(490, 980);
  textAlign(CENTER, CENTER);
  background(0);
  
  menuState = 0; //int to determine which menu you are on
  
  //define grid
  col = 7;
  row = 14;
  
  //assign variables values
  particles = new ArrayList();
  sliderSFX = sliderMusic = width/3*2;
  randomMode = false;
  
  //load images
  logo = loadImage("logo.png");
  title = loadImage("title.png");
  character = loadImage("player.png");
  stone = loadImage("stone.png");
  ice = loadImage("ice.jpg");
  fire = loadImage("fire.png");
  web = loadImage("web.png");
  coin = loadImage("coin.png");
  furnace = loadImage("furnace.jpg");
  webOverlay = loadImage("webscreen.jpg");
  
  //define buttons
  start = new Button("START", width/6, height/9*4, width/3*2, height/12, #E32929, #FF4646, #AA2626);
  options = new Button("OPTIONS", width/6, height/9*5, width/3*2, height/12, #E32929, #FF4646, #AA2626);
  exit = new Button("EXIT", width/6, height/9*7, width/3*2, height/12, #E32929, #FF4646, #AA2626);
  back = new Button("BACK", width/3, height/9*8, width/3, height/12, #E32929, #FF4646, #AA2626);
  random = new Button("RANDOM", width/6, height/13*8, width/3*2, height/8, #E32929, #FF4646, #AA2626);
  help = new Button("HELP", width/6, height/9*6, width/3*2, height/12, #E32929, #FF4646, #AA2626);
  
  //define characters
  knight = new Player(3,13);
  ghost = new Ghost();
  
  //load audio
  minim = new Minim(this);
  startup = minim.loadFile("startup.mp3");
  menuMusic = minim.loadFile("menu.mp3");
  gameMusic = minim.loadFile("game.mp3");
  click = minim.loadFile("button.mp3");
  death = minim.loadFile("death.mp3");
  coinGet = minim.loadFile("coin.mp3");
  webbed = minim.loadFile("web.mp3");
}

void draw() { //switch() to change menus
  audio();
  switch(menuState) {
  case 0: //start-up
    startup();
    break;
  case 1: //main menu
    mainMenu();
    break;
  case 2: //settings
    optionsMenu();
    break;
  case 3: //game
    mainGame();
    break;
  case 4: //help
    helpMenu();
  }
}

//very nice function to return if mouse is over button
boolean mouseOver(float tx, float ty, float tb, float th) {
  if (mouseX >= tx && mouseX <= tx + tb && mouseY >= ty && mouseY <= ty + th) {
    return true;
  } else {
    return false;
  }
}