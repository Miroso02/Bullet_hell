Player player;
Button restartButton;
Cannon[] s = new Cannon[3];

void draw() {
  background(0); // Black background
  
 // s[0].doAll();  // Fire, control bullets,
 // s[1].doAll();  // take damage, display
  s[2].doAll();
  
  if (!player.isDead) {
    player.doAll(); // Move, fire, display
  } else {
    restartButton.display("Restart");
    if (restartButton.pressed()) setup();
  }
  
  fill(255);
  text(frameRate, 100, 100);
}

void onBackPressed() {
  setup();
}