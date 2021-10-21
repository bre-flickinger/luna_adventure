/********* SPRITE ANIMATION *********/

// Used to make the animations for the bunny when walking left or right
void spriteAnim() {
  bunny.frameTimer += 0.14; // This is the framerate or speed of animation.
  if (bunny.frameTimer >= 8) // Reset at 8 because there's only 0-7 columns in the spritesheet
  {
    bunny.frameTimer = 0; // Column 0 is the first frame of the walk animation
  }
  bunny.frameColumn = (int)bunny.frameTimer; // Cast the timer to an int so it's an integer between 1 and 8

  if (bunny.velocity.x == 0 && bunny.velocity.y == 0)
  {
    bunny.frameColumn = 0; // Column 0 is the stopped frame of animation so if the bunny is not moving, it should be standing still
  }

  if (bunny.velocity.y != 0 && bunny.velocity.x == 0) // If in the jump button is pressed and the bunny is not moving left/right
  {
    bunny.frameTimer = 3; // ?????
    bunny.frameRow = 1; // Row 1 is the the sequence for jumping
  }

  if (left != 0)
  {
    bunny.frameRow = 0; // Row 0 is the sequence for walking
  }
  if (right != 0)
  {
    bunny.frameRow = 0; // Row 0 is the sequence for walking
  }
}

// Returns a cropped portion from the spritesheet
PImage getSubImage(PImage image, int row, int column, int frameWidth, int frameHeight)
{
  return image.get(column * frameWidth, row * frameHeight, frameWidth, frameHeight);
}
