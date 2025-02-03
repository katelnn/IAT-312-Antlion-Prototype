//Objects class
class Object { //similar to enemy class
  PVector pos, dim;
  
  PImage[] img; 
  PImage[] activeImgSeq;
  int currFrames = 0;
  
  Object(PVector pos) { //constructor
    this.pos = pos;
    dim = new PVector(25, 25);
    img = new PImage[2];
  }

  void update() { //overrides
  }
  
  void drawMe() { //overrides
    rect(pos.x, pos.y, dim.x, dim.y);
  }

  boolean collision(Character other) { //check for collision of object and other character
    if(abs(pos.x - other.pos.x) < (dim.x/2 + other.dim.x/2)
         && abs(other.pos.y - pos.y) < (dim.y/2 + other.dim.y/2)) {;
         return true;
    }
    return false;
  }
  
  void move() { //animating the object
    if (frameCount % 4 == 0 ) { //check if 4 frames passed since last animation
      currFrames++;
      
      if (currFrames == img.length) { //if animation reach the end of frame, reset frame
        currFrames = 0;
      }
    }
  }
  
}
