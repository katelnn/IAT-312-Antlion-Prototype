//Tile superclass
class Tile {
  PVector pos, diff, charDiff;
  PImage img; 
  boolean block; //blocked tiles or not
  
  Tile(String path, PVector pos, boolean block) { //constructor
    img = loadImage(path);
    this.pos = pos;
    this.block = block;
  }
  
  
 void collision(Character c) { //prevent player from walking through blocked tiles
    diff = PVector.sub(c.pos, pos);
    charDiff = new PVector(abs(diff.x), abs(diff.y));
    if (block && charDiff.x < c.dim.x/2 + img.width/2 - 5 && charDiff.y < c.dim.y/2 + img.height/2 - 5) {
        
      c.pos.x += diff.x*0.07;
      c.pos.y += diff.y*0.07;
      c.vel.mult(0.0);
    }
  }
  
  
  void bulletCollision(ArrayList<Projectile> bullets) { //remove bullets if hit a blocked tile
    for(int i = 0; i < bullets.size(); i++) {
      Projectile b = bullets.get(i);
      diff = PVector.sub(b.pos, pos);
      charDiff = new PVector(abs(diff.x), abs(diff.y));
      if (block && 
        charDiff.x < b.dim.x / 2 + img.width / 2 && 
        charDiff.y < b.dim.y / 2 + img.height / 2) {
          b.isAlive = false;
          bullets.remove(b);
        }
    }
  }
  
  
  boolean checkBorder() { //check if tile is out the screen
    if (charDiff.x < width && charDiff.y < height) {
      return true;
    }
    return false;
  }
  

  void drawMe(Character player) { //drawing the tile
    pushMatrix();
    translate( -player.pos.x + width/2 + pos.x, 
     -player.pos.y + height/2 + pos.y);

    scale(1.1, 1.1);
    image(img, -img.width/2, -img.height/2);
    popMatrix();
  }
  
  void collideChar(Character other) { //overrides
  } 
  
  void checkEnemies() { //overrides
  }
}
