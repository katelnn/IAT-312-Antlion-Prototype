//Boss sub-subclass
class Boss extends Enemy {
  //Enemy subclass  
  boolean movingRight = true; //flag to track movement direction
  float moveSpeed = 8; //enemy's speed
  float startY; //initial y position
  float range = 1000; //range of enemy's movement
  boolean shouldMove = true; //boolean to see if enemy should move or not

  PVector diff, charDiff; //to calculate collision between characters
  
  ArrayList<Projectile> bullets; 
  int bulletTime = 0; //to control time interval between each bullet fired
  
  PImage[] moving = new PImage[2]; 
  
  float fovRadius = 250; // Radius of the FOV
  float fovAngle = radians(90); // Angle of the FOV (90 degrees)
  boolean playerInSight = false; // Whether the player is in the FOV
  boolean detectedPlayer = false;
  int playerInSightCount = 0;
  int treeInSightCount = 0;
  float heat = 0;
  int heatCooldown = 180;
  int gameEndCooldown = 120;

  
  Boss(PVector pos, float r) { 
    super(pos, r);
    range = r;
    vel = new PVector(0, 0);
    dim = new PVector(100, 100);
    startY = pos.y;
 
    isAlive = true;
    maxHealth = 5;
    currentHealth = maxHealth;
    
    bullets = new ArrayList<Projectile>();
    
    //for (int i = 0; i < moving.length; i++) { //loading the images of the enemy
    //  moving[i] = loadImage("data/characters/enemy_" + i + ".png");
    //}
    moving[0] = loadImage("data/characters/antLionLeft.png");
    moving[1] = loadImage("data/characters/antLionRight.png");  

    activeFrames = moving;
      
  }
   void update() {
    super.update();
    drawMe();
    collision(player);
    attackTime();
    checkProjectiles();
    moveBackAndForth();
    findTreeTiles(map1);
    drawTreeTiles();
    drawFOV();
    checkFOV();
    checkCollision(player);
    
    //if(heat >= 100) lose = true; 
  }
  

  void move() { //animating the enemy
    if (frameCount % 6 == 0 ) { //check if 6 frames passed since last animation
      currFrames++;
      
      if (currFrames == moving.length) { //if animation reach the end of frame, reset frame
        currFrames = 0;
      }
    }
  }
  
 
  void dead() { //if enemy is dead, remove enemies and their bullets
    if(currentHealth == 0) {
      isAlive = false;
      for (int i = 0; i < bullets.size(); i++) bullets.remove(i); 
      enemies.remove(this);
    }
  }
  
  void checkCollision(Character c) { //check if player can go through enemies
    diff = PVector.sub(c.pos, pos);
    charDiff = new PVector(abs(diff.x), abs(diff.y));
    //print("collide\n");
    
    if (charDiff.x < c.dim.x/2 + dim.x/2 && charDiff.y < c.dim.y/2 + dim.y/2 && weaponCount == 0) {
        heat = 100;
    }
  }
  
   void drawMe() {
    pushMatrix();
    translate(-player.pos.x + width / 2 + pos.x, 
              -player.pos.y + height / 2 + pos.y);

    translate(50, -50);

    // Check movement direction (up or down)
    if (vel.y < 0) { 
        // Moving up: flip vertically
        scale(1, -1); // Flip vertically
        translate(0, -dim.y); // Adjust position for vertical flip
    } else if (vel.y > 0) { 
        // Moving down: no flip
        scale(1, 1); // Normal orientation
    }

    // Draw the image
    rotate(-3.2);
    image(activeFrames[currFrames], 0, -dim.y / 2, dim.x, dim.y); // Draw the boss
    rotate(3.2);
        
    popMatrix();

    move(); // Update animation frames
}
  
 
  void attack() {
    //bullets.add(new Projectile(new PVector(pos.x, pos.y), new PVector(8, 8), 
    //            bulletColor, atan2(player.pos.y - pos.y, player.pos.x - pos.x))); //angle set to target player
    bulletTime = (int) random(30, 60); 
  }
  
  void attackTime() {
    if (bulletTime == 0 && isAlive) attack(); //time interval for bullets fire
    if (bulletTime > 0) bulletTime--; 
  }

  void checkProjectiles() {
    for (int i = 0; i < bullets.size(); i++) {
      Projectile bb = bullets.get(i);
      bb.update();
      if(bb.hit(player)) {
        if (player.currentHealth <= 5 && weaponCount > 0) weaponCount -= 1;
           player.currentHealth -= 1; 
           bullets.remove(i);
      }
    }
  }
  
  void moveBackAndForth() { 
    if (shouldMove) {
        if (movingRight) {
            vel.y = moveSpeed;
            movingRight = true; // Facing down
        } else {
            vel.y = -moveSpeed;
            movingRight = false; // Facing up
        }

        // Change direction at movement boundaries
        if (pos.y > startY + range) { 
            movingRight = false;
        } else if (pos.y < startY) {
            movingRight = true;
        }
    }
}
  
  // Draw the Field of View (FOV)
void drawFOV() {
    pushMatrix();
    translate(-player.pos.x + width / 2 + pos.x, 
              -player.pos.y + height / 2 + pos.y);
    fill(203, 134, 107, 150); // Yellow transparent FOV
    strokeWeight(1);
    
    beginShape();
    vertex(0, 0); // Start from boss position

    if (movingRight) {
        // FOV Facing Down
        vertex(-fovRadius * tan(fovAngle / 2), fovRadius); // Bottom left
        vertex(fovRadius * tan(fovAngle / 2), fovRadius);  // Bottom right
    } else {
        // FOV Facing Up
        vertex(-fovRadius * tan(fovAngle / 2), -fovRadius); // Top left
        vertex(fovRadius * tan(fovAngle / 2), -fovRadius);  // Top right
    }

    endShape(CLOSE);
    popMatrix();
}

void checkFOV() {
    PVector toPlayer = PVector.sub(player.pos, pos); // Vector from Boss to player
    float distanceToPlayer = toPlayer.mag(); // Distance between Boss and player

    // Ensure player is in the correct direction of the Boss' vision
    if (distanceToPlayer <= fovRadius && ((movingRight && player.pos.y > pos.y) || (!movingRight && player.pos.y < pos.y))) {
        float angleToPlayer = atan2(toPlayer.y, toPlayer.x);
        float referenceAngle = movingRight ? HALF_PI : -HALF_PI; // Facing down = 90 degrees, up = -90 degrees
        float relativeAngle = normalizeAngle(angleToPlayer - referenceAngle);

        // Check if player is within FOV angle range
        if (relativeAngle >= -fovAngle / 2 && relativeAngle <= fovAngle / 2) {
            playerInSight = !isPlayerBlocked(); // Check if the player is visible
            if (playerInSight) {
                playerInSightCount++;
                if (weaponCount > 0)
                {
                  //println("Player Detected BUT GOT SHIELD"); // ✅ Print to console
                }
                else{
                  
                  //println("Player Detected sadly no shield");
                }
            } else {
                //println("Player Hidden"); // ✅ Print to console
            }
        } else {
            playerInSight = false;
            //println("Player Hidden"); // ✅ Print to console
        }
    } else {
        playerInSight = false;
        //println("Player Hidden"); // ✅ Print to console
    }
    if(weaponCount == 0){
      if (lose != true) {
      
      calculateHeat();
      drawHeat();
      }
    }
}

void drawHeat() {
  if (heat > 0) {
  pushMatrix();
  //println(movingRight);
  //println("Current heat: " + heat);
  if (!movingRight) {
    translate(-player.pos.x + width / 2 + pos.x, 
              -player.pos.y + height / 2 + pos.y-30);
  }
  else {
    translate(-player.pos.x + width / 2 + pos.x, 
              -player.pos.y + height / 2 + pos.y-100);
  }
    fill(255);
     rect(-30,-60, 60, 60);
     fill(255, 0,0);
     rect(-30, -60,60, 0.6*heat);
     fill(0);
     if (heat >= 100) {
       text("!", -10,-15);
     }
     else {
       text("?", -10, -15);
     }
  
  popMatrix();
  }
}

void calculateHeat() {
  if (heat >= 100) {
    println(gameEndCooldown);
    if (gameEndCooldown == 120) {
          spotted.play();
    }
    gameEndCooldown--;
    shouldMove = false;
    player.frozen = true;
    if (gameEndCooldown < 0) {
    lose = true;
    spotted.rewind();
    }
  }
    
  if (heat < 101) {
  if (playerInSight) {
     heatCooldown = 180; //reset heat when player is spotted
     PVector toPlayer = PVector.sub(player.pos, pos); // Vector from Boss to player
     float distanceToPlayer = toPlayer.mag(); // Distance between Boss and player
     if (distanceToPlayer < 30) {
       heat += 2;
     }
     else if (distanceToPlayer < 100) {
       heat += 0.8;
     }
     else {
       heat += 0.4;
     }
       //println(distanceToPlayer);
  }
  else {
    if (heatCooldown < 0 && heat <= 0 ) {
      heat = 0;
    }
    else if (heatCooldown < 0) {
      heat--;
    }
    else {
     heatCooldown--;
    }
    
      }
    }
}




// Normalize angle to be between -PI and PI
float normalizeAngle(float angle) {
    while (angle < -PI) angle += TWO_PI;
    while (angle > PI) angle -= TWO_PI;
    return angle;
}

// Check if the player is blocked by an obstacle
boolean isPlayerBlocked() {
    for (PVector tree : treeTiles) {
        float tx = tree.x;
        float ty = tree.y;
        float tw = 105; // Width of the tree tile
        float th = 105; // Height of the tree tile

        // Check if the line of sight intersects the tree tile
        if (lineRect(pos.x, pos.y, player.pos.x, player.pos.y, tx, ty, tw, th)) {
            return true; // Blocked by a tree
        }
    }
    return false; // No obstruction
}

// Example line/rectangle intersection method (similar to your earlier implementation)
boolean lineRect(float x1, float y1, float x2, float y2, float rx, float ry, float rw, float rh) {
    boolean left = lineLine(x1, y1, x2, y2, rx, ry, rx, ry + rh);
    boolean right = lineLine(x1, y1, x2, y2, rx + rw, ry, rx + rw, ry + rh);
    boolean top = lineLine(x1, y1, x2, y2, rx, ry, rx + rw, ry);
    boolean bottom = lineLine(x1, y1, x2, y2, rx, ry + rh, rx + rw, ry + rh);

    return left || right || top || bottom;
}

// Example line/line intersection method
boolean lineLine(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {
    float uA = ((x4 - x3) * (y1 - y3) - (y4 - y3) * (x1 - x3)) / ((y4 - y3) * (x2 - x1) - (x4 - x3) * (y2 - y1));
    float uB = ((x2 - x1) * (y1 - y3) - (y2 - y1) * (x1 - x3)) / ((y4 - y3) * (x2 - x1) - (x4 - x3) * (y2 - y1));

    return (uA >= 0 && uA <= 1 && uB >= 0 && uB <= 1);
}

void findTreeTiles(int[][] map) {
    treeTiles.clear(); // Clear previous data
    for (int row = 0; row < map.length; row++) {
        for (int col = 0; col < map[row].length; col++) {
            if (map[row][col]>= 1 ) {
                float x = col * 105 - 105/2; // Column to pixel position
                float y = row * 105 - 105/2; // Row to pixel position
                treeTiles.add(new PVector(x, y)); // Store tree tile position
            }
        }
    }
}


void drawTreeTiles() {
    rectMode(CORNER); // Ensures rect is drawn from the top-left corner
    for (PVector tree : treeTiles) {
        float obstacleX = tree.x;
        float obstacleY = tree.y;
       
        pushMatrix();
        translate(-player.pos.x + width / 2 + obstacleX, 
                  -player.pos.y + height / 2 + obstacleY);
   
        popMatrix();
    }
}

void displayDetectionText() {
    pushMatrix();
    translate(width / 2, height - 50); // Position text at the bottom center
    textAlign(CENTER);
    textSize(20);
    fill(playerInSight ? color(0, 255, 0) : color(255, 0, 0)); // Green if detected, red otherwise
    text(playerInSight ? "Player Detected" : "Player Hidden", 0, 0);
    popMatrix();
}
}
