//Johnny Geng
//1-2
//Jan 2 2023
//Fisica Volleyball

import fisica.*;

color red = color(255, 0, 0);
color blue = color(24, 0, 255);
color yellow = color(255, 247, 0);
color green = color(0, 255, 44);
color orange = color(255, 132, 0);
color purple = color(195, 0, 255);
color grey = color(59, 53, 54);
color black = color(0);
color white = color(255);

boolean wkey, akey, skey, dkey, upkey, downkey, rightkey, leftkey;

float a;

FWorld world;

void setup() {
  size(1000, 800);
  
  makeWorld();
  floor();
  players();
}

void makeWorld() {
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 900);
  world.setEdges();
}

void players() {
  FBox leftPlayer = new FBox(100, 100);
  leftPlayer.setPosition(width/4, 545);
  leftPlayer.setStroke(0);
  leftPlayer.setStrokeWeight(2);
  leftPlayer.setFillColor(red);
  leftPlayer.setDensity(0.2);
  leftPlayer.setFriction(1);
  leftPlayer.setRestitution(0);
  world.add(leftPlayer);
  
  FBox rightPlayer = new FBox(100, 100);
  rightPlayer.setPosition(3*width/4, 545);
  rightPlayer.setStroke(0);
  rightPlayer.setStrokeWeight(2);
  rightPlayer.setFillColor(blue);
  rightPlayer.setDensity(0.2);
  leftPlayer.setFriction(1);
  rightPlayer.setRestitution(0);
  world.add(rightPlayer);
}

void floor() {
  FBox net = new FBox(20, 150);
  net.setPosition(width/2, 525);
  net.setStroke(0);
  net.setStrokeWeight(2);
  net.setFillColor(white);
  net.setFriction(1);
  net.setStatic(true);
  world.add(net);
  
  FBox leftCourt = new FBox(500, 200);
  leftCourt.setPosition(250, 700);
  leftCourt.setStroke(0);
  leftCourt.setStrokeWeight(2);
  leftCourt.setFillColor(red);
  leftCourt.setFriction(1);
  leftCourt.setStatic(true);
  world.add(leftCourt);
  
  FBox rightCourt = new FBox(500, 200);
  rightCourt.setPosition(750, 700);
  rightCourt.setStroke(0);
  rightCourt.setStrokeWeight(2);
  rightCourt.setFillColor(blue);
  rightCourt.setFriction(1);
  rightCourt.setStatic(true);
  world.add(rightCourt);
}

void draw() {
  background(yellow);
  world.step();
  world.draw();
  handlePlayerInput();
}

void keyPressed() {
  if (key == 'w' || key == 'W') wkey = true;
  if (key == 'a' || key == 'A') wkey = true;
  if (key == 's' || key == 'S') wkey = true;
  if (key == 'd' || key == 'D') wkey = true;
  if (keyCode == UP) upkey = true;
  if (keyCode == DOWN) downkey = true;
  if (keyCode == LEFT) leftkey = true;
  if (keyCode == RIGHT) rightkey = true;
}

void keyReleased() {
  if (key == 'w' || key == 'W') wkey = false;
  if (key == 'a' || key == 'A') wkey = false;
  if (key == 's' || key == 'S') wkey = false;
  if (key == 'd' || key == 'D') wkey = false;
  if (keyCode == UP) upkey = false;
  if (keyCode == DOWN) downkey = false;
  if (keyCode == LEFT) leftkey = false;
  if (keyCode == RIGHT) rightkey = false;
}

void handlePlayerInput() {
  float left_vx = leftPlayer.getVelocityX();
  leftPlayer.setVelocity(100, 0);
}
