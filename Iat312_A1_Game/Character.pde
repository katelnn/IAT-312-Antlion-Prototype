//Character superclass
class Character {
  
  PVector pos, vel, dim; //initialization fields
 // float damp = 0.7;
  float damp = 0.7;
  boolean isAlive;
  int currentHealth;
  int maxHealth;
  float rotationAngle;
  boolean frozen = false;
  
  PImage[] activeFrames; //fields to store animation frames
  int currFrames = 0;  //integer to keep track of current frame
  
  Character(PVector pos) { //constructor
    this.pos = pos;
    vel = new PVector();
    dim = new PVector(50, 50);
  }
  
  void update() { //calls other methods
    if (!frozen) {
      vel.mult(damp); //damp factor to velocity
      pos.add(vel);
      dead();
      drawHealth();
    }
  }
  
  void move(PVector acc) { //allows character to move by adding acceleration
    vel.add(acc);
  }
  
  boolean collision(Character other) { //checks for collision between current and other character
    if(abs(pos.x - other.pos.x) < (dim.x/8 + other.dim.x)
       && abs(other.pos.y - pos.y) < (dim.y/8 + other.dim.y)) {
         return true;
    }
    return false;
  }
    
  void dead() { //updates character's health if it's 0
    if(currentHealth == 0) {
      isAlive = false;
    }
  }
  
   void drawMe() { //placeholder method to draw character
    fill(255, 0, 0);
    ellipse(width/2+dim.x/2, height/2+dim.y/2, dim.x, dim.y);
  }
  
  void attack() { //placeholder method to attack other character
  }
  
  void drawHealth() { //placeholder method to draw character's health bar
  }
}
