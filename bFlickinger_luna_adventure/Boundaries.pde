

/********* COLLISION DETECTION *********/

// Checks to make sure the bunny stays on screen
void checkBoundaries() {
  boolean hasCollidedPlatform = false;
  boolean hasCollidedRocket = false;

  // Detects if collision occurs with platform
  for (int i = 0; i < platforms.length; i++) {
    Platforms plat = platforms[i]; 
    if (bunny.position.x + bunny.bunnyWidth > plat.x && bunny.position.x < plat.x + plat.w && bunny.position.y + bunny.bunnyHeight > plat.y && bunny.position.y < plat.y + plat.h) {
      hasCollidedPlatform = true;
      break;
    }
  }

  // Detects if collision occurs with the rocket
  Rocket rock = rocket[0]; 
  if (bunny.position.x + bunny.bunnyWidth > rock.x + 20 && bunny.position.x < rock.x + (rock.w - 40) && bunny.position.y + bunny.bunnyHeight > rock.y + 10 && bunny.position.y < rock.y + rock.h) {
    hasCollidedRocket = true;
  }

  // If collision is detected with the platforms the bunny can jump on them
  if (hasCollidedPlatform == true) {
    if (bunny.velocity.y > 0) {
      bunny.velocity.y = max(-1 * bunny.velocity.y, - bunny.maxJumpHeight);
      bunny.velocity.y = min(-14, bunny.velocity.y);
    } else {
      bunny.velocity.x *= -0.5;
      bunny.velocity.y = 0;
    }
  }

  // If collision is detected with the rocket go to the next level/game screen
  if (hasCollidedRocket == true) {
    delay (500); // 500 = half a second
    gameScreen = gameScreen+1;
    bunny.position.x = 0;
    bunny.position.y = 0;
  }


  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


  // Check to see if bunny will collide with anything before moving
  PVector nextPosition = new PVector(bunny.position.x, bunny.position.y);
  //if (hasCollided == false) {
  nextPosition.add(bunny.velocity);
  //}
  // Check collision with the edge of the screen and don't move if at the edge
  float offset = 0;
  if (nextPosition.x > 0 && nextPosition.x < (bunny.rightEdge))
  {
    bunny.position.x = nextPosition.x;
  } 
  if (nextPosition.x < bunny.leftEdge) //
  {
    bunny.position.x = bunny.leftEdge;
  } 
  if (nextPosition.y > offset && nextPosition.y < (height - offset))
  {
    bunny.position.y = nextPosition.y;
  }

  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //boolean hasCollided = false;

  //for (int i = 0; i < platforms.length; i++) {
  //  Platforms plat = platforms[i];

  //  // Detects if collision occurs with platform
  //  if (bunny.position.x + bunny.bunnyWidth > plat.x && bunny.position.x < plat.x + plat.w && bunny.position.y + bunny.bunnyHeight > plat.y && bunny.position.y < plat.y + plat.h) {

  //    hasCollided = true;
  //    break;

  //    //print ("collide");
  //    //      print ('\n');
  //    //clear();
  //  }
  //}

  //if (hasCollided = true) {
  //  bunny.velocity.x *= -.1;
  //  bunny.velocity.y *= -1;
  //}
}
