//Enemy subclass
class Enemy extends Character {
  
  boolean movingRight = true; //flag to track movement direction
  float moveSpeed = 8; //enemy's speed
  float startX; //initial x position
  float range; //range of enemy's movement
  boolean shouldMove = true; //boolean to see if enemy should move or not

  PVector diff, charDiff; //to calculate collision between characters
  
  ArrayList<Projectile> bullets; 
  int bulletTime = 0; //to control time interval between each bullet fired
  
  PImage[] moving = new PImage[2]; 
  
  float fovRadius = 250; // Radius of the FOV
  float fovAngle = radians(90); // Angle of the FOV (90 degrees)
  boolean playerInSight = false; // Whether the player is in the FOV
  int playerInSightCount = 0;
  int treeInSightCount = 0;
  float heat = 0;
  int heatCooldown = 180;
  int gameEndCooldown = 120;

  ArrayList<PVector> treeTiles = new ArrayList<>();



  
  Enemy(PVector pos, float r) { 
    super(pos);
    vel = new PVector(0, 0);
    dim = new PVector(100, 100);
    startX = pos.x;
    range = r;
 
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
              
     translate(-50,-50);
    // Flip the image based on the direction
    if (movingRight) {
      scale(1, 1); // Normal orientation
    } else {
      scale(-1, 1); // Flip horizontally
      translate(-dim.x, 0); // Adjust position when flipped
    }
    
    rotate(-30);
    image(activeFrames[currFrames], 0, -dim.y / 2, dim.x, dim.y); // Draw the enemy
    rotate(30);
        
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
  
  void moveBackAndForth() { //to make enemies move on it's x position
    if (shouldMove) {
      if (movingRight) {
        vel.x = moveSpeed;
      } else {
          vel.x = -moveSpeed;
        }
  
    if (pos.x > startX + range) { //check if enemy should change direction
      movingRight = false;
    } else if (pos.x < startX) {
        movingRight = true;
      }
    
    }
  }
  
void drawFOV() {
    PVector toPlayer = PVector.sub(player.pos, pos); // Vector from Enemy to player
    float distanceToPlayer = toPlayer.mag(); // Distance between Enemy and player
    pushMatrix();
    translate(-player.pos.x + width / 2 + pos.x, 
              -player.pos.y + height / 2 + pos.y);
    fill(203, 134, 107, 150);
    stroke(255, 204, 0, 150); // Yellow transparent FOV
    strokeWeight(1);
    
    beginShape();
    vertex(0, 0); // Start from enemy position

    if (movingRight) {
        // FOV Facing Right
        vertex(fovRadius, -fovRadius * tan(fovAngle / 2)); // Top right
        vertex(fovRadius, fovRadius * tan(fovAngle / 2));  // Bottom right
    } else {
        // FOV Facing Left
        vertex(-fovRadius, -fovRadius * tan(fovAngle / 2)); // Top left
        vertex(-fovRadius, fovRadius * tan(fovAngle / 2));  // Bottom left
    }

    endShape(CLOSE);
    popMatrix();
}


void checkFOV() {
    PVector toPlayer = PVector.sub(player.pos, pos); // Vector from Enemy to player
    float distanceToPlayer = toPlayer.mag(); // Distance between Enemy and player

    // Check if the player is within the FOV radius
    if (distanceToPlayer <= fovRadius) {
        float angleToPlayer = atan2(toPlayer.y, toPlayer.x);
        float referenceAngle = movingRight ? 0 : PI; // Facing right = 0 degrees, left = 180 degrees
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
                  if (lose != true) {
                  calculateHeat();
                  }
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
       // println("Player Hidden"); // ✅ Print to console
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
  if (!movingRight) { //goes left
    translate(-player.pos.x + width / 2 + pos.x+50, 
              -player.pos.y + height / 2 + pos.y-70);
  }
  else { //goes right
    translate(-player.pos.x + width / 2 + pos.x-50, 
              -player.pos.y + height / 2 + pos.y-70);
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
    if (gameEndCooldown == 120) {
          spotted.play();
    }
    gameEndCooldown--;
    shouldMove = false;
    player.frozen = true;
    if (gameEndCooldown < 0) {
    lose = true;
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
    //text(playerInSight ? "Player Detected" : "Player Hidden", 0, 0);
    popMatrix();
}


  
//    void drawFOV() {
//    pushMatrix();
//    translate(-player.pos.x + width / 2 + pos.x, -player.pos.y + height / 2 + pos.y);

//    noStroke();
//    fill(0, 0, 255, 50); // Semi-transparent blue for the FOV
//    if (movingRight) {
//      arc(0, 0, fovRadius * 2, fovRadius * 2, -fovAngle / 2, fovAngle / 2); // FOV when moving right
//    } else {
//      arc(0, 0, fovRadius * 2, fovRadius * 2, PI - fovAngle / 2, PI + fovAngle / 2); // FOV when moving left
//    }

//    popMatrix();
//  }

//  void checkFOV() {
//    if (isTreeInFOV() == false) isPlayerInFOV();
//    else println("Nothing is detected");
//}

//boolean isTreeTile(int x, int y) {
//    if (x < 0 || y < 0 || y >= map1.length || x >= map1[0].length) {
//        return false; // Out of bounds
//    }
//    int tileType = map1[y][x];
//    return tileType == TREE_TILE;
//}


//boolean isTreeInFOV() {
//    float heading = movingRight ? 0 : PI; // Determine direction based on movement
//    for (float angle = -fovAngle / 2; angle <= fovAngle / 2; angle += radians(5)) {
//        for (float r = 0; r <= fovRadius; r += 10) {
//            float sampleX = pos.x + r * cos(angle + heading); // Sample point in FOV
//            float sampleY = pos.y + r * sin(angle + heading);

//            int tileX = floor(sampleX / tileSize); // Tile index
//            int tileY = floor(sampleY / tileSize);

//            if (isTreeTile(tileX, tileY)) { // Check if this is a tree tile
//              treeInSightCount++;
//                println("Tree detected at tile (" + tileX + ", " + tileY + ") : " + treeInSightCount);
//                return true;
//            }
//        }
//    }
//    return false;
//}

//boolean isPlayerInFOV() {
//    float heading = movingRight ? 0 : PI; // Determine direction based on movement
//    PVector directionToPlayer = PVector.sub(player.pos, pos); // Vector to player
//    float distanceToPlayer = directionToPlayer.mag();

//    if (distanceToPlayer <= fovRadius) { // Check if within FOV radius
//        float angleToPlayer = atan2(directionToPlayer.y, directionToPlayer.x) - heading; // Angle to player

//        // Normalize angle to [0, TWO_PI]
//        angleToPlayer = (angleToPlayer + TWO_PI) % TWO_PI;
//        float startAngle = (-fovAngle / 2 + TWO_PI) % TWO_PI;
//        float endAngle = (fovAngle / 2 + TWO_PI) % TWO_PI;

//        if(weaponCount > 0){
//          if (startAngle < endAngle) {
//              if (angleToPlayer >= startAngle && angleToPlayer <= endAngle) {
//                playerInSightCount++;
//                  println("Player detected but got shield! : " + playerInSightCount);
//                  return true;
//              }
//          } else { // FOV spans across 0 degrees
//              if (angleToPlayer >= startAngle || angleToPlayer <= endAngle) {
//                 playerInSightCount++;
//                  println("Player detected but got shield! : " + playerInSightCount);
//                  return true;
//              }
//          }
//        }
//        else{
//          if (startAngle < endAngle) {
//              if (angleToPlayer >= startAngle && angleToPlayer <= endAngle) {
//                playerInSightCount++;
//                  println("Player detected but NO shield! : " + playerInSightCount);
//                  return true;
//              }
//          } else { // FOV spans across 0 degrees
//              if (angleToPlayer >= startAngle || angleToPlayer <= endAngle) {
//                 playerInSightCount++;
//                  println("Player detected but NO shield! : " + playerInSightCount);
//                  return true;
//              }
//          }
//        }
          
//    }
//    return false;
//}

  
  
  void drawHealth() { //enemy's health bar
    
  // float scale = dim.x - 5;
   
  //  pushMatrix();
    
  //  translate(-player.pos.x + width/2 + pos.x - scale/2, 
  //   -player.pos.y + height/2 + pos.y - dim.y + 10);
  //  fill(100);
  //  rect(0, 0, scale, 8);
    
  //  if(currentHealth >= 0) {
  //    fill(healthColor);
  //    float healthPercent = (float) currentHealth/maxHealth;
  //    rect(0, 0, scale * healthPercent, 8);
  //  }
  //  popMatrix();
  //
}
}






//PVector playerPos = player.pos.copy(); // Get the player's position
    //PVector directionToPlayer = PVector.sub(playerPos, pos); // Vector from enemy to player
    //float distanceToPlayer = directionToPlayer.mag(); // Distance to the player
    //boolean treeBlocking = false; // Reset tree blocking flag

    //if (distanceToPlayer <= fovRadius) { // Check if the player is within the radius
    //    float angleToPlayer = atan2(directionToPlayer.y, directionToPlayer.x); // Angle to the player

    //    // Adjust the FOV angle based on the enemy's direction
    //    float fovStart, fovEnd;
    //    if (movingRight) {
    //        fovStart = -fovAngle / 2;
    //        fovEnd = fovAngle / 2;
    //    } else {
    //        fovStart = PI - fovAngle / 2;
    //        fovEnd = PI + fovAngle / 2;
    //    }

    //    // Normalize the angles to the range [0, TWO_PI]
    //    angleToPlayer = (angleToPlayer + TWO_PI) % TWO_PI;
    //    fovStart = (fovStart + TWO_PI) % TWO_PI;
    //    fovEnd = (fovEnd + TWO_PI) % TWO_PI;

    //    // Check if the player's angle falls within the FOV angle range
    //    if (fovStart < fovEnd) {
    //        playerInSight = angleToPlayer >= fovStart && angleToPlayer <= fovEnd;
    //    } else { // Handle cases where the FOV wraps around 0 degrees
    //        playerInSight = angleToPlayer >= fovStart || angleToPlayer <= fovEnd;
    //    }
    //} else {
    //    playerInSight = false; // Player is out of range
    //}

    //// Debug output
    //if (playerInSight) {
    //    playerInSightCount++;
    //    println("Player in sight! Count: " + playerInSightCount);
    //}
