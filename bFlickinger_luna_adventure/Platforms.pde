/********* PLATFORM ARRAY *********/

Platforms [] platforms;

int platformW = 200;
int platformH = 40;
int shortPlatformW = 100;

void createPlatformsLevel1() {
  platforms[0] = new Platforms(1, width/2-300, height/2, platformW, platformH, 0, 0, 0);
  platforms[1] = new Platforms(0, width/2, height-100, platformW, platformH, 0, 0, 0);
  platforms[2] = new Platforms(0, width - 300, 300, platformW, platformH, 0, 0, 0);

  platforms[0].display();
  platforms[1].display();
  platforms[2].display();
}

void createPlatformsLevel2() {
  platforms[0] = new Platforms(1, 200, 300, platformW, platformH, 0, 0, 0);
  platforms[1] = new Platforms(0, width/2, height-100, platformW, platformH, 0, 0, 0);
  platforms[2] = new Platforms(0, width-200, height-400, shortPlatformW, platformH, 0, 0, 0);

  platforms[0].display();
  platforms[1].display();
  platforms[2].display();
}

void createPlatformsLevel3() {
  platforms[0] = new Platforms(0, width/2, 350, shortPlatformW, platformH, 0, 0, 0);
  platforms[1] = new Platforms(0, 200, 650, shortPlatformW, platformH, 0, 0, 0);
  platforms[2] = new Platforms(0, width-200, height-400, shortPlatformW, platformH, 0, 0, 0);


  platforms[0].display();
  platforms[1].display();
  platforms[2].display();
}
