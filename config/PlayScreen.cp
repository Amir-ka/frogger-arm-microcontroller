#line 1 "E:/University of New Haven/Semester 2/Embedded Systems/Project 3/3C/Objective 2/PlayScreen.c"
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
#line 3 "E:/University of New Haven/Semester 2/Embedded Systems/Project 3/3C/Objective 2/PlayScreen.c"
struct Object Frog;
struct Object Car1;
struct Object Car2;
struct Object Car3;
struct Object Car4;
struct Object log;
struct Object turtle;
struct Object truck;
int hy1;
short int score;
extern char score1;
extern char score0;

short int timer;
char timer1;
char timer0;
int counter = 0;
char counter2;
char counter1;
char counter0;

int RowColor[16] = {
 CL_SILVER,
 CL_SILVER,
 CL_GREEN,
 CL_GREEN,
 CL_BLUE,
 CL_BLUE,
 CL_BLUE,
 CL_BLUE,
 CL_BLUE,
 CL_GREEN,
 CL_BLACK,
 CL_BLACK,
 CL_BLACK,
 CL_BLACK,
 CL_GREEN,
};

void speedcal();
unsigned int adcVal;


void Timer1_IRQHandler() iv IVT_INT_TIM1_UP {
 TIM1_SR.UIF = 0;
 counter = counter + 1;


 TFT_Set_Brush(1, CL_SILVER,0,0,0,0);
 TFT_Rectangle(45, 240 / 15 *0, 65,  240 / 15 *1);
 if(timer > 0){
 timer = timer-1;
 }
 timer1 = timer/10 + 48;
 timer0 = timer%10 + 48;
 TFT_Write_Char(timer1,45, 0);
 TFT_Write_Char(timer0,55, 0);


 TFT_Set_Brush(1, CL_SILVER,0,0,0,0);
 TFT_Rectangle(60, 240 / 15 *1, 90,  240 / 15 *2);
 counter2 = counter/100 + 48;
 counter1 = (counter/10)%10 + 48;
 counter0 = counter%10 + 48;
 TFT_Write_Char(counter2,60,  240 / 15 );
 TFT_Write_Char(counter1,70,  240 / 15 );
 TFT_Write_Char(counter0,80,  240 / 15 );
}


void TIMER3_ISR () iv IVT_INT_TIM3 {
 speedcal();
 TIM3_ARR = 841+5909/adcVal - 148 * (level - 1);

 TIM3_SR.UIF = 0;


 TFT_Set_Brush(1, CL_BLACK,0,0,0,0);
 TFT_Rectangle(Car1.x1,Car1.y1,Car1.x2,Car1.y2);
 if(Car1.x1 ==  320 ){
 Car1.x1 = 0;
 Car1.x2 = Car1.x1 + 2 *  240 / 15 ;
 }
 else{
 Car1.x1 = Car1.x1 +  240 / 15 ;
 Car1.x2 = Car1.x2 +  240 / 15 ;
 }
 TFT_Set_Brush(1, Car1.color,0,0,0,0);
 TFT_Rectangle(Car1.x1,Car1.y1,Car1.x2,Car1.y2);


 TFT_Set_Brush(1, CL_BLACK,0,0,0,0);
 TFT_Rectangle(Car2.x1,Car2.y1,Car2.x2,Car2.y2);
 if(Car2.x1 ==  320 ){
 Car2.x1 = 0;
 Car2.x2 = Car2.x1 + 2 *  240 / 15 ;
 }
 else{
 Car2.x1 = Car2.x1 +  240 / 15 ;
 Car2.x2 = Car2.x2 +  240 / 15 ;
 }
 TFT_Set_Brush(1, Car2.color,0,0,0,0);
 TFT_Rectangle(Car2.x1,Car2.y1,Car2.x2,Car2.y2);


 TFT_Set_Brush(1, CL_BLACK,0,0,0,0);
 TFT_Rectangle(Car3.x1,Car3.y1,Car3.x2,Car3.y2);
 if(Car3.x1 ==  320 ){
 Car3.x1 = 0;
 Car3.x2 = Car3.x1 + 2 *  240 / 15 ;
 }
 else{
 Car3.x1 = Car3.x1 +  240 / 15 ;
 Car3.x2 = Car3.x2 +  240 / 15 ;
 }
 TFT_Set_Brush(1, Car3.color,0,0,0,0);
 TFT_Rectangle(Car3.x1,Car3.y1,Car3.x2,Car3.y2);


 TFT_Set_Brush(1, CL_BLACK,0,0,0,0);
 TFT_Rectangle(Car4.x1,Car4.y1,Car4.x2,Car4.y2);
 if(Car4.x1 ==  320 ){
 Car4.x1 = 0;
 Car4.x2 = Car4.x1 + 2 *  240 / 15 ;
 }
 else{
 Car4.x1 = Car4.x1 +  240 / 15 ;
 Car4.x2 = Car4.x2 +  240 / 15 ;
 }
 TFT_Set_Brush(1, Car4.color,0,0,0,0);
 TFT_Rectangle(Car4.x1,Car4.y1,Car4.x2,Car4.y2);


 if(9 *  240 / 15  > Frog.y1 && 3 *  240 / 15  < Frog.y1)
 {
 TFT_Set_Brush(1, CL_BLUE,0,0,0,0);
 TFT_Rectangle(Frog.x1,Frog.y1,Frog.x2,Frog.y2);
 Frog.x1 = Frog.x1 +  240 / 15 ;
 Frog.x2 = Frog.x2 +  240 / 15 ;

 TFT_Set_Brush(1, Frog.color,0,0,0,0);
 TFT_Rectangle(Frog.x1,Frog.y1,Frog.x2,Frog.y2);
 }
}

void JoystickUp () iv IVT_INT_EXTI4 {

 EXTI_PR.B4 = 1;
 if(Frog.y1 > 2 *  240 / 15 ){
#line 155 "E:/University of New Haven/Semester 2/Embedded Systems/Project 3/3C/Objective 2/PlayScreen.c"
 if(Frog.y1 > 4 *  240 / 15  || Frog.x1 == 3* 240 / 15  || Frog.x1 == 4* 240 / 15  || Frog.x1 == 9* 240 / 15  || Frog.x1 == 10* 240 / 15  || Frog.x1 == 15* 240 / 15  || Frog.x1 == 16* 240 / 15 ){
 Sound_Play(10, 100);
 Frog.row -= 1;
 TFT_Set_Brush(1, RowColor[Frog.row + 1],0,0,0,0);
 TFT_Rectangle(Frog.x1,Frog.y1,Frog.x2,Frog.y2);
 Frog.y1 = Frog.y1 -  240 / 15 ;
 Frog.y2 = Frog.y2 -  240 / 15 ;

 TFT_Set_Brush(1, Frog.color,0,0,0,0);
 TFT_Rectangle(Frog.x1,Frog.y1,Frog.x2,Frog.y2);

 if (Frog.y1 < hy1)
 {
 hy1 = Frog.y1;
 TFT_Set_Brush(1, CL_SILVER,0,0,0,0);
 TFT_Rectangle(300, 240 / 15 *0,  320 ,  240 / 15 *2);
 score = score + 1;
 score1 = score/10 + 48;
 score0 = score%10 + 48;
 TFT_Write_Char(score1, 320  - 20, 0);
 TFT_Write_Char(score0, 320  - 10, 0);
 }
 }
 }
}

void JoystickLeft () iv IVT_INT_EXTI2{

 EXTI_PR.B2 = 1;
 if(Frog.x1 > 0){
#line 190 "E:/University of New Haven/Semester 2/Embedded Systems/Project 3/3C/Objective 2/PlayScreen.c"
 if(!((Frog.x1 == 3 *  240 / 15  && Frog.y1 == 2 *  240 / 15 ) || (Frog.x1 == 3 *  240 / 15  && Frog.y1 == 3 *  240 / 15 ) || (Frog.x1 == 9 *  240 / 15  && Frog.y1 == 2 *  240 / 15 ) || (Frog.x1 == 9 *  240 / 15  && Frog.y1 == 3 *  240 / 15 ) || (Frog.x1 == 15 *  240 / 15  && Frog.y1 == 2 *  240 / 15 ) || (Frog.x1 == 15 *  240 / 15  && Frog.y1 == 3 *  240 / 15 ))){
 Sound_Play(10, 100);
 TFT_Set_Brush(1, RowColor[Frog.row],0,0,0,0);
 TFT_Rectangle(Frog.x1,Frog.y1,Frog.x2,Frog.y2);
 Frog.x1 = Frog.x1 -  240 / 15 ;
 Frog.x2 = Frog.x2 -  240 / 15 ;

 TFT_Set_Brush(1, Frog.color,0,0,0,0);
 TFT_Rectangle(Frog.x1,Frog.y1,Frog.x2,Frog.y2);
 }
 }
}

void EXTI9_5_IRQHandler() iv IVT_INT_EXTI9_5 {

 if (EXTI_PR.B5) {
 delay_ms(100);
 EXTI_PR.B5 = 1;
 if(Frog.y2 <  240 ){
 Sound_Play(10, 100);
 Frog.row += 1;
 TFT_Set_Brush(1, RowColor[Frog.row - 1],0,0,0,0);
 TFT_Rectangle(Frog.x1,Frog.y1,Frog.x2,Frog.y2);
 Frog.y1 = Frog.y1 +  240 / 15 ;
 Frog.y2 = Frog.y2 +  240 / 15 ;

 TFT_Set_Brush(1, Frog.color,0,0,0,0);
 TFT_Rectangle(Frog.x1,Frog.y1,Frog.x2,Frog.y2);
 }
 }

 else if (EXTI_PR.B6) {
 delay_ms(100);
 EXTI_PR.B6 = 1;
 if(Frog.x2 <  320 ){
#line 230 "E:/University of New Haven/Semester 2/Embedded Systems/Project 3/3C/Objective 2/PlayScreen.c"
 if(!((Frog.x1 == 4 *  240 / 15  && Frog.y1 == 2 *  240 / 15 ) || (Frog.x1 == 4 *  240 / 15  && Frog.y1 == 3 *  240 / 15 ) || (Frog.x1 == 10 *  240 / 15  && Frog.y1 == 2 *  240 / 15 ) || (Frog.x1 == 10 *  240 / 15  && Frog.y1 == 3 *  240 / 15 ) || (Frog.x1 == 16 *  240 / 15  && Frog.y1 == 2 *  240 / 15 ) || (Frog.x1 == 16 *  240 / 15  && Frog.y1 == 3 *  240 / 15 ))){
 Sound_Play(10, 100);
 TFT_Set_Brush(1, RowColor[Frog.row],0,0,0,0);
 TFT_Rectangle(Frog.x1,Frog.y1,Frog.x2,Frog.y2);
 Frog.x1 = Frog.x1 +  240 / 15 ;
 Frog.x2 = Frog.x2 +  240 / 15 ;

 TFT_Set_Brush(1, Frog.color,0,0,0,0);
 TFT_Rectangle(Frog.x1,Frog.y1,Frog.x2,Frog.y2);
 }
 }
 }
}

void PlayScreen(){

 TFT_Set_Pen(CL_BLACK, 0);
 timer = 60 - (level-1) * 10;

 Frog.x1 = 160;
 Frog.y1 =  240  -  240 / 15 ;
 Frog.x2 = Frog.x1 +  240 / 15 ;
 Frog.y2 = Frog.y1 +  240 / 15 ;
 Frog.color = CL_LIME;
 Frog.row = 14;
 hy1 = Frog.y1;


 Car1.x1 = 0;
 Car1.y1 =  240  - 2 *  240 / 15 ;
 Car1.x2 = Car1.x1 + 2 *  240 / 15 ;
 Car1.y2 = Car1.y1 +  240 / 15 ;
 Car1.color = CL_RED;


 Car2.x1 = 0 - 10 *  240 / 15 ;
 Car2.y1 =  240  - 3 *  240 / 15 ;
 Car2.x2 = Car2.x1 + 2 *  240 / 15 ;
 Car2.y2 = Car2.y1 +  240 / 15 ;
 Car2.color = CL_RED;


 Car3.x1 = 0 - 5 *  240 / 15 ;
 Car3.y1 =  240  - 4 *  240 / 15 ;
 Car3.x2 = Car3.x1 + 2 *  240 / 15 ;
 Car3.y2 = Car3.y1 +  240 / 15 ;
 Car3.color = CL_RED;


 Car4.x1 = 0 - 15 *  240 / 15 ;
 Car4.y1 =  240  - 5 *  240 / 15 ;
 Car4.x2 = Car4.x1 + 2 *  240 / 15 ;
 Car4.y2 = Car4.y1 +  240 / 15 ;
 Car4.color = CL_RED;



 TFT_Set_Brush(1, CL_GREEN,0,0,0,0);
 TFT_Rectangle(0,0,  320 ,  240 );


 TFT_Set_Brush(1, CL_BLACK,0,0,0,0);
 TFT_Rectangle(0, 240 / 15 *10,  320 ,  240 / 15 *14);


 TFT_Set_Brush(1, CL_BLUE,0,0,0,0);
 TFT_Rectangle(0, 240 / 15 *4,  320 ,  240 / 15 *9);


 TFT_Set_Brush(1, CL_SILVER,0,0,0,0);
 TFT_Rectangle(0, 240 / 15 *0,  320 ,  240 / 15 *2);


 TFT_Set_Brush(1, CL_MAROON,0,0,0,0);
 TFT_Rectangle(0,  240 / 15 *2,  240 / 15 *3,  240 / 15 *4);
 TFT_Rectangle( 240 / 15 *5,  240 / 15 *2,  240 / 15 *9,  240 / 15 *4);
 TFT_Rectangle( 240 / 15 *11,  240 / 15 *2,  240 / 15 *15,  240 / 15 *4);
 TFT_Rectangle( 240 / 15 *17,  240 / 15 *2,  240 / 15 *20,  240 / 15 *4);


 TFT_Set_Brush(1, Frog.color,0,0,0,0);
 TFT_Rectangle(Frog.x1,Frog.y1,Frog.x2,Frog.y2);


 TFT_Set_Brush(1, Car1.color,0,0,0,0);
 TFT_Rectangle(Car1.x1,Car1.y1,Car1.x2,Car1.y2);
 TFT_Rectangle(Car2.x1,Car2.y1,Car2.x2,Car2.y2);
 TFT_Rectangle(Car3.x1,Car3.y1,Car3.x2,Car3.y2);
 TFT_Rectangle(Car4.x1,Car4.y1,Car4.x2,Car4.y2);


 TFT_Write_Text("Score",  320  - 60, 0);
 score1 = score/10 + 48;
 score0 = score%10 + 48;
 TFT_Write_Char(score1, 320  - 20, 0);
 TFT_Write_Char(score0, 320  - 10, 0);


 TFT_Write_Text("Timer", 5, 0);


 TFT_Write_Text("Counter", 5,  240 / 15 );


 TFT_Write_Text("Level", 160 - 30, 0);
 TFT_Write_Char(level+48, 160 + 8, 0);


 TFT_Write_Text("Lives", 160 - 30,  240 / 15 );
 TFT_Write_Char(lives+48, 160 + 8,  240 / 15 );

}

void speedcal(){
 adcVal = getAdcReading()/38.4 + 1;
}
