#line 1 "E:/University of New Haven/Semester 2/Embedded Systems/Project 3/3C/Objective 2/Objective2.c"
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
#line 3 "E:/University of New Haven/Semester 2/Embedded Systems/Project 3/3C/Objective 2/Objective2.c"
sbit TFT_BLED at GPIOE_ODR.B9;
sbit TFT_CS at GPIOE_ODR.B15;
unsigned int TFT_DataPort at GPIOE_ODR;
sbit TFT_RD at GPIOE_ODR.B10;
sbit TFT_RS at GPIOE_ODR.B12;
sbit TFT_RST at GPIOE_ODR.B8;
sbit TFT_WR at GPIOE_ODR.B11;

short int level;
short int lives;

void main(){
 level = 1;
 lives = 3;
 score = 0;
 NormalOperation:
 delay_ms(10);
 InitializeHardware();
 PinInitialize();
 ExternalIntConfiguration();
 AdcConfiguration();
 PlayScreen();
 delay_ms(10);
 Timer3Configuration();
 Timer1Configuration();

 for(;;){
#line 37 "E:/University of New Haven/Semester 2/Embedded Systems/Project 3/3C/Objective 2/Objective2.c"
 if(Car1.x1 < Frog.x2 && Car1.x2 > Frog.x1 && Car1.y1 < Frog.y2 && Car1.y2 > Frog.y1 || Car2.x1 < Frog.x2 && Car2.x2 > Frog.x1 && Car2.y1 < Frog.y2 && Car2.y2 > Frog.y1)
 {

 break;
 }
#line 49 "E:/University of New Haven/Semester 2/Embedded Systems/Project 3/3C/Objective 2/Objective2.c"
 if(Car3.x1 < Frog.x2 && Car3.x2 > Frog.x1 && Car3.y1 < Frog.y2 && Car3.y2 > Frog.y1 || Car4.x1 < Frog.x2 && Car4.x2 > Frog.x1 && Car4.y1 < Frog.y2 && Car4.y2 > Frog.y1)
 {

 break;
 }


 if(Frog.x1 >=  320 ){
 break;
 }


 if(timer == 0){
 break;
 }


 if(Frog.row == 2){
 if(level == 6){
 goto Finish;
 }
 else{
 NextLevelScreen();
 goto NormalOperation;
 }
 }
 }


 if(lives != 1){
 TIM3_CR1 = 0x0000;
 TIM1_CR1 = 0x0000;

 EXTI_IMR = (0 << 2) | (0 << 4) | (0 << 5) | (0 << 6) | (0 << 13);
 lives = lives -1;
 if(level < 2){
 score = 0;
 }
 else if(level == 2){
 score = 12;
 }
 else if(level == 3){
 score = 24;
 }
 else if(level == 4){
 score = 36;
 }
 else if(level == 5){
 score = 48;
 }
 else if(level == 6){
 score = 60;
 }
 delay_ms(100);
 goto NormalOperation;
 }

 else{
 GameOverScreen();
 level = 1;
 lives = 3;
 score = 0;
 for(;;){
 if (!GPIOC_IDR.B13){
 goto NormalOperation;
 }
 }
 }

 Finish:
 level = 1;
 GameFinishedScreen();
 for(;;){
 if (!GPIOC_IDR.B13){
 goto NormalOperation;
 }
 }
}
