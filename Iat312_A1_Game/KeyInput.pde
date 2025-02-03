// Key inputs setup
boolean up, down, left, right, space; // Boolean variables to correspond with player movements

PVector upForce = new PVector(0, -speed);    // Upward movement force
PVector downForce = new PVector(0, speed);   // Downward movement force
PVector leftForce = new PVector(-speed, 0);  // Leftward movement force
PVector rightForce = new PVector(speed, 0);  // Rightward movement force


void keyPressed() { // Handle key press events

   if(keyCode == ENTER && gameState == 0)
      gameState = 1;
    else if (keyCode == ENTER && gameState == -2)
      gameState = -1;
      
  if (key == CODED && (gameState == 0 || gameState == -2)) {
    if (keyCode == DOWN && gameState == 0)
      gameState = -2;
    else if (keyCode == UP && gameState == -2)
      gameState = 0;
  }
  
  if (gameState == 1) {
    if (keyCode == LEFT || key == 'a' || key == 'A') {
      movingPos = 1; // Indicate horizontal movement
      left = true;
    }
    if (keyCode == RIGHT || key == 'd' || key == 'D') {
      movingPos = 1; // Indicate horizontal movement
      right = true;
    }
    if (keyCode == DOWN || key == 's' || key == 's') {
      movingPos = 2; // Indicate downward movement
      down = true;
    }
    if (keyCode == UP || key == 'w' || key == 'W') {
      movingPos = 3; // Indicate upward movement
      up = true;
    }
  }


  if (key == ' ') { // Handle space bar for attacking
    //movingPos = 4;
    //space = true;

    if (gameState == LEVEL1 || gameState == LEVEL2 || gameState == LEVEL3) { 
      if (weaponCount >= 1) { // Player must have at least 1 weapon to attack
        player.attack(); 
      }
    }
  }
}

void keyReleased() { // Handle key release events
  if (gameState == 1) {
    movingPos = 0; // Reset movement position
    if (keyCode == LEFT || key == 'a' || key == 'A') left = false;
    if (keyCode == UP || key == 'w' || key == 'W') up = false;
    if (keyCode == DOWN || key == 's' || key == 's') down = false;
    if (keyCode == RIGHT || key == 'd' || key == 'D') right = false;
  }

  if (key == ' ') {
    space = false;
  }
}

void keyboardMove() { 
  PVector movement = new PVector(0, 0); // Reset movement vector

  // Update movement based on key presses
  if (left) {
    movement.add(leftForce);
  }
  if (right) {
    movement.add(rightForce);
  }
  if (up) {
    movement.add(upForce);
  }
  if (down) {
    movement.add(downForce);
  }

  // Move the player
  if (movement.mag() > 0) { // Only move if there's input
    player.move(movement);

    // Update rotation angle based on movement direction
    player.rotationAngle = atan2(movement.y, movement.x);
  }
}
