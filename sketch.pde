Player player;
boolean doing;
Button restartButton;
Cannon[] s = new Cannon[6];
Laser l;

void draw() {
  background(0); // Black background
  
  s[0].doAll();
 // s[1].doAll();
 // s[2].doAll();

  if (!player.isDead) {
    player.doAll();
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