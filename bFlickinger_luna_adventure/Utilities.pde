/********* MOVEMENT KEYS *********/

// Used to detect when the up, down, left, right, or spacebar keys are pressed/released
boolean [] movementKeys;


// Check to see if one of these keys are pressed
void keyPressed() {
  if (key == ' ') {
    movementKeys[0] = true;
    up = -1;
  }
  if (keyCode == UP) {
    movementKeys[1] = true;
    up = -1;
  }
  if (keyCode == DOWN) {
    movementKeys[2] = true;
    down = 1;
  }
  if (keyCode == LEFT) {
    movementKeys[3] = true;
    left = -1;
    bunny.direction = -1;
  }
  if (keyCode == RIGHT) {
    movementKeys[4] = true;
    right = 1;
    bunny.direction = 1;
  }
}

// Check to see if one of these keys are released
void keyReleased() {
  if (key == ' ') {
    movementKeys[0] = false;
    up = 0;
  }
  if (keyCode == UP) {
    movementKeys[1] = false;
    up = 0;
  }
  if (keyCode == DOWN) {
    movementKeys[2] = false;
    down = 0;
  }
  if (keyCode == LEFT) {
    movementKeys[3] = false;
    left = 0;
  }
  if (keyCode == RIGHT) {
    movementKeys[4] = false;
    right = 0;
  }
}
