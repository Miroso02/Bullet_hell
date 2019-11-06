Player player;
Button restartButton;
Cannon[] s = new Cannon[2];

// On this cannon I'll test new patterns
Cannon test;


void draw() {
  background(0); // Black background

  s[0].update();  // Fire, control bullets,
  s[1].update();  // take damage, display
  test.update();

  if (!player.isDead) {
    player.update();
  } else {
    restartButton.display();
    if (restartButton.pressed()) setup();
  }

  fill(255);
  text(frameRate, 100, 100);
}

void onBackPressed() {
  setup();
}
