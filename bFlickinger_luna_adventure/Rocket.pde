/********* ROCKET ARRAY *********/


Rocket [] rocket;

int rocketW = 120;
int rocketH = 150;

void createRocketLevel1() {
  rocket[0] = new Rocket(rocketImage, width-200, 100, rocketW, rocketH, 0, 0, 0);

  rocket[0].display();
}

void createRocketLevel2() {
  rocket[0] = new Rocket(rocketImage, 200, 0, rocketW, rocketH, 0, 0, 0);

  rocket[0].display();
}

void createRocketLevel3() {
  rocket[0] = new Rocket(rocketImage, 680, 50, rocketW, rocketH, 0, 0, 0);

  rocket[0].display();
}
