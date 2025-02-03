//Methods to control the GUI

void displayItem() { //display the present count
  PImage img = loadImage("data/object/thing0.png"); //show iamge of the present
  img.resize(50, 50);
    
  image(img, width -285, height - 60);
  fill(presentColor);
  textSize(45);
  if (presentAllowed - presentCount <= 0) {
      fill(0, 255, 0);
      text("Objective Met!", width - 225, height - 25);
  }
  else {
    text("Required: " + (presentAllowed - presentCount), width - 225, height - 25);
  }
}

void displayWeapon() { //display the weapon count
  int temp = calculateScore();
  PImage img = loadImage("data/object/thing0.png"); //show inage of the weapon
  img.resize(50, 50);
  
  image(img, width - 220, height - 630);
  fill(0);
  textSize(45);
  
  text("Score: " + (temp), width - 160, height - 595);
}

int calculateScore() {
  int temp = 0;
  for (int x = 0; x < presentCount; x++) {
    if (x < presentAllowed) {
      temp += 5;
    }
    else if (x >= presentAllowed) { //reward thep layer with extra score for obtaining more objective items
      //println("how much" + (5 * (int(presentCount-presentAllowed/5))));
      temp += 5 * (int(presentCount-presentAllowed/5));
    }
}
  return temp;
}




void displayPlayerIcon() { //display the weapon count
  PImage img = loadImage("data/characters/antLeft.png"); //show inage of the weapon
  img.resize(80, 80);
  
   // Coordinates for the icon
  float x = width - 900; // X-coordinate of the image
  float y = height - 65; // Y-coordinate of the image

  // Draw the circle
  fill(217, 217, 217); // Set the fill color for the circle
  stroke(45, 84, 46);         // Set the stroke color for the circle
  strokeWeight(6);   // Set the thickness of the circle outline
  ellipse(x + 25, y + 25, 70, 70); // Draw the circle (centered around the image)
  strokeWeight(1);   // Set the thickness of the circle outline
  
  image(img, width - 915, height - 85);
}

void generateLevel(int level) { //display the level player is on
  textSize(45);
  fill(textColor);
  text("Level " + level, width/2 + 70 , height - 25);
}


void printDoor(boolean doorText) { //display when door is locked
  if(doorText) {
    fill(foodColor);
    textSize(50);
    text("collect " + presentAllowed + " foods to exit", width - 700, height - 505);
  }
}


void styleButtons() { //general styling for buttons
  PFont buttonFont = createFont("data/Jersey10-Regular.ttf", 18); 
  
  //start
  start.getCaptionLabel().setFont(buttonFont);
  start.setColorForeground(color(161, 127, 108)); //change color when the mouse hovers
  start.setColorBackground(color(108, 86, 73));
  
  //how to play 
  instructionPlay.getCaptionLabel().setFont(buttonFont);
  instructionPlay.setColorForeground(color(161, 127, 108));
  instructionPlay.setColorBackground(color(108, 86, 73));
  
  //menu
  menu.getCaptionLabel().setFont(buttonFont);
  menu.setColorForeground(color(161, 127, 108));
  menu.setColorBackground(color(238, 187, 53));
  
  //restart
  restart.getCaptionLabel().setFont(buttonFont);
  restart.setColorForeground(color(96, 112, 197));
  restart.setColorBackground(color(78, 103, 25)); 
}


void controlEvent(ControlEvent event) {

  if (event.getController().getName() == "start") { //pressed start then enter lvl1
    gameState = LEVEL1;
    setupIntro = false;
    cP5.getController("start").hide();
    cP5.getController("how to play").hide();
  }
  
  if (event.getController().getName() == "restart") { //if restart go back to intro
    gameState = INTRO;
    setupWin = false;
    setupLose = false;
    cP5.getController("restart").hide();
  }
  
  if (event.getController().getName() == "how to play") { //show instrutction manual when press how to play
    gameState = INSTRUCTION;
    cP5.getController("how to play").hide();
    cP5.getController("start").hide();
  }

  if (event.getController().getName() == "menu") { //go back to intro when press menu
    gameState = INTRO;
    setupIntro = false;
    cP5.getController("menu").hide();
  }
}
