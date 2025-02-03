import controlP5.*; //import ControlP5 library & declare button variables
ControlP5 cP5;
Button start;
Button restart;
Button instructionPlay;
Button menu;

PFont font;

int gameState = 0; //constants for each game states
final int INTRO2 = -2;
final int INSTRUCTION = -1; 
final int INTRO = 0;
final int LEVEL1 = 1;
final int LEVEL2 = 2;
final int LEVEL3 = 3;
final int LEVEL4 = 4;
final int WIN = 5;
final int LOSE = 6;


int playerLvl1 = 1222; //level 1 elements, setting initial positions for
int[] weaponLvl1 = {509 + (38 * 3) + 2, 131 + (38*2), 900 - 27 - (38 * 2)};  //Leaf powerup
int[] presentLvl1 = {120, 125, 127, 129, 120 + (38*2),
                     136, 136 - (38*2) + 5, 136 + (38*2),
                     510, 511, 510 - 38 - 1, 511 - 38 - 1, 511 + (38 * 3) + 2,  513 + (38 * 3) + 2,  515 + (38 * 3) + 2,
                     900, 900 + 2, 900 + 4,
                     949 + (38 * 2), 949 + (38 * 2) + 2,
                     1139, 1139 + 2, 1139 + 4}; //Objective items
int[] heartLvl1 = {453, 949 + (38 * 2) + 6};
//int[] enemyLvl1 = {592 - (45 * 8), 242, 716}; 
int[] enemyLvl1 = {1001, 36, 269 + 39, 201}; 
//int[] bossLvl1 = {98 + (45 *1)};
//int[] bossLvl1 = {98 + (45 * 1)};
int [] bossLvl1 = {70, 183, 466};
int[] objectiveLvl1 = {500, 180}; //Two stars are rewarded based on points gathered and time survived, Score is 1st and time is 2nd


int playerLvl2 = 62; //same with level 2
int[] weaponLvl2 = {1000, 1000, 522, 523};
int[] presentLvl2 = {407, 409, 672, 674}; 
int[] heartLvl2 = {273, 444, 671, 673}; 
int[] enemyLvl2 = {107, 109, 112, 266, 475, 276, 550, 552, 554}; 


int playerLvl3 = 992; //same with level 3, but added boss position
int[] weaponLvl3 = {684, 730, 617, 615, 613};
int[] presentLvl3 = {336, 145, 489, 890, 892}; 
int[] heartLvl3 = {243, 477, 480, 483};
int[] enemyLvl3 = {187, 189, 191, 195, 399, 443, 533, 579};


boolean setup1 = false; //boolean variables to keep track & control setup actions 
boolean setup2 = false;
boolean setup3 = false;
boolean setup4 = false;
boolean setupIntro = false;
boolean setupWin = false;
boolean setupLose = false;
boolean setupinstruction = false;

//initializing other elements
boolean doorText = false;     //boolean to see door is locked or not   
int speed = 5;                //player's speed
int movingPos = 0;            //character's initial movement direction
int presentCount = 0;         //to keep track of presents collected
int presentAllowed = 0;       //to set the amount of presents required to go to next level
int weaponCount = 0;          //to keep track of weapons collected
int tileSize = 105;           //dimension of the tiles

int weaponTimerCountdown = 10; // Timer duration in seconds
int weaponTimerRemaining = weaponTimerCountdown; // Current remaining time
int lastWeaponTimerMillis = 0; // Track the last update time
boolean weaponTimerRunning = false; // To control when the countdown runs

color presentColor = color(47, 82, 39); //setting up colors for each element 
color foodColor = color(246, 209, 132); //setting up colors for each element 
color textColor = color(45, 84, 46);
color healthColor = color(191, 54, 12);
color bulletColor = color(255, 91, 85);


ArrayList<Tile> tiles = new ArrayList<Tile>(); //setting up arraylists for each element 
ArrayList<Object> presents = new ArrayList<Object>();
ArrayList<Object> hearts = new ArrayList<Object>();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<Object> weapons = new ArrayList<Object>();
Character player;

 float obstacleX = 400; // Obstacle position
  float obstacleY = 150;
  float obstacleW = 100; // Obstacle size
  float obstacleH = 100;

void setup() {
  size(1000, 650);
  font = createFont("data/Jersey10-Regular.ttf", 200);
  textFont(font);
  
  //Adding in buttons and their positions
  cP5 = new ControlP5(this);
  start = cP5.addButton("start", 0, width/2-75, height/2, 150, 50);
  cP5.getController("start").hide();
  
  instructionPlay = cP5.addButton("how to play", 0, width/2-75, height/2 + 100, 150, 50);
  cP5.getController("how to play").hide();
  
  menu = cP5.addButton("menu", 0, width/2-75, height/2 + 250, 150, 50);
  cP5.getController("menu").hide();
  
  restart = cP5.addButton("restart", 0, 390, height - 200, 150, 50);
  cP5.getController("restart").hide();
  
  styleButtons();
  loadSound();
  backgroundMusic.play();
  backgroundMusic.loop();
}

void draw() {
  background(90);
  
  //States for each gameplay
  switch (gameState) {
    case INTRO: 
      lose = false;
      completedLevel = false;
      initializeParameters(); 
      checkHoveredState();
      intro();
      break;
    case INTRO2: 
      intro2();
      checkHoveredState();
      break;
    case LEVEL1:
      presentAllowed = 15; 
      level1();
      break;
    case LEVEL2:
      level2();
      break;
    case LEVEL3:
    case WIN:
      win();
      break;
    case LOSE:
      lose();
      break;
    case INSTRUCTION:
      instruction();
      break;
    default:
      intro();
  }
}

void initializeParameters() {
  doorText = false;     //boolean to see door is locked or not   
  speed = 5;                //player's speed
  movingPos = 0;            //character's initial movement direction
  presentCount = 0;         //to keep track of presents collected
  presentAllowed = 0;       //to set the amount of presents required to go to next level
  weaponCount = 0;          //to keep track of weapons collected
  tileSize = 105;           //dimension of the tiles
  weaponTimerCountdown = 10; // Timer duration in seconds
  weaponTimerRemaining = weaponTimerCountdown; // Current remaining time
  lastWeaponTimerMillis = 0; // Track the last update time
  weaponTimerRunning = false; // To control when the countdown runs
  timerDuration = 3 * 60; // 5 minutes in seconds
  remainingTime = timerDuration;
  timeAdded = false;
  timeAddedTimer = 120;
  isRunning = false;
  lastMillis = 0;
  timerStarted = false;
  spotted.rewind();
}



//void setup() {
//  size(1000, 650);
  
//  //Adding in buttons and their positions
//  cP5 = new ControlP5(this);
//  start = cP5.addButton("start", 0, width/2 + 250, height - 450, 150, 50);
//  cP5.getController("start").hide();
  
//  instructionPlay = cP5.addButton("how to play", 0, width/2 + 250, height - 350, 150, 50);
//  cP5.getController("how to play").hide();
  
//  menu = cP5.addButton("menu", 0, 25, 50, 150, 50);
//  cP5.getController("menu").hide();
  
//  restart = cP5.addButton("restart", 0, 390, height - 200, 150, 50);
//  cP5.getController("restart").hide();
  
//  styleButtons();
//  loadSound();

//}

//void draw() {
//  background(90);
  
//  //States for each gameplay
//  switch (gameState) {
//    case INTRO: 
//      intro();
//      break;
//    case LEVEL1:
//      level1();
//      presentAllowed = 1; 
//      break;
//    case LEVEL2:
//      level2();
//      presentAllowed = 5;
//      break;
//    case LEVEL3:
//      level3();
//      presentAllowed = 10;
//      break;
//    case WIN:
//      win();
//      break;
//    case LOSE:
//      lose();
//      break;
//    case INSTRUCTION:
//      instruction();
//      break;
//    default:
//      intro();
//  }
//}
