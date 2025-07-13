#include "Hardware.h"
#include "PlayScreen.h"
#include "GameOverScreen.h"
#include "NextLevelScreen.h"
#include "GameFinishedScreen.h"

// Definitions
#define DISPLAY_X 320
#define DISPLAY_Y 240
#define GAME_ROWS 15
#define GRID_SIZE DISPLAY_Y/GAME_ROWS

// Defining objects in game
struct Object{
  int x1;
  int y1;
  int x2;
  int y2;
  int color;
  int direction;
  int row;
};

extern struct Object Frog;
extern struct Object Car1;
extern struct Object Car2;
extern struct Object Car3;
extern struct Object Car4;

extern short int timer; //game's running clock
extern short int level; //game's level
extern short int lives; //Number of nemaining lives
extern short int score; // Score of the game!