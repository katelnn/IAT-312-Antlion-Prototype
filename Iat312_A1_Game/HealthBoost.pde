//Heart subclass
class Heart extends Object {
  
  int incrHealth = 5; //incr 5 health pts when picked up
  boolean collected = false; //boolean to see if picked up or not
  
  Heart(PVector pos) { //constructor
    super(pos);
    dim = new PVector(50, 50);
    for (int i = 0; i < img.length; i++) {
      img[i] = loadImage("data/object/heart" + i + ".png");
    }
    activeImgSeq = img;
  }
  
  void update() {
    addHealth();
    if(collected == false) drawMe();
  }
   
  boolean collideItem(Character other) { //check if heart is close to player
    return (abs(pos.x - other.pos.x) < (dim.x/2 + other.dim.x/2)
         && abs(other.pos.y - pos.y) < (dim.y/2 + other.dim.y/2));
  }
  
  void addHealth() { //adding health to the player 
    if(collideItem(player) && collected == false) {
      remainingTime = remainingTime + 30;
      println(timerDuration);
      playSound(OBJECT);
      
      collected = true;
      timeAdded = true;
      timeAddedTimer = 120;
    }
  }
  
  void drawMe() { //draw the object
    pushMatrix();
    translate(-player.pos.x + width/2 + pos.x, 
     -player.pos.y + height/2 + pos.y);

    image(activeImgSeq[currFrames], -dim.x/2, -dim.y/2, dim.x, dim.y); //images frames for heart drawing
    popMatrix();
    move();
  }
  
}
