//Door subclass
class Door extends Tile {
  
  Door(String path, PVector pos, boolean block) { //constructor
    super(path, pos, block);
  }

  void collideChar(Character other) { //check if character collides with door
    doorText = false; //initially door locked so far
    if (abs(pos.x - other.pos.x) < (tileSize/2 + other.dim.x/2 - 45) //if character is close enough and
         && abs(other.pos.y - pos.y) < (tileSize/2 + other.dim.y/2) - 70) {
           if (presentCount >= presentAllowed) { //if player have present necessary to enter
             playSound(LEVEL); //play sound effect
             tiles.clear(); //clear door tile 
             weaponCount--; //reset weapon count
             completedLevel = true;
           }
           else {
             doorText = true; //change boolean to door unlocked
           }
         }
  }
}
