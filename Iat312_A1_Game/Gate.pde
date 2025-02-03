//Gate subclass
class Gate extends Tile { 
    
  Gate(String path, PVector pos, boolean block) { //constructor
    super(path, pos, block);
  }
  
  void checkEnemies() { //check if all enemies are killed
    if(enemies.size() <= 0 ) { 
      block = false;
      img = loadImage("data/tile/tile" + LAND_TILE + ".png"); //if yes then replace gate tile w/ land tile 
    }
  }
}
