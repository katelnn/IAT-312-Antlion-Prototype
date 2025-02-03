//Projectile superclass
class Projectile {
  PVector pos, vel, dim;
  boolean isAlive;
  color projColor; 
  float angle = 0; 
  int direction = 0; //-1 left, 1 right
  
  
  Projectile(PVector pos, PVector vel, color projColor, float angle) { //constructor
    this.pos = pos;
    this.vel = vel;
    this.angle = angle;
    this.projColor = projColor;
    dim = new PVector(8, 5);
    isAlive = true;
  }
  
  void move() { //movement of projectile
    PVector vel2 = PVector.fromAngle(angle); //movements towards an angle (player)
    vel2.mult(vel.x);
    pos.add(vel2);
  }
  
  void update() {
    move();
    drawProjectile();
  }

  void drawProjectile() { //draw the projectile as small ellipses
    pushMatrix();
    translate(-player.pos.x + width/2 + pos.x, -player.pos.y + height/2 + pos.y);
    fill(projColor);
    ellipse(0, 0, dim.x, dim.y);
    popMatrix();
  }
  
  boolean hit(Character character) { //check if bullet hit character
    if(abs(pos.x - character.pos.x) < dim.x/2 + character.dim.x/2 
        && abs(pos.y - character.pos.y) < dim.y/2 + character.dim.y/2
        && isAlive) {
       isAlive = false;
       return true;
    }
    return false;
  }
}
