Player player = new Player(width/2, height-100, 8);
boolean doing, death = false;
Button restartButton;
int time;
Cannon[] s = new Cannon[6];
Laser l;
void draw() {
  background(0);
  fill(0, 0, 255);
  
  //l.dos();
  for(int i = 0; i < 3; i++) {
    if(i == 2)
    s[i].dos();
  }
  //s[0].xyRandom();
  for(int i = 1; i < 3; i++) {
    Cannon cannon = s[i];
    if(cannon.isUnderFire) cannon.display();
  }

  if (!death) {
    player.display();
    player.move();
  } else {
    restartButton.display("Restart");
    if (restartButton.pressed()) setup();
  }
  time++;
  fill(255);
  text(frameRate, 100, 100);
}

void onBackPressed() {
  setup();
}