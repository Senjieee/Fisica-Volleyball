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

int rightScore, leftScore;

FWorld world;
FBox leftPlayer, rightPlayer, net, leftCourt, rightCourt;
FCircle ball;

void setup() {
  size(1000, 800);
  
  makeWorld();
  ground();
  players();
  ball();
  
  leftScore = 0;
  rightScore = 0;
}

void makeWorld() {
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 900);
  world.setEdges();
}

void players() {
  leftPlayer = new FBox(100, 100);
  leftPlayer.setPosition(width/4, 545);
  leftPlayer.setStroke(0);
  leftPlayer.setStrokeWeight(2);
  leftPlayer.setFillColor(red);
  leftPlayer.setDensity(0.2);
  leftPlayer.setFriction(1);
  leftPlayer.setRestitution(0);
  world.add(leftPlayer);
  
  rightPlayer = new FBox(100, 100);
  rightPlayer.setPosition(3*width/4, 545);
  rightPlayer.setStroke(0);
  rightPlayer.setStrokeWeight(2);
  rightPlayer.setFillColor(blue);
  rightPlayer.setDensity(0.2);
  leftPlayer.setFriction(1);
  rightPlayer.setRestitution(0);
  world.add(rightPlayer);
}

void ball() {
  ball = new FCircle(100);
  ball.setPosition(width/4, 300);
  ball.setStroke(0);
  ball.setStrokeWeight(2);
  ball.setFillColor(white);
  ball.setFriction(1);
  ball.setDensity(0.1);
  ball.setRestitution(1.3);
  world.add(ball);
}

void ground() {
  net = new FBox(20, 150);
  net.setPosition(width/2, 525);
  net.setStroke(0);
  net.setStrokeWeight(2);
  net.setFillColor(white);
  net.setFriction(1);
  net.setStatic(true);
  world.add(net);
  
  leftCourt = new FBox(500, 200);
  leftCourt.setPosition(250, 700);
  leftCourt.setStroke(0);
  leftCourt.setStrokeWeight(2);
  leftCourt.setFillColor(red);
  leftCourt.setFriction(1);
  leftCourt.setStatic(true);
  world.add(leftCourt);
  
  rightCourt = new FBox(500, 200);
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
  
  if (leftScore >= 3) {
    gameOver();
    fill(red);
    text("RED WINS", 300, 300);
  } else if (rightScore >= 3) {
    gameOver();
    fill(blue);
    text("BLUE WINS", 300, 300);
  }
  
  if (hitGround(leftCourt)) {
    rightScore++;
    resetLeft();
  }
  
  if (hitGround(rightCourt)) {
    leftScore++;
    resetRight();
  }
  
  fill(black);
  textSize(80);
  text(leftScore, width/4, 100);
  text(rightScore, 3*width/4, 100);
}

void gameOver() {
  ball.setStatic(true);
  rightPlayer.setStatic(true);
  leftPlayer.setStatic(true);
}

void resetLeft() {
  ball.setPosition(width/4, 300);
  ball.setVelocity(0, 0);
  rightPlayer.setVelocity(0, 0);
  leftPlayer.setVelocity(0, 0);
  rightPlayer.setPosition(3*width/4, 545);
  leftPlayer.setPosition(width/4, 545);
}

void resetRight() {
  ball.setPosition(3*width/4, 300);
  ball.setVelocity(0, 0);
  rightPlayer.setVelocity(0, 0);
  leftPlayer.setVelocity(0, 0);
  rightPlayer.setPosition(3*width/4, 545);
  leftPlayer.setPosition(width/4, 545);
}

void reset() {
  rightPlayer.setPosition(3*width/4, 545);
  leftPlayer.setPosition(width/4, 545);
  ball.setPosition(width/4, 300);
  ball.setVelocity(0, 0);
  rightPlayer.setVelocity(0, 0);
  leftPlayer.setVelocity(0, 0);
  leftScore = 0;
  rightScore = 0;
  ball.setStatic(false);
  rightPlayer.setStatic(false);
  leftPlayer.setStatic(false);
}

void keyPressed() {
  if (key == 'w' || key == 'W') wkey = true;
  if (key == 'a' || key == 'A') akey = true;
  if (key == 's' || key == 'S') skey = true;
  if (key == 'd' || key == 'D') dkey = true;
  if (keyCode == UP) upkey = true;
  if (keyCode == DOWN) downkey = true;
  if (keyCode == LEFT) leftkey = true;
  if (keyCode == RIGHT) rightkey = true;
}

void mouseClicked() {
  if (rightScore >= 3 || leftScore >= 3) {
    reset();
  }
}

void keyReleased() {
  if (key == 'w' || key == 'W') wkey = false;
  if (key == 'a' || key == 'A') akey = false;
  if (key == 's' || key == 'S') skey = false;
  if (key == 'd' || key == 'D') dkey = false;
  if (keyCode == UP) upkey = false;
  if (keyCode == DOWN) downkey = false;
  if (keyCode == LEFT) leftkey = false;
  if (keyCode == RIGHT) rightkey = false;
}

void handlePlayerInput() {
  float left_vx = leftPlayer.getVelocityX();
  float left_vy = leftPlayer.getVelocityY();
  
  float right_vx = rightPlayer.getVelocityX();
  float right_vy = rightPlayer.getVelocityY();
  
  if (onRedGround(leftCourt)) {
    if (wkey) leftPlayer.setVelocity(left_vx, -300);
  }
  if (akey) leftPlayer.setVelocity(-200, left_vy);
  if (dkey) leftPlayer.setVelocity(200, left_vy);
  
  if (onBlueGround(rightCourt)) {
    if (upkey) rightPlayer.setVelocity(right_vx, -300);
  }
  if (leftkey) rightPlayer.setVelocity(-200, right_vy);
  if (rightkey) rightPlayer.setVelocity(200, right_vy);
}

boolean hitGround(FBox ground) {
  ArrayList<FContact> contactList = ball.getContacts();
  int i = 0;
  while (i < contactList.size()) {
    FContact myContact = contactList.get(i);
    if (myContact.contains(ground)) {
      return true;
    }
    i++;
  }
  return false;
}

boolean onBlueGround(FBox ground) {
  ArrayList<FContact> contactList = rightPlayer.getContacts();
  int i = 0;
  while (i < contactList.size()) {
    FContact myContact = contactList.get(i);
    if (myContact.contains(ground)) {
      return true;
    }
    i++;
  }
  return false;
}

boolean onRedGround(FBox ground) {
  ArrayList<FContact> contactList = leftPlayer.getContacts();
  int i = 0;
  while (i < contactList.size()) {
    FContact myContact = contactList.get(i);
    if (myContact.contains(ground)) {
      return true;
    }
    i++;
  }
  return false;
}
