
/******************************************************************************************************************************************************************************************/
/********* DESCRIPTION *********/
/**
 * A platformer game. Use the arrow keys to move
 * and the spacebar to jump. 
 * Reach the rocket to move on to the next level.
 * There are three levels. Complete all three to win. 
 */

/********* RESOURCE CITATIONS *********/
/**
 *"Ultimate Guide to the Processing Language Part 2: Building a Simple Game" by Oguz Gelal
 * https://www.toptal.com/game/ultimate-guide-to-processing-simple-game
 *
 * "Jumping" by Devon Scott-Tunkin: 
 * https://openprocessing.org/sketch/92234/
 *
 * "Knight" by Devon Scott-Tunkin: 
 * https://openprocessing.org/sketch/92231
 *
 * "Frozen Rescue- Game Design in Processing" by Nina Lyow:
 * https://medium.com/@ninalyow/frozen-rescue-game-design-in-processing-70dd1be83cc1
 *
 * "UP, DOWN, LEFT, RIGHT movement" Procession Forum Post
 * https://forum.processing.org/one/topic/up-down-left-right-movement.html
 *
 * "Programming platform game in Processing" by John McCaffrey
 * https://www.youtube.com/watch?v=bOUGHpxqyRA
 *
 * "Let's make a Mario Game"
 * http://processingjs.nihongoresources.com/test/PjsGameEngine/docs/tutorial/mario.html
 */
/******************************************************************************************************************************************************************************************/

/********* GLOBALS *********/
PImage startImg, loseImg, endImg, level1Img, level2Img, level3Img, rocketImage; // Images for the screens
Bunny bunny; 
int gameScreen = 0;
float left, right, up, down, space; // To help determine which direction is the bunny moving
float gravity = 0.5;
float friction = 0.96;
float ground;// Y coordinates of the starting position (the ground)
int score; // Score keeps track of how many stars have been collected for fuel (for statement with this)???????????????????????????????????????????????

/******************************************************************************************************************************************************************************************/

/********* SET UP *********/
void setup() {
  // General
  size(800, 800); // Size is 800x800
  movementKeys = new boolean[5]; // 5 keys used to move the bunny

  // Platforms
  platforms = new Platforms[3]; // An array to create platforms

  // Rocket
  rocket = new Rocket[1]; // An array to create platforms
  rocketImage = loadImage("rocket.png"); // This is the rocket ship that will act as the endpoint for the level

  // Bunny
  bunny = new Bunny();
  bunny.image = loadImage("spritesheet_321x400.png"); // This is a 2 row, 8 column sprite sheet for the movement animation for the bunny (each cell is 321x400)
  ground = height;
  bunny.position = new PVector(0, (ground - bunny.bunnyHeight));
  bunny.direction = 1;
  bunny.velocity = new PVector(0, 0);
  bunny.jumpSpeed = 8;
  bunny.maxJumpHeight = 10;
  bunny.walkSpeed = 4;
  bunny.frameRow = 0; // Determines which row from the sprite map to use
  bunny.frameColumn = 0; // Determines which column from the sprite map to use
  bunny.frameTimer = 0; // Determines which column to use to animate

  // Backgrounds
  startImg = loadImage("rocket_start_screen_background.png");
  level1Img = loadImage("level1_background.png");
  level2Img = loadImage("level2_background.png");
  level3Img = loadImage("level3_background.png");
  endImg = loadImage("moon_end_screen_background.png");
  //loseImg = loadImage("moon_end_screen_background.png");

  noCursor();
}

/******************************************************************************************************************************************************************************************/

/********* DRAW *********/
void draw() {
  displayGameScreens();
}

/******************************************************************************************************************************************************************************************/

/********* FUNCTIONS *********/

// Switches the screen to show the different levels
void displayGameScreens() {
  // Display the contents of the current screen
  if (gameScreen == 0) {
    initScreen();
  } else if (gameScreen == 1) {
    level1Screen();
  } else if (gameScreen == 2) {
    level2Screen();
  } else if (gameScreen == 3) {
    level3Screen();
  } else if (gameScreen == 4) {
    gameCompleteScreen();
  } else if (gameScreen == 5) {
    gameOverScreen();
  }
}

// Keeps track of the score (based on the number of stars collected)
void instructions() {
  textSize(30);
  fill(#8ad4e4); // blue
  text("Reach the rocket to advance to the next level", 10, 30);
}

/********* SCREEN CONTENTS *********/

// Code for the initial screen
void initScreen() {
  background(startImg);
  textAlign(LEFT);
  textSize(32);
  String intro = "Luna wants to explore, will you help her? \n \nUse the arrow keys to move and the spacebar to jump.";
  text(intro, 30, 50, height/2, width);
  textSize(60);
  text("Click to start", height/2, width - 50);
}

// Code for the game screen for level 1
void level1Screen() {
  background(level1Img); // Mountains
  instructions();
  createPlatformsLevel1();
  createRocketLevel1();
  bunny.updateBunny(); //Draws the bunny playable character
}

// Code for the game screen for level 2
void level2Screen() {
  background(level2Img); // Water/grass
  createPlatformsLevel2();
  createRocketLevel2();
  bunny.updateBunny(); //Draws the bunny playable character
}

// Code for the game screen for level 3
void level3Screen() {
  background(level3Img); // Clouds
  createPlatformsLevel3();
  createRocketLevel3();
  bunny.updateBunny(); //Draws the bunny playable character
}

// Code for the game over screen
void gameOverScreen() {
  background(0);
  textAlign(CENTER);
  fill(#BF0000);
  textSize(60);
  String gameOver= "Game Over \n \nLuna did not get to explore enough. Try again.";
  text(gameOver, 0, height/4, height, width);
  textSize(30);
  text("Click to Restart", height/2, width - 50);
}

// Code for winning the game
void gameCompleteScreen() {
  background(endImg);
  textAlign(CENTER);
  fill(0);
  textSize(60);
  String gameFinish= "Luna had a lot of fun exploring! Thanks for helping her!";
  text(gameFinish, width/6 + 25, height/3, 500, 500);
}

/******************************************************************************************************************************************************************************************/

/********* INPUTS *********/
public void mouseClicked() {
  // If we are on the initial screen when clicked, click to start the game
  if (gameScreen==0) {
    startGame();
  }
}

void restart() {
  startGame();
}

// This method sets the necessary variables to start the game  
void startGame() {
  gameScreen=1;
}

/******************************************************************************************************************************************************************************************/

/********* CLASSES *********/

// Code for the class "Bunny" (the playable character)
class Bunny {
  PImage  image; 
  PVector position, velocity;
  int frameRow, frameColumn;
  float frameTimer;
  float direction, speed, jumpSpeed, walkSpeed, maxJumpHeight;
  float leftEdge, rightEdge;
  int bunnyCellWidth = 321; // This is the width of each cell in the sprite sheet
  int bunnyCellHeight = 400; // This is the height of each cell in the sprite sheet
  float bunnyHeight = int(bunnyCellHeight * .25); // This scales the image height
  float bunnyWidth = int(bunnyCellWidth * .25); // This scales the image width

  void updateBunny() {
    // To find where the left side of the image should stop
    leftEdge = bunnyWidth/5;

    // To find where the right side of the image should stop
    rightEdge = width - (bunnyWidth); 

    // Only apply gravity if above ground (since y positive is down we use < ground)
    if (position.y + bunnyHeight < ground)
    {
      velocity.y += gravity;
    } else
    {
      velocity.y = 0;
    }

    // If on the ground and "jump" key is pressed -> set the upward velocity to the jump speed
    if (position.y + bunnyHeight >= ground && up != 0)
    {
      velocity.y = -jumpSpeed;
    }

    // Bunny walks left and right
    velocity.x = walkSpeed * (left + right);

    checkBoundaries();

    pushMatrix();

    // Helps change the direction the sprite is facing when walking
    scale(direction, 1);


    // This allows the bunny to use the animations for walking and jumping
    spriteAnim();

    imageMode(CORNER);
    PImage frameImage = getSubImage(image, frameRow, frameColumn, bunnyCellWidth, bunnyCellHeight); // This is the size of each cell in the sprite sheet
    if (direction == -1) {
      image(frameImage, -(position.x + bunnyWidth), position.y, bunnyWidth, bunnyHeight); // Draw this frame instead of the entire sprite sheet
    } else {
      image(frameImage, position.x, position.y, bunnyWidth, bunnyHeight); // Draw this frame instead of the entire sprite sheet
    }

    popMatrix();

    //  // Bounding box for bunny
    //  stroke(255, 0, 0);
    //  noFill();
    //  rect(position.x, position.y, bunnyWidth, bunnyHeight);
  }

  void groundCheck() {
    if (position.y > ground) {
      velocity.y=0;
    }
  }
}

// Code for the class "Rocket" (the bunny will reach the rocket to advance to the next level)
class Rocket {
  float x, y, w, h;
  int r, g, b;
  PImage temp;
  float hitX, hitY, hitW, hitH;


  Rocket(PImage _temp, float _x, float _y, float _w, float _h, int _r, int _g, int _b) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    r = _r; 
    g = _g;
    b = _b;
    temp = _temp;
  }

  // Creates the rocket image
  void display() {
    hitX = x+30;
    hitY = y;
    hitW = w/2;
    hitH = h;

    pushMatrix();
    image(rocketImage, x, y, w, h);
    popMatrix();

    // Hit box for rocket
    noStroke();    
    noFill();
    rect(hitX, hitY, hitW, hitH);
  }
}



// Code for the class "Platforms" (the bunny will jump on platforms within the level)
class Platforms {

  float x, y, w, h;
  int r, g, b, temp;


  Platforms(int _temp, float _x, float _y, float _w, float _h, int _r, int _g, int _b) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    r = _r; 
    g = _g;
    b = _b;
    temp = _temp;
  }

  // Creates one rounded rectangle for a platform
  void display() {
    pushMatrix();
    fill(#8ad4e4); // Blue
    stroke(#ff8d2e); // Orange
    strokeWeight(10);  // Thick border
    rect(x, y, w, h, 20);
    popMatrix();

    //// The bounding box for the platforms
    //stroke(#0000ff); // Blue
    //strokeWeight(0.5);  // Thin border
    //noFill();
    //rect(x, y, w, h);
  }
}
