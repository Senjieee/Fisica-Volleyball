//Johnny Geng
//1-2
//Jan 2 2023
//Fisica Volleyball

import fisica.*;

color blue   = color(29, 178, 242);
color brown  = color(166, 120, 24);
color green  = color(74, 163, 57);
color red    = color(224, 80, 61);
color yellow = color(242, 215, 16);

FWorld world;

void setup() {
  fullScreen();
  
  makeWorld();
}

void makeWorld() {
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 900);
}

void draw() {
  background(blue);
  world.step();
  world.draw();
}
