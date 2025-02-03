//Setup for sound effects
import ddf.minim.*; //import Minim sound library

Minim minim;
AudioPlayer newLevel, object, winning, attack, backgroundMusic, spotted; //declare AudioPlayer objects

final String LEVEL = "data/sound/nextLvl.mp3"; //constants to store sound file paths
final String OBJECT = "data/sound/pickedUp.mp3";
final String ATTACK = "data/sound/attack.mp3"; 
final String WINNING = "data/sound/win.mp3";
final String BACKGROUND = "data/sound/background.mp3";
final String SPOTTED = "data/sound/spotted.mp3";

void loadSound() { //load sound files
  minim = new Minim(this);
  
  backgroundMusic = minim.loadFile(BACKGROUND);
  newLevel = minim.loadFile(LEVEL);
  object = minim.loadFile(OBJECT);
  attack = minim.loadFile(ATTACK);
  winning = minim.loadFile(WINNING);
  spotted = minim.loadFile(SPOTTED);
  
}


void playSound(String file) { //play sounds based on specific variable
  AudioPlayer sound = null;
  switch(file) {
    case LEVEL:
      sound = newLevel;
      break;
    case OBJECT: 
      sound = object;
      break;
    case ATTACK:
      sound = attack;
      break;
    case WINNING:
      sound = winning;
      break;
    default: 
  }

  sound.play(0);
}
