Player player;
Button restartButton;
Cannon[] s = new Cannon[2];
Laser l;

void draw() {
  background(0); // Black background
  
  s[0].update();  // Fire, control bullets,
  s[1].update();  // take damage, display

  if (!player.isDead) {
    player.update(); 
  } else {
    restartButton.display();
    if (restartButton.pressed()) setup();
  }
  
  fill(255); // White text color
  text(frameRate, 100, 100);
}

void onBackPressed() {
  setup();
}
