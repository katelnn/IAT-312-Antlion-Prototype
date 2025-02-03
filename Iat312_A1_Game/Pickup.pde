//Present subclass
class Present extends Object {
  
  Present(PVector pos) { //constructor
    super(pos);
    dim = new PVector(100, 100);
    img = new PImage[2];
    
    for(int i = 0; i < img.length; i++) {
      img[i] = loadImage("data/object/thing" + i + ".png");
      img[i].resize((int) dim.x, (int) dim.y);
    }
    activeImgSeq = img;
  }
  
  void update() {
    drawMe();
    collected();
  }

  void drawMe() {
    pushMatrix();
    translate(-player.pos.x + width/2 + pos.x, -player.pos.y + height/2 + pos.y);
    image(activeImgSeq[currFrames], -dim.x/2, -dim.y/2);
    popMatrix();
    move();
  }
  
  void collected() { //to track how many presents collected
    if (collision(player)) { //if collides with player then
      presentCount++; //increase presents
       println("present: ", presentCount); //show the presents collected to players
      playSound(OBJECT);
      presents.remove(this); //remove item when collected
    }
  }
  
}
