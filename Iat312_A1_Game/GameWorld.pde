//Setting up different environment for each level

static final int LAND_TILE = 00;
static final int GRASS_TILE = 1; 
static final int GRASS_TILE1 = 2; 
static final int GRASS_TILE2 = 3; 
static final int GRASS_TILE3 = 4; 
static final int GRASS_TILE4 = 5; 
static final int GRASS_TILE5 = 6; 
static final int GRASS_TILE6 = 7; 
static final int GRASS_TILE7 = 8; 
static final int GRASS_TILE8 = 9; 
static final int GRASS_TILE9 = 10; 
static final int GRASS_TILE10 = 11; 
static final int GRASS_TILE11 = 12; 
static final int GRASS_TILE12 = 13; 
static final int GRASS_TILE13 = 14; 
static final int GRASS_TILE14 = 15; 
static final int GRASS_TILE15 = 16; 
static final int GRASS_TILE16 = 17; 
static final int GRASS_TILE17 = 18; 
static final int GRASS_TILE18 = 19; 
static final int GRASS_TILE19 = 20; 
static final int GRASS_TILE20 = 21; 
static final int GRASS_TILE21 = 22; 
static final int GRASS_TILE22 = 23; 
static final int GRASS_TILE23 = 24; 
static final int GRASS_TILE24 = 25; 
static final int GRASS_TILE25 = 26; 
static final int GRASS_TILE26 = 27; 
static final int DOOR_TILE = 28; 



static final int DOOR_TILE2 = -5;
static final int CELL_TILE2 = -3;
static final int TREE_TILE = -4;
static final int LAKE_TILE = -15;  
static final int BUSH_TILE1 = -6; //bottom bush
static final int BUSH_TILE2 = -7; //top bush
static final int HOUSE_TILE = -8;
static final int WATER_TILE = -9;

//lvl1
int[][] map1 =  //45 cols, 19 rows, 45x19=855  
{      //01  02  03  04  05  06  07  08  09  10  11  12  13  14  15  16  17  18  19  20  21  22  23  24  25  26  27  28  29  30  31  32  33  34 
 /*01*/ {05, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01,  9, 00, 00, 00, 10, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 06},
 /*02*/ {04, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 28, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 02},
 /*03*/ {04, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 02},
 /*04*/ {04, 00, 00, 00, 21, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 22, 00, 00, 00, 20, 00, 00, 00, 00, 00, 00, 18, 15, 15, 22, 00, 00, 00, 02},
 /*05*/ {04, 00, 00, 00, 16, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 16, 00, 00, 00, 16, 00, 00, 00, 00, 00, 00, 00, 00, 00, 16, 00, 00, 00, 02},
 /*06*/ {04, 00, 00, 00, 16, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 16, 00, 00, 00, 16, 00, 00, 00, 00, 00, 00, 00, 00, 00, 16, 00, 00, 00, 02},
 /*07*/ {04, 00, 00, 00, 16, 00, 00, 21, 15, 15, 15, 22, 00, 00, 00, 19, 00, 00, 00, 23, 15, 15, 15, 15, 22, 00, 00, 00, 00, 16, 00, 00, 00, 02},
 /*08*/ {04, 00, 00, 00, 16, 00, 00, 16, 00, 00, 00, 16, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 16, 00, 00, 00, 00, 16, 00, 00, 00, 02},
 /*09*/ {04, 00, 00, 00, 16, 00, 00, 16, 00, 00, 00, 16, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 16, 00, 00, 00, 00, 16, 00, 00, 00, 02},
 /*10*/ {04, 00, 00, 00, 16, 00, 00, 16, 00, 00, 00, 16, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 16, 00, 00, 00, 00, 16, 00, 00, 00, 02},
 /*11*/ {04, 00, 00, 00, 16, 00, 00, 16, 00, 00, 00, 25, 15, 15, 15, 15, 15, 15, 15, 27, 15, 15, 15, 15, 24, 00, 00, 00, 00, 16, 00, 00, 00, 02},
 /*12*/ {04, 00, 00, 00, 16, 00, 00, 16, 00, 00, 00, 16, 00, 00, 00, 00, 00, 00, 00, 16, 00, 00, 00, 00, 00, 00, 00, 00, 00, 16, 00, 00, 00, 02},
 /*13*/ {04, 00, 00, 00, 16, 00, 00, 16, 00, 00, 00, 16, 00, 00, 00, 00, 00, 00, 00, 16, 00, 00, 00, 00, 00, 00, 00, 00, 00, 16, 00, 00, 00, 02},
 /*14*/ {04, 00, 00, 00, 16, 00, 00, 16, 00, 00, 00, 16, 00, 00, 00, 00, 00, 00, 00, 16, 00, 00, 00, 00, 00, 00, 00, 00, 00, 16, 00, 00, 00, 02},
 /*15*/ {04, 00, 00, 00, 16, 00, 00, 16, 00, 00, 00, 16, 00, 00, 00, 00, 00, 00, 00, 16, 00, 00, 00, 00, 00, 00, 00, 00, 00, 16, 00, 00, 00, 02},
 /*16*/ {04, 00, 00, 00, 16, 00, 00, 16, 00, 00, 00, 16, 00, 00, 00, 00, 00, 00, 00, 23, 15, 15, 15, 15, 15, 15, 15, 15, 15, 26, 00, 00, 00, 02},
 /*17*/ {04, 00, 00, 00, 16, 00, 00, 16, 00, 00, 00, 16, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 16, 00, 00, 00, 02},
 /*18*/ {04, 00, 00, 00, 16, 00, 00, 16, 00, 00, 00, 16, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 16, 00, 00, 00, 02},
 /*19*/ {04, 00, 00, 00, 16, 00, 00, 16, 00, 00, 00, 16, 00, 00, 00, 00, 00, 00, 00, 18, 15, 15, 15, 15, 15, 15, 15, 15, 15, 24, 00, 00, 00, 02},
 /*20*/ {04, 00, 00, 00, 16, 00, 00, 16, 00, 00, 00, 16, 00, 00, 00, 20, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 02},
 /*21*/ {04, 00, 00, 00, 16, 00, 00, 16, 00, 00, 00, 16, 00, 00, 00, 16, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 02},
 /*22*/ {04, 00, 00, 00, 16, 00, 00, 16, 00, 00, 00, 16, 00, 00, 00, 16, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 02},
 /*23*/ {04, 00, 00, 00, 19, 00, 00, 19, 00, 00, 00, 19, 00, 00, 00, 23, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 17, 00, 00, 00, 02},
 /*24*/ {04, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 02},
 /*25*/ {04, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 02},
 /*26*/ {04, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 02},
 /*27*/ {04, 00, 00, 00, 00, 00, 00, 18, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 22, 00, 00, 00, 02},
 /*28*/ {04, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 16, 00, 00, 00, 02},
 /*29*/ {04, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 16, 00, 00, 00, 02},
 /*30*/ {13, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 17, 00, 00, 00, 23, 15, 15, 15, 14},
 /*31*/ {04, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 02},
 /*32*/ {04, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 02},
 /*33*/ {04, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 02},
 /*34*/ { 8, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 11, 00, 00, 00, 12, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 07},
};

//lvl 2
int[][] map2 =  //30 cols, 29 rows, 30x29=928
{
  {7, 7, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4},
  {1, 1, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4},
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 7, 7, 8, 7, 8, 7, 7, 8, 7, 7, 7, 7, 0, 0, 0, 4},
  {1, 1, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 4},
  {6, 6, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 4},
  {4, 4, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 1, 1, 6, 6, 6, 6, 6, 6, 6, 6, 6, 1, 1, 1, 0, 0, 0, 4},
  {4, 4, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 7, 0, 0, 4},
  {4, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 1, 1, 0, 0, 5, 5, 5, 5, 5, 0, 0, 1, 1, 1, 1, 0, 0, 4},
  {4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 9, 9, 9, 9, 9, 0, 0, 0, 1, 1, 1, 0, 0, 4},
  {4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 9, 9, 9, 9, 9, 0, 0, 0, 1, 1, 1, 0, 0, 4},
  {4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 1, 1, 0, 0, 0, 4},
  {4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 4},
  {4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 7, 7, 7, 8, 7, 8, 7, 7, 7, 1, 1, 1, 7, 0, 0, 4},
  {4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 4},
  {4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 4},
  {4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 6, 6, 6, 6, 6, 6, 6, 6, 6, 1, 1, 1, 1, 0, 0, 4},
  {4, 0, 0, 0, 0, 0, 0, 0, 0, 7, 7, 7, 1, 1, 7, 7, 7, 0, 0, 0, 0, 0, 0, 6, 6, 6, 6, 0, 0, 4},
  {4, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4},
  {4, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4},
  {4, 5, 5, 5, 5, 5, 5, 5, 5, 1, 1, 1, 1, 1, 1, 1, 1, 5, 5, 5, 5, 5, 5, 5, 0, 0, 4, 4, 4, 4},
  {4, 9, 9, 9, 9, 9, 9, 9, 9, 3, 3, 3, 3, 3, 3, 3, 3, 9, 9, 9, 9, 9, 9, 9, 0, 4, 4, 4, 4, 4},
  {4, 9, 9, 9, 9, 9, 9, 9, 9, 1, 1, 1, 1, 1, 1, 1, 1, 9, 9, 9, 9, 9, 9, 9, 0, 0, 4, 4, 4, 4},
  {4, 9, 9, 9, 9, 9, 9, 9, 9, 1, 1, 1, 1, 1, 1, 1, 1, 9, 9, 9, 9, 9, 9, 9, 0, 0, 0, 4, 4, 4},
  {4, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 7, 0, 4},
  {4, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 7, 8, 7, 8, 7, 8, 7, 8, 7, 1, 1, 0, 4},
  {4, 4, 0, 0, 0, 0, 0, 0, 0, 6, 6, 6, 6, 6, 6, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 4},
  {4, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 1, 1, 0, 4},
  {4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 6, 6, 4, 4},
  {4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4}
};

//lvl3
int[][] map3 = //45 cols, 26 rows, 45x26=1170
{
  
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 4, 4, 4, 4, 8, 4, 8, 4, 8, 4, 8, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 0, 0, 0, 0, 0},
  {0, 4, 4, 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0},
  {7, 7, 7, 7, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 4, 4, 4, 4},
  {5, 5, 5, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9, 9, 9, 9, 9, 9, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 4, 4, 4, 4},
  {9, 9, 9, 9, 5, 5, 5, 1, 1, 1, 1, 1, 1, 5, 5, 5, 1, 1, 1, 9, 9, 9, 9, 9, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 4, 4, 4, 4},
  {9, 9, 9, 9, 9, 9, 9, 5, 5, 1, 1, 5, 5, 9, 9, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 4, 4, 4, 4},
  {9, 9, 9, 9, 9, 9, 9, 9, 9, 1, 1, 9, 9, 9, 9, 9, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 4, 4, 4, 4},
  {9, 9, 9, 9, 9, 9, 9, 9, 9, 1, 1, 9, 9, 9, 9, 9, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 4, 4, 4, 4},
  {9, 9, 9, 9, 9, 9, 9, 9, 9, 1, 1, 9, 9, 9, 9, 9, 9, 5, 5, 5, 5, 5, 5, 5, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 4, 4, 4, 4},
  {9, 9, 9, 9, 9, 9, 9, 9, 9, 1, 1, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 4, 4, 4, 4},
  {9, 9, 9, 9, 9, 9, 9, 9, 9, 1, 1, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 4, 4, 4, 4},
  {9, 9, 9, 9, 9, 9, 9, 9, 9, 1, 1, 6, 6, 6, 6, 6, 9, 9, 9, 9, 9, 9, 9, 9, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 4, 4, 4, 4},
  {9, 9, 9, 9, 9, 9, 9, 9, 9, 1, 1, 6, 6, 6, 6, 6, 6, 9, 9, 9, 9, 9, 6, 6, 6, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 5, 5, 5, 5, 5},
  {9, 9, 9, 9, 9, 9, 9, 9, 9, 1, 1, 0, 0, 0, 0, 0, 0, 6, 6, 6, 6, 6, 4, 4, 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9, 9, 9, 9, 9},
  {9, 9, 9, 9, 9, 9, 9, 9, 9, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 4, 6, 6, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9, 9, 9, 9, 9},
  {9, 9, 9, 9, 9, 9, 9, 9, 9, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 4, 0, 0, 6, 6, 6, 6, 6, 6, 6, 1, 1, 1, 1, 1, 1, 9, 9, 9, 9, 9},
  {9, 9, 9, 9, 9, 9, 9, 9, 9, 1, 1, 4, 4, 8, 4, 8, 4, 8, 4, 8, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4},
  {9, 9, 9, 9, 9, 9, 9, 9, 9, 1, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 4, 4, 4, 4, 4},
  {7, 7, 9, 9, 9, 9, 9, 9, 9, 1, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 4, 4, 4, 4, 4},
  {1, 1, 7, 7, 7, 7, 7, 7, 7, 1, 1, 4, 4, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 5, 5, 0, 0, 1, 1, 1, 1, 1, 1, 4, 4, 4, 4, 4},
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 4, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 9, 9, 9, 9, 0, 0, 1, 1, 1, 1, 1, 1, 4, 4, 4, 4, 4},
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 4, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 9, 9, 9, 9, 0, 0, 1, 1, 1, 1, 1, 1, 4, 4, 4, 4, 4},
  {1, 1, 5, 5, 5, 5, 5, 5, 5, 5, 5, 4, 4, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 6, 6, 6, 6, 6, 0, 0, 0, 0, 0},
  {5, 5, 9, 9, 9, 9, 9, 9, 9, 9, 9, 4, 4, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
  
};


void generateMap(int[][] map) { //generating the map with its corresponding tiles
  
  boolean block; //boolean for blocked tiles or not
  
  for (int i = 0; i < map.length; i++) {
    for (int j = 0; j < map[i].length; j++) {
      String path = "data/tile/tile" + map[i][j] + ".png"; //loop through each tiles
      if (i != 0 && j !=0 && i != map.length - 1 && j != map[i].length - 1) {
        switch(map[i][j]) {
          case LAND_TILE:
            block = false; //can walk thru
            tiles.add(new Tile(path, new PVector(j * tileSize, i * tileSize), block));
            break;
          case GRASS_TILE: 
            block = true; //cant walk thru
            tiles.add(new Tile(path, new PVector(j * tileSize, i * tileSize), block));
            break;
          case GRASS_TILE1: 
            block = true; //cant walk thru
            tiles.add(new Tile(path, new PVector(j * tileSize, i * tileSize), block));
            break;
          case GRASS_TILE2: 
            block = true; //cant walk thru
            tiles.add(new Tile(path, new PVector(j * tileSize, i * tileSize), block));
            break;
          case GRASS_TILE3: 
            block = true; //cant walk thru
            tiles.add(new Tile(path, new PVector(j * tileSize, i * tileSize), block));
            break;
          case GRASS_TILE4: 
            block = true; //cant walk thru
            tiles.add(new Tile(path, new PVector(j * tileSize, i * tileSize), block));
            break;
          case GRASS_TILE5: 
            block = true; //cant walk thru
            tiles.add(new Tile(path, new PVector(j * tileSize, i * tileSize), block));
            break;
          case GRASS_TILE6: 
            block = true; //cant walk thru
            tiles.add(new Tile(path, new PVector(j * tileSize, i * tileSize), block));
            break;
          case GRASS_TILE7: 
            block = true; //cant walk thru
            tiles.add(new Tile(path, new PVector(j * tileSize, i * tileSize), block));
          case GRASS_TILE8: 
            block = true; //cant walk thru
            tiles.add(new Tile(path, new PVector(j * tileSize, i * tileSize), block));
            break;
          case GRASS_TILE9: 
            block = true; //cant walk thru
            tiles.add(new Tile(path, new PVector(j * tileSize, i * tileSize), block));
            break;
          case GRASS_TILE10: 
            block = true; //cant walk thru
            tiles.add(new Tile(path, new PVector(j * tileSize, i * tileSize), block));
            break;
          case GRASS_TILE11: 
            block = true; //cant walk thru
            tiles.add(new Tile(path, new PVector(j * tileSize, i * tileSize), block));
            break;
          case GRASS_TILE12: 
            block = true; //cant walk thru
            tiles.add(new Tile(path, new PVector(j * tileSize, i * tileSize), block));
            break;
          case GRASS_TILE13: 
            block = true; //cant walk thru
            tiles.add(new Tile(path, new PVector(j * tileSize, i * tileSize), block));
          case GRASS_TILE14: 
            block = true; //cant walk thru
            tiles.add(new Tile(path, new PVector(j * tileSize, i * tileSize), block));
            break;
          case GRASS_TILE15: 
            block = true; //cant walk thru
            tiles.add(new Tile(path, new PVector(j * tileSize, i * tileSize), block));
          case GRASS_TILE16: 
            block = true; //cant walk thru
            tiles.add(new Tile(path, new PVector(j * tileSize, i * tileSize), block));
            break;
          case GRASS_TILE17: 
            block = true; //cant walk thru
            tiles.add(new Tile(path, new PVector(j * tileSize, i * tileSize), block));
            break;
          case GRASS_TILE18: 
            block = true; //cant walk thru
            tiles.add(new Tile(path, new PVector(j * tileSize, i * tileSize), block));
            break;
          case GRASS_TILE19: 
            block = true; //cant walk thru
            tiles.add(new Tile(path, new PVector(j * tileSize, i * tileSize), block));
          case GRASS_TILE20: 
            block = true; //cant walk thru
            tiles.add(new Tile(path, new PVector(j * tileSize, i * tileSize), block));
            break;
          case GRASS_TILE21: 
            block = true; //cant walk thru
            tiles.add(new Tile(path, new PVector(j * tileSize, i * tileSize), block));
          case GRASS_TILE22: 
            block = true; //cant walk thru
            tiles.add(new Tile(path, new PVector(j * tileSize, i * tileSize), block));
            break;
          case GRASS_TILE23: 
            block = true; //cant walk thru
            tiles.add(new Tile(path, new PVector(j * tileSize, i * tileSize), block));
            break;
          case GRASS_TILE24: 
            block = true; //cant walk thru
            tiles.add(new Tile(path, new PVector(j * tileSize, i * tileSize), block));
            break;
          case GRASS_TILE25: 
            block = true; //cant walk thru
            tiles.add(new Tile(path, new PVector(j * tileSize, i * tileSize), block));
          case GRASS_TILE26: 
            block = true; //cant walk thru
            tiles.add(new Tile(path, new PVector(j * tileSize, i * tileSize), block));
            break;
          case TREE_TILE:
            block = true; //cant walk thru
            tiles.add(new Tile(path, new PVector(j * tileSize, i * tileSize), block));
            break;
          case BUSH_TILE1:
            block = true; //cant walk thru
            tiles.add(new Tile(path, new PVector(j * tileSize, i * tileSize), block));
            break;
          case BUSH_TILE2:
            block = true; //cant walk thru
            tiles.add(new Tile(path, new PVector(j * tileSize, i * tileSize), block));
            break;
          case LAKE_TILE:
            block = true; //cant walk thru
            tiles.add(new Tile(path, new PVector(j * tileSize, i * tileSize), block));
            break;
          case WATER_TILE:
            block = true; //cant walk thru
            tiles.add(new Tile(path, new PVector(j * tileSize, i * tileSize), block));
            break;
          case DOOR_TILE:
            block = false; //can walk thru
            tiles.add(new Door(path, new PVector(j * tileSize, i * tileSize), block));
            break;
          case HOUSE_TILE:
            block = true; //cant walk thru
            tiles.add(new Tile(path, new PVector(j * tileSize, i * tileSize), block));
            break;
          case CELL_TILE2:
            block = true; //cant walk thru
            tiles.add(new Gate(path, new PVector(j * tileSize, i * tileSize), block));
            break;
          default:
            break; 
        }
      } 
      else {
        block = true;
        tiles.add(new Tile(path, new PVector(j * tileSize, i * tileSize), block));
      }
    }
  }
}


  
