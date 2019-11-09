Player player;
Button restartButton;
ArrayList<Cannon> cannons;

// On this cannon I'll test new patterns
Cannon test;


void draw() {
  background(0); // Black background

  // Fire, move, display, control bullets, take damage
  cannons.get(0).update();
  cannons.get(1).update();
  test.update();

  player.update();
  if (player.isDead) {
    restartButton.display();
    if (restartButton.pressed()) setup();
  }

  fill(255);
  text(frameRate, 100, 100);
}

void onBackPressed() {
  setup();  // Restart the game
}

//------------------------------------------------------------------------------

void rect(PVector position, int size) {
  rect(position.x, position.y, size, size);
}

void ellipse(PVector position, int size) {
  ellipse(position.x, position.y, size, size);
}
