Player player;
Button restartButton;
Cannon[] s = new Cannon[3];

void draw() {
  background(0); // Black background
  
<<<<<<< HEAD
 // s[0].doAll();  // Fire, control bullets,
 // s[1].doAll();  // take damage, display
  s[2].doAll();
  
=======
  s[0].update();  // Fire, control bullets,
  s[1].update();  // take damage, display

>>>>>>> 5e041f4c124e9b998cc7b44b71007383d9e21f37
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
