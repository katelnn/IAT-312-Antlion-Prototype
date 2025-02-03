//Methods to control the game

// Timer variables
int timerDuration = 3 * 60; // 5 minutes in seconds
int remainingTime = timerDuration;
boolean timeAdded = false;
int timeAddedTimer = 120;
boolean isRunning = false;
int lastMillis = 0;

// Button variables
int buttonX = 30, buttonY = 20;
int buttonWidth = 50, buttonHeight = 50;
String buttonText = "Pause";
boolean timerStarted = false; // Tracks if the timer has started
boolean paused = false; // Tracks if the game is paused
boolean drawRemainingTime = false;
boolean completedLevel = false;

boolean lose = false;
boolean hasLost = false;


void intro() { //intro to the game
  if (!setupIntro) {
    setupIntro = true; 
  }
  //backgroundMusic.play();
  //backgroundMusic.loop();
  
  
  
  background(240, 186, 184);
  fill(0); 
  PImage introScreen = loadImage("data/intro.png"); //display introduction screen
  image(introScreen, 0, 0);
  
  textSize(64);
 // cP5.getController("start").show();
  //cP5.getController("how to play").show();
  
  //add detection functionality
  
  setup1 = false; //reset all levels
  setup2 = false;
  setup3 = false;
  setup4 = false;
}


void checkHoveredState() {
  if ((mouseX > 400 && mouseX < 620) && (mouseY > 340 && mouseY < 370)) { //top
    if (mousePressed && (mouseButton == LEFT)) {
      gameState = 1;
    }
    else {
      gameState = 0;
    
  }
  }
  else if ((mouseX > 400 && mouseX < 620) && (mouseY > 420 && mouseY < 450)) { //bottom
    if (mousePressed && (mouseButton == LEFT)) {
      gameState = -1;
    }
    else {
      gameState = -2;
     }
  }
}



void intro2() { //intro to the game
  if (!setupIntro) {
    setupIntro = true;    
  }
  
  //backgroundMusic.play();
  //backgroundMusic.loop();
  
  
  background(240, 186, 184);
  fill(0); 
  PImage introScreen = loadImage("data/intro1.png"); //display introduction screen
  image(introScreen, 0, 0);
  
  textSize(64);
 // cP5.getController("start").show();
  //cP5.getController("how to play").show();
  
  setup1 = false; //reset all levels
  setup2 = false;
  setup3 = false;
  setup4 = false;
}

void instruction() { //instruction of the game
  
  
  //backgroundMusic.pause();
  background(255);
  scale(1, 1);
  translate(0, 0);
  PImage instructionScreen = loadImage("data/instruction.png"); //display instruction manual 
  image(instructionScreen, 0, 0);
  
  cP5.getController("menu").show();
}

void level1() {
  //println(weaponCount);
  
  if (!setup1) {
    setup1 = true; // Set up the level
    clearLists(); // Clear all elements
    generateMap(map1); // Draw the environment for the level
    
    Tile startTile = tiles.get(playerLvl1); // Player position
    player = new Player(new PVector(startTile.pos.x, startTile.pos.y)); 
    
    // Add presents
    for (int i = 0; i < presentLvl1.length; i++) {
      Tile presentTile = tiles.get(presentLvl1[i]);
      presents.add(new Present(new PVector(presentTile.pos.x, presentTile.pos.y)));
    }
    
    for (int i = 0; i < heartLvl1.length; i++) {
      Tile heartTile = tiles.get(heartLvl1[i]);
      hearts.add(new Heart(new PVector(heartTile.pos.x, heartTile.pos.y)));
    }
    
    for (int i = 0; i < weaponLvl1.length; i++) {
      Tile weaponTile = tiles.get(weaponLvl1[i]); // Weapon position
      weapons.add(new Weapon(new PVector(weaponTile.pos.x, weaponTile.pos.y)));
    }
    
    generateEnemies(enemyLvl1); // Generate enemies
    generateBosses(bossLvl1); // Generate enemies
  }
  
  // Start the timer when entering Level 1
  //println(timerStarted);
  if (!timerStarted) {
    isRunning = true;   // Start the timer
    lastMillis = millis(); // Record the current time
    timerStarted = true; // Mark timer as started
  }

  // Update the timer logic if running and not paused
  if (!paused && isRunning) {
    if (millis() - lastMillis >= 1000) { // Check if 1 second has passed
      remainingTime--; // Decrease the remaining time
      lastMillis = millis(); // Update the lastMillis to the current time
    }

    if (remainingTime <= 0) {
      isRunning = false; // Stop the timer when it reaches 0
      lose = true;
      
      println("Time's up!");
    }
  
  }
  
  //----------
   if (weaponTimerRunning) {
      if (millis() - lastWeaponTimerMillis >= 1000) { // Check if 1 second has passed
      //println(weaponTimerRemaining);
        weaponTimerRemaining--; // Decrease the remaining time
        lastWeaponTimerMillis = millis(); // Reset the timer

        if (weaponTimerRemaining <= -1) { // Timer has reached 0
          weaponCount--; // Decrease the weapon count
          weaponTimerRemaining = weaponTimerCountdown; // Reset the timer
          if (weaponCount <= 0) {
            weaponTimerRunning = false; // Stop the timer if no weapons left
            drawRemainingTime = false;
          }
        }
      }
    }
      
  //----------

  // Update and generate level elements only when not paused
  if (!paused) {
    update();          // Update game elements // Generate the level
  }
  if (!completedLevel && !lose) {
   generateLevel(1); 
   drawRectangle();
   displayItem();
   displayWeapon();
   generateLevel(1);
   displayPlayerIcon();
  // Display the timer
  fill(0);
  textSize(60);
  text(formatTime(remainingTime), width / 2 - 60, height / 2 - 265);
  
   if (timeAdded) { //show visual that time has been added
      //println("HELLO" + timeAddedTimer);
      if (timeAddedTimer <= 0) {
        timeAdded = false;
      }
      else {
        timeAddedTimer--;
        fill(0, 255, 0);
        text("+ 00:30", width / 2 + 50, height / 2 - 265);
      }
    }

  // Show the pause screen if the game is paused
  if (paused) {
    displayPauseScreen();
  }
  
  // Draw the pause/resume button
  drawButton();
  
  if (!completedLevel){
     printDoor(doorText);
  }
  
}
}





void level2() { //same thing w/ level 2
  
  if (!setup2) {
    setup2 = true;
    clearLists();
    generateMap(map2);
    weaponCount = 0;
    
    Tile startTile = tiles.get(playerLvl2); 
    player = new Player(new PVector(startTile.pos.x, startTile.pos.y)); 
    
    for(int i = 0; i < presentLvl2.length; i++) {
      Tile presentTile = tiles.get(presentLvl2[i]);
      presents.add(new Present(new PVector(presentTile.pos.x, presentTile.pos.y)));
    }

    for(int i = 0; i < heartLvl2.length; i++) {
      Tile heartTile = tiles.get(heartLvl2[i]);
      hearts.add(new Heart(new PVector(heartTile.pos.x, heartTile.pos.y)));
    }
    
    for(int i = 0; i < weaponLvl2.length; i++) {
      Tile weaponTile = tiles.get(weaponLvl2[i]);
      weapons.add(new Weapon(new PVector(weaponTile.pos.x, weaponTile.pos.y)));
    }
    
    generateEnemies(enemyLvl2);
  }
  update();
  generateLevel(2);
}


void level3() { //same thing w/ levl 3
  if (!setup3) {
    setup3 = true;
    clearLists();
    generateMap(map3);
    weaponCount = 0;
    
    Tile startTile = tiles.get(playerLvl3);
    player = new Player(new PVector(startTile.pos.x, startTile.pos.y)); 
    
    for(int i = 0; i < presentLvl3.length; i++) {
      Tile presentTile = tiles.get(presentLvl3[i]);
      presents.add(new Present(new PVector(presentTile.pos.x, presentTile.pos.y)));
    }
    
    for(int i = 0; i < heartLvl3.length; i++) {
      Tile heartTile = tiles.get(heartLvl3[i]);
      hearts.add(new Heart(new PVector(heartTile.pos.x, heartTile.pos.y)));
    }
    
    for(int i = 0; i < weaponLvl3.length; i++) {
      Tile weaponTile = tiles.get(weaponLvl3[i]);
      weapons.add(new Weapon(new PVector(weaponTile.pos.x, weaponTile.pos.y)));
    }
    
    
    generateEnemies(enemyLvl3);
  }
  update();
  generateLevel(3);
  
  if (presentCount >= 10) { //if player collected 10 presents by this point, they win
      gameState = WIN;
      playSound(WINNING);
  }
}





void win() { //winning method
  if(!setupWin) {
    setupWin = true; //switch boolean
    
  }
  background(187, 206, 148);
  fill(0);
  PImage winScreen = loadImage("data/winning.png"); //display winning screen
  image(winScreen, 0, 0);

  textSize(64);
  
  cP5.getController("menu").show(); //allow player to go back to introduction
}


void lose() { //losing method
  if(!setupLose) {
    setupLose = true;
  }
  
  background(187, 206, 148);
  fill(0);
  textSize(64);
  text("GAME OVER", 310, height/2); 
  
  cP5.getController("restart").show(); //allow player to restart game
  
  player.currentHealth = player.maxHealth; //reset all elements
  weaponCount = 0; 
  presentCount = 0;
  clearLists();
  
  backgroundMusic.pause();
}


void generateEnemies(int[] enemyList) { //adding enemies method
  for (int i = 0; i< enemyList.length; i++) {
    Tile enemyTile = tiles.get(enemyList[i]);
    if (i == 0)
      enemies.add(new Enemy(new PVector(enemyTile.pos.x, enemyTile.pos.y), 2650));
    else if (i == 1)
      enemies.add(new Enemy(new PVector(enemyTile.pos.x, enemyTile.pos.y), 3050));
    else if (i == 2)
      enemies.add(new Enemy(new PVector(enemyTile.pos.x, enemyTile.pos.y), 950));
    else
      enemies.add(new Enemy(new PVector(enemyTile.pos.x, enemyTile.pos.y), 650));
  }
}

void generateBosses(int[] bossList) { //adding enemies method
  for (int i = 0; i< bossList.length; i++) {
    Tile bossTile = tiles.get(bossList[i]);
    if (i ==0)
      enemies.add(new Boss(new PVector(bossTile.pos.x, bossTile.pos.y), 2650));
    else if (i ==1)
      enemies.add(new Boss(new PVector(bossTile.pos.x, bossTile.pos.y), 1800));
    else
      enemies.add(new Boss(new PVector(bossTile.pos.x, bossTile.pos.y), 850));
  }
}

void generatePresents(int[] itemList) { //adding present method
  for (int i = 0; i< itemList.length; i++) {
    Tile presentTile = tiles.get(itemList[i]);
    presents.add(new Present(new PVector(presentTile.pos.x, presentTile.pos.y)));
  }
}


void clearLists() { //clearing the arraylists for all elements
  enemies.clear();
  tiles.clear();
  presents.clear();
  hearts.clear();
}

void completeLevel() {
  pushMatrix();
  fill(162, 133, 97);
  rect(0,0,width, height);
  fill(0); 
  text("Victory!", width/2-50, height/2-150);
  textSize(32);
  text("You have escaped the Antlion den and fed your colony!", width/2-300, height/2-100);
  fill(255, 215, 0);
  text("Objectives", width/2-50, height/2-50);
  strokeWeight(5);
  line(width/2-50, height/2-40, width/2+65, height/2-40);
  
  
  
  //Objective list starts here
   checkObjectives(gameState);
  
  popMatrix();
}

void loseLevel(){
    pushMatrix();
    fill(162, 133, 97);
    rect(0,0,width, height);
    fill(0); 
    text("Game Over!", width/2-125, height/2-150);
    textSize(32);
    text("The ants from the colony want you to try again!", width/2-275, height/2-100);
    fill(255, 215, 0);
    text("Objectives", width/2-50, height/2-50);
    strokeWeight(5);
    line(width/2-50, height/2-40, width/2+65, height/2-40);
    
 
    //Objective list starts here
     checkObjectives(gameState);
    
    popMatrix();
}

void checkObjectives(int level) {
   PImage complete = loadImage("data/assets/YellowStar.png");
   PImage incomplete = loadImage("data/assets/HollowStar.png");
  if (level == 1) {
    text("Obtained a score greater than " + objectiveLvl1[0], width/2-50, height/2);
      if (calculateScore() >= objectiveLvl1[0]) {
          image(complete, width/2-150, height/2-35, 50, 50);
      }
      else {
        image(incomplete, width/2-150, height/2-35, 50, 50);
      }
      
       text("Finished the level in under " + formatTime(objectiveLvl1[1]), width/2-50, height/2+50);
      if(remainingTime <=  objectiveLvl1[1] && lose == false) {
          image(complete, width/2-150,  height/2+15, 50, 50);
      }
      else {
          image(incomplete, width/2-150, height/2+15, 50, 50);
      }
      text("Escaped the level before nightfall", width/2-50, height/2+100);
      
      if (lose == true)
        image(incomplete, width/2-150, height/2+65, 50, 50);
      else
        image(complete, width/2-150, height/2+65, 50, 50);
      if (checkHovered()) {
        fill(161, 127, 108);
      }
      else {
        fill(108, 86, 7);
      }
      rect(width/2 - 150, height/2+150, 300, 100);
      fill(0);
      textSize(64);
      text("Home", width/2-55, height/2+220);
      checkInteraction();
      
  }
  
  //Make states for lvl 2 and 3
}

void checkInteraction() {
 if ((mouseX > width/2 - 150 && mouseX < width/2+150) && (mouseY > height/2+150 && mouseY < height/2+250) && mousePressed) {
         player.currentHealth = player.maxHealth; //reset all elements
         weaponCount = 0; 
         presentCount = 0;
         clearLists();
         hasLost = false;
         completedLevel = false;
         lose = false;
         background(0);
         setup1 = false;
         setupWin = false;
         setupLose = false;       
         gameState = 1;
        }
        
    }


boolean checkHovered() {
 if ((mouseX > width/2 - 150 && mouseX < width/2+150) && (mouseY > height/2+150 && mouseY < height/2+250)) {
       return true;
    }
    else {
      return false;
    }
}
  

void update() {
  if (lose) {
    background(0);
    isRunning = false;
    loseLevel();
  }
  else if (completedLevel) {
      background(0);
      isRunning = false;
      completeLevel();
    }
  else if (!paused) { // Only update if the game is not paused
    for (int i = 0; i < tiles.size(); i++) { // Update tiles with other elements
      Tile t = tiles.get(i);
      t.collision(player);
      
      if (t.checkBorder()) {
        t.drawMe(player);
      }
      if (t instanceof Door) {
        t.collideChar(player);
      }
      if (t instanceof Gate) {
        t.checkEnemies();
      }
    }
    
    for (int i = 0; i < presents.size(); i++) { // Update presents, hearts, and weapons
      presents.get(i).update();
    }
    for (int j = 0; j < hearts.size(); j++) {
      hearts.get(j).update();
    }
    for (int l = 0; l < weapons.size(); l++) { 
      weapons.get(l).update();
    }
    
    for (int k = 0; k < enemies.size(); k++) { // Update enemies and bullets
      for (int s = 0; s < tiles.size(); s++) {
        Tile t = tiles.get(s);
        t.bulletCollision(enemies.get(k).bullets);
      }
      enemies.get(k).update();
    }
    
    
    if (completedLevel != true && lose != true) {
      displayItem(); // Set up actions for elements
      displayWeapon();
      printDoor(doorText);
      keyboardMove(); // Handle player movement
      player.update();
      if (drawRemainingTime) {
        drawTimeRemaining();
      }
    }
  }
  
  // Always draw the player (even when paused)
  if (completedLevel == false && lose == false) {
    player.drawMe();
  }
}

void drawTimeRemaining() {
  pushMatrix();
  translate(width/2, height/2-90);
  noStroke();
  fill(45,84,46);
  ellipse(0,0, 50,50);
  fill(250);
  ellipse(0,0,39,39);
  fill(116,147,80);
  rotate(4.7);
  arc(0,0,40,40,0,weaponTimerRemaining*0.63);
    
  popMatrix();
  
}


// Function to draw the button
void drawButton() {
  PImage pause = loadImage("data/object/pause.png");
  PImage resume = loadImage("data/object/resume.png");
  pause.resize((int) buttonWidth, (int) buttonHeight);
  resume.resize((int) buttonWidth, (int) buttonHeight);
  
 
  
  fill(100, 200, 100);
   if (paused == false)
  image(pause, buttonX, buttonY);
  else
  image(resume, buttonX, buttonY); 
 
}

// Function to draw the button
void drawRectangle() {
  fill(116, 147, 80);
  rect(0, 0, width, 80);
  rect(0, 570, width, 80);
}

String formatTime(int seconds) {
  int minutes = seconds / 60;
  int secs = seconds % 60;
  
  if (minutes == 0 && secs == 0)
    lose = true;
  return nf(minutes, 2) + ":" + nf(secs, 2);
}

void mousePressed() {
  // Check if the pause button is clicked
 if (mouseX > buttonX && mouseX < buttonX + buttonWidth &&
    mouseY > buttonY && mouseY < buttonY + buttonHeight) {
    paused = !paused; // Toggle the paused state

    // Update button text based on the paused state
    if (paused) {
      buttonText = "Resume";
    } else {
      buttonText = "Pause";
    }
  }
  
  if (lose == true || completedLevel == true){
    float rectX = width / 2 - 150;
    float rectY = height / 2 + 150;
    float rectW = 300;
    float rectH = 100;

    // Check if the mouse is within the rectangle's boundaries
    if (mouseX >= rectX && mouseX <= rectX + rectW &&
        mouseY >= rectY && mouseY <= rectY + rectH) {
       gameState = 0;
    }
  }
  
}

void displayPauseScreen() {
  fill(0, 150); // Semi-transparent overlay
  rect(0, 0, width, height);

  fill(255);
  textSize(32);
  textAlign(CENTER, CENTER);
  text("Game Paused", width / 2, height / 2);

  textSize(16);
  text("Click Resume to Continue", width / 2, height / 2 + 50);
  textAlign(LEFT, LEFT);
}
