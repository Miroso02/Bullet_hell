Player player;
boolean doing;
Button restartButton;
Cannon[] s = new Cannon[2];
Laser l;

void draw() {
  background(0); // Black background
  
  s[0].doAll();  // Fire, control bullets,
  s[1].doAll();  // take damage, display

  if (!player.isDead) {
    player.doAll(); // Move, fire, display
  } else {
    restartButton.display("Restart");
    if (restartButton.pressed()) setup();
  }
  
  fill(255); // White text color
  text(frameRate, 100, 100);
}

void onBackPressed() {
  setup();
}