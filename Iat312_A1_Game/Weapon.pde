//Weapon subclass
class Weapon extends Object {
  
  Weapon(PVector pos) { //constructor
    super(pos);
    dim = new PVector(50, 50);
    img = new PImage[5];
    for(int i = 0; i < img.length; i++) { 
      img[i] = loadImage("data/object/weapon" + i + ".png");
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
  
  void collected() { //to track how many weapons collected 
    if (collision(player)) { //if collides with player then
      weaponCount++; //increase weapons
      if (weaponTimerRunning == true) {
        weaponTimerRemaining = 10;
      }
      else {
        weaponTimerRunning = true;
      }
      drawRemainingTime = true;
      playSound(OBJECT);
      println("weapon: ", weaponCount); //show the weapons collected to players
      weapons.remove(this); //remove item when collected
    }
  }
}
