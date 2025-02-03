//Player subclass
class Player extends Character { 
  
  PImage[] standing = new PImage[1]; //frames for character's different movements
  PImage[] walking_side = new PImage[2];
  PImage[] walking_front = new PImage[2];
  PImage[] walking_back = new PImage[2];
  PImage[] attack = new PImage[1];
  
  float rotationAngle = 0; // Angle for rotation
  
  ArrayList<Projectile> bullets; 
  
  Player (PVector pos) { //constructor
    super(pos);
    vel = new PVector();
    dim = new PVector(75, 75);
    
    bullets = new ArrayList<Projectile>();
    
    isAlive = true;
    maxHealth = 20; 
    currentHealth = maxHealth;
    
    
    standing[0] = loadImage("data/characters/antLeft.png"); //holds frame for standing still
    attack[0] = loadImage("data/characters/antLeft.png"); //holds frame to attack
    activeFrames = standing;
    
    walking_side[0] = loadImage("data/characters/antLeft.png");
    walking_side[1] = loadImage("data/characters/antRight.png");
    walking_front[0] = loadImage("data/characters/antLeft.png");
    walking_front[1] = loadImage("data/characters/antRight.png");
    walking_back[0] = loadImage("data/characters/antLeft.png");
    walking_back[1] = loadImage("data/characters/antRight.png");
    
    
  }
  
  
  void update() {
    super.update();
    charDirection(); 
    
    // Calculate rotation angle based on velocity
    if (vel.mag() > 0) { // Only update angle if moving
      rotationAngle = atan2(vel.y, vel.x);
    }
  }
  
  
  void drawMe() { //drawing the character
    pushMatrix();
    push();
    imageMode(CENTER);
    
    translate(width / 2, height / 2); 
    rotate(rotationAngle);  // Apply rotation
     rotate(-30);
    translate(-width / 2, -height / 2); 
    
    PImage img = activeFrames[currFrames];
    if (vel.x > 0) {  //reverse image when facing right
      image(img, width/2, height/2, dim.x, dim.y);
    }
    else {
      image(img, width/2, height/2, dim.x, dim.y);
    }
    
    translate(width / 2, height / 2); 
     rotate(30);
    translate(-width / 2, -height / 2); 

    
    if(weaponCount > 0)
    {
       PImage weapon = loadImage("data/object/weapon0.png");
        weapon.resize((int) 30, (int) 30);
        translate(width / 2, height / 2); 
        rotate(-45);  // Apply rotation
        translate(-width / 2, -height / 2); 
        image(weapon, width/2, height/2-10, dim.x, dim.y);
        translate(width / 2, height / 2); 
        rotate(45);  // Apply rotation
        translate(-width / 2, -height / 2); 
    }
    
    pop();
    popMatrix();
  }
  
  
  void drawHealth() { //drawing the health bar on the top left hand corner of the screen
    int scale = 200;
    
    //pushMatrix();
    //translate(25, 35);
    //noStroke();
    //fill(textColor);
    //textSize(24);
    //text("health: ", 0, 0);
    
    //translate(0, 15);
    //fill(100);
    //rect(0, 0, scale, 20);
    //if(currentHealth >= 0) {
    //  fill(healthColor);
    //  float healthPercent = (float) currentHealth/maxHealth;
    //  rect(0, 0, scale * healthPercent, 20);
    //}
    //popMatrix();
  } 
  
  
  void charDirection() { //for animating player moving and switching depending on the way they are facing
    if (frameCount % 6 == 0 ) {
      currFrames++;
      
      switch(movingPos) {
        case 1: 
          if(currFrames == walking_side.length) { //walking side
            currFrames = 0;
          }
          activeFrames = walking_side;
          break;
        case 2:
          if(currFrames == walking_front.length) { //walking down
            currFrames = 0;
          }
          activeFrames = walking_front;
          break;
        case 3:
          if(currFrames == walking_back.length) { //walking up
            currFrames = 0;
          }
          activeFrames = walking_back; //walking back
          break;
        case 4:
          currFrames = 0;
          activeFrames = attack; //attacking
          break;
        default:  
          currFrames = 0;
          activeFrames = standing; //facing front, standing still
      }
    }
  }

  void attack() {
    for(int i = 0; i < enemies.size(); i++) {
      if (collision(enemies.get(i))) { //if collide, can attack
        enemies.get(i).currentHealth--;
        playSound(ATTACK);
      }
    }
  }
  
  void dead() {
    if(currentHealth == 0) { //check if death
      isAlive = false;
      gameState = LOSE;
    }
  }
}
