Player player = new Player(width/2, height-100, 8);
boolean doing;
boolean death = false;
Button restartButton;
int time;
Cannon[] s = new Cannon[6];
Laser l;

void draw() {
  background(0); // Black background
  
  s[2].doAll();
  for(int i = 1; i < 3; i++) { 
    // With cycle for(i) it's easier to 
    // control all cannons
    Cannon cannon = s[i];
    if(cannon.isUnderFire) cannon.display();
  }

  if (!death) {
    player.doAll();
  } else {
    restartButton.display("Restart");
    if (restartButton.pressed()) setup();
  }
  time++;
  
  fill(255); // Text color
  text(frameRate, 100, 100);
}

void onBackPressed() {
  setup();
}