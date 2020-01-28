void audio() {
  // set the volume for all sounds
  // works in conjuction with the sliders
  startup.setGain(-16);
  menuMusic.setGain(-20 + volMusic);
  gameMusic.setGain(-20 + volMusic);
  click.setGain(-6 + volSFX);
  death.setGain(-12 + volSFX);
  coinGet.setGain(-28 + volSFX);
  webbed.setGain(-10 + volSFX);
  
  if (menuState == 0) { // play startup if user has not clicked to skip
    startup.play();
  } else if (menuState == 1 || menuState == 2 || menuState == 4) { // play music and loop in main menu + options
    startup.pause();
    gameMusic.pause();
    if (!menuMusic.isPlaying()) { // loops music
      menuMusic.pause();
      menuMusic.rewind();
    }
    menuMusic.play();
  } else if (menuState == 3) { // play music and loop in game
    menuMusic.pause();
    if (!gameMusic.isPlaying()) { // loops music
      gameMusic.pause();
      gameMusic.rewind();
    }
    gameMusic.play();
  }
}