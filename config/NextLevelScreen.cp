#line 1 "E:/University of New Haven/Semester 2/Embedded Systems/Project 3/3C/Objective 2/NextLevelScreen.c"
#line 1 "e:/university of new haven/semester 2/embedded systems/project 3/3c/objective 2/common.h"
#line 1 "e:/university of new haven/semester 2/embedded systems/project 3/3c/objective 2/hardware.h"
void InitializeHardware();
void PinInitialize();
void ExternalIntConfiguration();
void AdcConfiguration();
unsigned int getAdcReading();
void Timer3Configuration();
void Timer1Configuration();
#line 1 "e:/university of new haven/semester 2/embedded systems/project 3/3c/objective 2/playscreen.h"
void PlayScreen();
#line 1 "e:/university of new haven/semester 2/embedded systems/project 3/3c/objective 2/gameoverscreen.h"
void GameOverScreen();
#line 1 "e:/university of new haven/semester 2/embedded systems/project 3/3c/objective 2/nextlevelscreen.h"
void NextLevelScreen();
#line 1 "e:/university of new haven/semester 2/embedded systems/project 3/3c/objective 2/gamefinishedscreen.h"
void GameFinishedScreen();
#line 14 "e:/university of new haven/semester 2/embedded systems/project 3/3c/objective 2/common.h"
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

extern short int timer;
extern short int level;
extern short int lives;
extern short int score;
#line 3 "E:/University of New Haven/Semester 2/Embedded Systems/Project 3/3C/Objective 2/NextLevelScreen.c"
void NextLevelScreen(){
 TIM3_CR1 = 0x0000;
 TIM1_CR1 = 0x0000;

 EXTI_IMR = (0 << 2) | (0 << 4) | (0 << 5) | (0 << 6) | (0 << 13);
 TFT_Set_Brush(1, CL_OLIVE,0,0,0,0);
 TFT_Rectangle(0,0,  320 ,  240 );
 TFT_Write_Text("Level",  320  / 2 - 35,  240  / 2);
 level = level + 1;
 TFT_Write_Char(level+48,  320  / 2,  240  / 2);
 Sound_Play(100, 500);
 delay_ms(2000);
}
