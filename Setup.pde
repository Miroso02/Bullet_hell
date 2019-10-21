void setup() {
  size(displayWidth, displayHeight);
  noSmooth();
  rectMode(CENTER);

  //*******************ИНСТРУКЦИЯ*****************************
  //sn=new Cannon(1: количество пуль, за которые отвечает эта пушка (не знаешь – ставь 500),
  //                2-3: координаты пушки (x,y),
  //                4: задержка между выстрелами,
  //                5: количество пуль, которые выпускаются за один выстрел,
  //                6: HP пушки,
  //                7: случайное перемещение: после скольких выстрелов перемещение; 0,если нет; 
  //                8: функция движения каждой пули(номер текущей пули, координаты точки из пунктов 2-3):
  //  1) float x,y,bulletspeedX,bulletSpeedY – переменные, которые ты ��������������������олжен определить в этом методе
  //  2) x=... ; y=... ; – координаты точки запуска пули 
  //  P.S. Используй xL, yL и bulletNum
  //  3) bulletSpeedX=... ; bulletSpeedY=... ; – скорость по x/y пули(скорость не меняется!!)
  //  P.S. Используй bulletNum; xL, yL и какую-то другую хрень – не рекомендуется, АРТЁМ
  //  4) float[] res={...}; ты должен вернуть минимум 5 значений:
  //  1-4: x,y,bulletSpeedX, bulletSpeedY – см. выше
  //  5: Множитель скорости пули (не знаешь – ставь 4)
  //  Необязательные аргументы:
  //  6: Количество рикошетов пули
  //  7: Диаметр (размер) пули (не знаешь - ставь 10)
  //  8: Ускорение ↓ пули
  //************************************************************
  //
  s[0]=new Cannon(width/2, height/2-200, 100, 1000, 80, 100, 0, true, new FirePattern() {
    public void fire(Bullet bullet, int bulletNum, float cannonX, float cannonY)
    {
      float x = 2000;
      float y = 0;
      float bulletSpeedX = 0;
      float bulletSpeedY = 0;
      
      x = cannonX;
      y = cannonY;
      bulletSpeedX=0.01*(bulletNum%100+15)*cos(1.06*bulletNum);
      bulletSpeedY=0.01*(bulletNum%100+15)*sin(1.06*bulletNum);
      
      bullet.x = x;
      bullet.y = y;
      bullet.speedX = bulletSpeedX;
      bullet.speedY = bulletSpeedY;
      bullet.speed = 14;
      bullet.numOfRicochets = 1;
    }
    
    public void setBulletColor(Bullet bullet, int bulletNum, int bulletCount) {
      color col = color(255, 0, 0);
      super.staticBulletColor(bullet, col);
    }
  }
  );
  s[1]=new Cannon(width/2, height/2-200, 100, 1000, 80, 100, 0, true, new FirePattern() {
    public void fire(Bullet bullet, int bulletNum, float cannonX, float cannonY)
    {
      float x = 2000;
      float y = 0;
      float bulletSpeedX = 0;
      float bulletSpeedY = 0;
      
      x = cannonX;
      y = cannonY;
      bulletSpeedX=0.01*(bulletNum%100+15)*cos(1.06*bulletNum);
      bulletSpeedY=-0.01*(bulletNum%100+15)*sin(1.06*bulletNum);
      
      bullet.x = x;
      bullet.y = y;
      bullet.speedX = bulletSpeedX;
      bullet.speedY = bulletSpeedY;
      bullet.speed = 14;
      bullet.numOfRicochets = 1;
    }
    
    public void setBulletColor(Bullet bullet, int bulletNum, int bulletCount) {
      color col = color(0, 255, 0);
      super.staticBulletColor(bullet, col);
    }
  }
  );
  //              x        y    hp   bull 
  s[2]=new Cannon(width/2, 100, 100, 600, 3, 4, 0, true, new FirePattern() {
    public void fire(Bullet bullet, int bulletNum, float cannonX, float cannonY)
    {
      float x = 2000;
      float y = 0;
      float bulletSpeedX = 0;
      float bulletSpeedY = 0;
      
      float m=-120+80*(bulletNum%4);
      x = cannonX - m;
      y = cannonY;
      /*float tx=player.x - x, ty=player.y - y;
      float sqt = sqrt(sq(tx) + sq(ty)) / 1.2;
      bulletSpeedX = tx / sqt;
      bulletSpeedY = ty / sqt;*/
      float k = 1 + 0.3*sin(PI*(float)bulletNum/200);
      float k2 = 25*sin(HALF_PI*(float)bulletNum/2);
      bulletSpeedY = k * abs(0.8*cos(PI*bulletNum/(100)))+0.2;
      bulletSpeedX = k * sin(PI*bulletNum/(100));
      
      bullet.x = x;
      bullet.y = y;
      bullet.speedX = bulletSpeedX;
      bullet.speedY = bulletSpeedY;
      bullet.speed = 5;
      bullet.numOfRicochets = 1;
      bullet.w = 15;
    }
    
    public void setBulletColor(Bullet bullet, int bulletNum, int bulletCount) {
      super.changeBulletColorHSB(bullet, bulletNum, bulletCount);
    }
  }
  );
  
  restartButton = new Button(width / 2 - 150, height / 2 + 50, 400, 100);
  player = new Player(width / 2, height - 100, 8);
}