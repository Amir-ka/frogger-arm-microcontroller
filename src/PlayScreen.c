#include "common.h"

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
int counter = 0; //This counter shows the amount of time passed from the start of the game
char counter2;
char counter1;
char counter0;

int RowColor[16] = {
    CL_SILVER, //Row 0
    CL_SILVER, //Row 1
    CL_GREEN, //Row 2
    CL_GREEN, //Row 3
    CL_BLUE, //Row 4
    CL_BLUE, //Row 5
    CL_BLUE, //Row 6
    CL_BLUE, //Row 7
    CL_BLUE, //Row 8
    CL_GREEN, //Row 9
    CL_BLACK, //Row 10
    CL_BLACK, //Row 11
    CL_BLACK, //Row 12
    CL_BLACK, //Row 13
    CL_GREEN, //Row 14
};

void speedcal(); //calculates the speed between 1 and 100
unsigned int adcVal;  // Contains the scaled value of potentiometer P1. (1 to 100)

//INTERRUPT SERVICE ROUTINE for Timer1
void Timer1_IRQHandler() iv IVT_INT_TIM1_UP {
     TIM1_SR.UIF = 0; // Clear this flag which will reset the timer
     counter = counter + 1; // Add 1 second to counter
     
    //Show timer
    TFT_Set_Brush(1, CL_SILVER,0,0,0,0);
    TFT_Rectangle(45,GRID_SIZE*0, 65, GRID_SIZE*1);
    if(timer > 0){
         timer = timer-1; //Count down if the timer is more than 0
     }
    timer1 = timer/10 + 48;
    timer0 = timer%10 + 48;
    TFT_Write_Char(timer1,45, 0);
    TFT_Write_Char(timer0,55, 0);

    //Show counter
    TFT_Set_Brush(1, CL_SILVER,0,0,0,0);
    TFT_Rectangle(60,GRID_SIZE*1, 90, GRID_SIZE*2);
    counter2 = counter/100 + 48;
    counter1 = (counter/10)%10 + 48;
    counter0 = counter%10 + 48;
    TFT_Write_Char(counter2,60, GRID_SIZE);
    TFT_Write_Char(counter1,70, GRID_SIZE);
    TFT_Write_Char(counter0,80, GRID_SIZE);
}

//INTERRUPT SERVICE ROUTINE for Timer3
void TIMER3_ISR () iv IVT_INT_TIM3 {
        speedcal();
        TIM3_ARR = 841+5909/adcVal - 148 * (level - 1); //set ARR of timer 3 so that we get 100ms to 750ms from the timer
                                                        // and decrease it when the level increases
        TIM3_SR.UIF = 0;                  // Clear this flag which will reset the timer

        ///***Car1***///
        TFT_Set_Brush(1, CL_BLACK,0,0,0,0); // Erase previous position
        TFT_Rectangle(Car1.x1,Car1.y1,Car1.x2,Car1.y2);
        if(Car1.x1 == DISPLAY_X){
          Car1.x1 = 0;
          Car1.x2 = Car1.x1 + 2 * GRID_SIZE;
        }
        else{
          Car1.x1 = Car1.x1 + GRID_SIZE; // Update position
          Car1.x2 = Car1.x2 + GRID_SIZE;
        }
        TFT_Set_Brush(1, Car1.color,0,0,0,0); // Draw new position
        TFT_Rectangle(Car1.x1,Car1.y1,Car1.x2,Car1.y2);

        ///***Car2***///
        TFT_Set_Brush(1, CL_BLACK,0,0,0,0); // Erase previous position
        TFT_Rectangle(Car2.x1,Car2.y1,Car2.x2,Car2.y2);
        if(Car2.x1 == DISPLAY_X){
          Car2.x1 = 0;
          Car2.x2 = Car2.x1 + 2 * GRID_SIZE;
        }
        else{
          Car2.x1 = Car2.x1 + GRID_SIZE; // Update position
          Car2.x2 = Car2.x2 + GRID_SIZE;
        }
        TFT_Set_Brush(1, Car2.color,0,0,0,0); // Draw new position
        TFT_Rectangle(Car2.x1,Car2.y1,Car2.x2,Car2.y2);

        ///***Car3***///
        TFT_Set_Brush(1, CL_BLACK,0,0,0,0); // Erase previous position
        TFT_Rectangle(Car3.x1,Car3.y1,Car3.x2,Car3.y2);
        if(Car3.x1 == DISPLAY_X){
          Car3.x1 = 0;
          Car3.x2 = Car3.x1 + 2 * GRID_SIZE;
        }
        else{
          Car3.x1 = Car3.x1 + GRID_SIZE; // Update position
          Car3.x2 = Car3.x2 + GRID_SIZE;
        }
        TFT_Set_Brush(1, Car3.color,0,0,0,0); // Draw new position
        TFT_Rectangle(Car3.x1,Car3.y1,Car3.x2,Car3.y2);

        ///***Car4***///
        TFT_Set_Brush(1, CL_BLACK,0,0,0,0); // Erase previous position
        TFT_Rectangle(Car4.x1,Car4.y1,Car4.x2,Car4.y2);
        if(Car4.x1 == DISPLAY_X){
          Car4.x1 = 0;
          Car4.x2 = Car4.x1 + 2 * GRID_SIZE;
        }
        else{
          Car4.x1 = Car4.x1 + GRID_SIZE; // Update position
          Car4.x2 = Car4.x2 + GRID_SIZE;
        }
        TFT_Set_Brush(1, Car4.color,0,0,0,0); // Draw new position
        TFT_Rectangle(Car4.x1,Car4.y1,Car4.x2,Car4.y2);

        ///***If in the river, move slower and move to right in each timer interrupt***///
        if(9 * GRID_SIZE > Frog.y1 && 3 * GRID_SIZE < Frog.y1)
        {
             TFT_Set_Brush(1, CL_BLUE,0,0,0,0); // Erase previous position
             TFT_Rectangle(Frog.x1,Frog.y1,Frog.x2,Frog.y2);
             Frog.x1 = Frog.x1 + GRID_SIZE; // Update position
             Frog.x2 = Frog.x2 + GRID_SIZE;

             TFT_Set_Brush(1, Frog.color,0,0,0,0); // draw new position
             TFT_Rectangle(Frog.x1,Frog.y1,Frog.x2,Frog.y2);
        }
}

void JoystickUp () iv IVT_INT_EXTI4 {
     // UP Pressed
     EXTI_PR.B4 = 1; // Clear pending flag for EXTI4
     if(Frog.y1 > 2 * GRID_SIZE){ // Check for collision with border
         if(Frog.y1 > 4 * GRID_SIZE || Frog.x1 == 3*GRID_SIZE || \
            Frog.x1 == 4*GRID_SIZE || Frog.x1 == 9*GRID_SIZE || \
            Frog.x1 == 10*GRID_SIZE || Frog.x1 == 15*GRID_SIZE || \
            Frog.x1 == 16*GRID_SIZE){
                 Sound_Play(10, 100); // Play sound of 10Hz in duration of 100ms
                 Frog.row -= 1;
                 TFT_Set_Brush(1, RowColor[Frog.row + 1],0,0,0,0); // Replace previous position
                 TFT_Rectangle(Frog.x1,Frog.y1,Frog.x2,Frog.y2);
                 Frog.y1 = Frog.y1 - GRID_SIZE; // Update position
                 Frog.y2 = Frog.y2 - GRID_SIZE;

                 TFT_Set_Brush(1, Frog.color,0,0,0,0); // draw new position
                 TFT_Rectangle(Frog.x1,Frog.y1,Frog.x2,Frog.y2);
                 // Show score
                 if (Frog.y1 < hy1)
                 {
                    hy1 = Frog.y1;
                    TFT_Set_Brush(1, CL_SILVER,0,0,0,0);
                    TFT_Rectangle(300,GRID_SIZE*0, DISPLAY_X, GRID_SIZE*2);
                    score = score + 1;
                    score1 = score/10 + 48;
                    score0 = score%10 + 48;
                    TFT_Write_Char(score1,DISPLAY_X - 20, 0);
                    TFT_Write_Char(score0,DISPLAY_X - 10, 0);
                 }
             }
     }
}

void JoystickLeft () iv IVT_INT_EXTI2{
     // LEFT Pressed
     EXTI_PR.B2 = 1; // Clear pending flag for EXTI2
     if(Frog.x1 > 0){ // Check for collision with border
         if(!((Frog.x1 == 3 * GRID_SIZE && Frog.y1 == 2 * GRID_SIZE) || \
         (Frog.x1 == 3 * GRID_SIZE && Frog.y1 == 3 * GRID_SIZE) || \
         (Frog.x1 == 9 * GRID_SIZE && Frog.y1 == 2 * GRID_SIZE) || \
         (Frog.x1 == 9 * GRID_SIZE && Frog.y1 == 3 * GRID_SIZE) || \
         (Frog.x1 == 15 * GRID_SIZE && Frog.y1 == 2 * GRID_SIZE) || \
         (Frog.x1 == 15 * GRID_SIZE && Frog.y1 == 3 * GRID_SIZE))){
             Sound_Play(10, 100); // Play sound of 10Hz in duration of 100ms
             TFT_Set_Brush(1, RowColor[Frog.row],0,0,0,0); // Replace previous position
             TFT_Rectangle(Frog.x1,Frog.y1,Frog.x2,Frog.y2);
             Frog.x1 = Frog.x1 - GRID_SIZE; // Update position
             Frog.x2 = Frog.x2 - GRID_SIZE;

             TFT_Set_Brush(1, Frog.color,0,0,0,0); // draw new position
             TFT_Rectangle(Frog.x1,Frog.y1,Frog.x2,Frog.y2);
         }
     }
}

void EXTI9_5_IRQHandler() iv IVT_INT_EXTI9_5 {
     // DOWN Pressed
    if (EXTI_PR.B5) { // Check if EXTI5 interrupt is pending
        delay_ms(100); // 0.1s delay
        EXTI_PR.B5 = 1; // Clear pending flag for EXTI5
        if(Frog.y2 < DISPLAY_Y){ // Check for collision with border
          Sound_Play(10, 100); // Play sound of 10Hz in duration of 100ms
          Frog.row += 1;
          TFT_Set_Brush(1, RowColor[Frog.row - 1],0,0,0,0); // Replace previous position
          TFT_Rectangle(Frog.x1,Frog.y1,Frog.x2,Frog.y2);
          Frog.y1 = Frog.y1 + GRID_SIZE; // Update position
          Frog.y2 = Frog.y2 + GRID_SIZE;

          TFT_Set_Brush(1, Frog.color,0,0,0,0); // draw new position
          TFT_Rectangle(Frog.x1,Frog.y1,Frog.x2,Frog.y2);
        }
    }
    // RIGHT Pressed
    else if (EXTI_PR.B6) { // Check if EXTI6 interrupt is pending
        delay_ms(100); // 0.1s delay
        EXTI_PR.B6 = 1; // Clear pending flag for EXTI6
        if(Frog.x2 < DISPLAY_X){ // Check for collision with border
            if(!((Frog.x1 == 4 * GRID_SIZE && Frog.y1 == 2 * GRID_SIZE) || \
            (Frog.x1 == 4 * GRID_SIZE && Frog.y1 == 3 * GRID_SIZE) || \
            (Frog.x1 == 10 * GRID_SIZE && Frog.y1 == 2 * GRID_SIZE) || \
            (Frog.x1 == 10 * GRID_SIZE && Frog.y1 == 3 * GRID_SIZE) || \
            (Frog.x1 == 16 * GRID_SIZE && Frog.y1 == 2 * GRID_SIZE) || \
            (Frog.x1 == 16 * GRID_SIZE && Frog.y1 == 3 * GRID_SIZE))){
                Sound_Play(10, 100); // Play sound of 10Hz in duration of 100ms
                TFT_Set_Brush(1, RowColor[Frog.row],0,0,0,0); // Replace previous position
                TFT_Rectangle(Frog.x1,Frog.y1,Frog.x2,Frog.y2);
                Frog.x1 = Frog.x1 + GRID_SIZE; // Update position
                Frog.x2 = Frog.x2 + GRID_SIZE;

                TFT_Set_Brush(1, Frog.color,0,0,0,0); // draw new position
                TFT_Rectangle(Frog.x1,Frog.y1,Frog.x2,Frog.y2);
            }
        }
    }
}

void PlayScreen(){
  //Initialization
  TFT_Set_Pen(CL_BLACK, 0); //Set the pen width to 0
  timer = 60 - (level-1) * 10;
  ///***Frog***///
  Frog.x1 = 160;
  Frog.y1 = DISPLAY_Y - GRID_SIZE;
  Frog.x2 = Frog.x1 + GRID_SIZE;
  Frog.y2 = Frog.y1 + GRID_SIZE;
  Frog.color = CL_LIME;
  Frog.row = 14;
  hy1 = Frog.y1;

  ///***Car1***///
  Car1.x1 = 0;
  Car1.y1 = DISPLAY_Y - 2 * GRID_SIZE;
  Car1.x2 = Car1.x1 + 2 * GRID_SIZE;
  Car1.y2 = Car1.y1 + GRID_SIZE;
  Car1.color = CL_RED;

  ///***Car2***///
  Car2.x1 = 0 - 10 * GRID_SIZE;
  Car2.y1 = DISPLAY_Y - 3 * GRID_SIZE;
  Car2.x2 = Car2.x1 + 2 * GRID_SIZE;
  Car2.y2 = Car2.y1 + GRID_SIZE;
  Car2.color = CL_RED;

  ///***Car3***///
  Car3.x1 = 0 - 5 * GRID_SIZE;
  Car3.y1 = DISPLAY_Y - 4 * GRID_SIZE;
  Car3.x2 = Car3.x1 + 2 * GRID_SIZE;
  Car3.y2 = Car3.y1 + GRID_SIZE;
  Car3.color = CL_RED;

  ///***Car4***///
  Car4.x1 = 0 - 15 * GRID_SIZE;
  Car4.y1 = DISPLAY_Y - 5 * GRID_SIZE;
  Car4.x2 = Car4.x1 + 2 * GRID_SIZE;
  Car4.y2 = Car4.y1 + GRID_SIZE;
  Car4.color = CL_RED;

  ///***Different areas***///
  //Green for safe areas
  TFT_Set_Brush(1, CL_GREEN,0,0,0,0);
  TFT_Rectangle(0,0, DISPLAY_X, DISPLAY_Y);

  //Black for the road
  TFT_Set_Brush(1, CL_BLACK,0,0,0,0);
  TFT_Rectangle(0,GRID_SIZE*10, DISPLAY_X, GRID_SIZE*14);

  //Blue for the river
  TFT_Set_Brush(1, CL_BLUE,0,0,0,0);
  TFT_Rectangle(0,GRID_SIZE*4, DISPLAY_X, GRID_SIZE*9);

  //Silver for header
  TFT_Set_Brush(1, CL_SILVER,0,0,0,0);
  TFT_Rectangle(0,GRID_SIZE*0, DISPLAY_X, GRID_SIZE*2);

  //Blocking areas at the top row
  TFT_Set_Brush(1, CL_MAROON,0,0,0,0);
  TFT_Rectangle(0, GRID_SIZE*2, GRID_SIZE*3, GRID_SIZE*4);
  TFT_Rectangle(GRID_SIZE*5, GRID_SIZE*2, GRID_SIZE*9, GRID_SIZE*4);
  TFT_Rectangle(GRID_SIZE*11, GRID_SIZE*2, GRID_SIZE*15, GRID_SIZE*4);
  TFT_Rectangle(GRID_SIZE*17, GRID_SIZE*2, GRID_SIZE*20, GRID_SIZE*4);

  //Frog
  TFT_Set_Brush(1, Frog.color,0,0,0,0);
  TFT_Rectangle(Frog.x1,Frog.y1,Frog.x2,Frog.y2);

  //Cars
  TFT_Set_Brush(1, Car1.color,0,0,0,0);
  TFT_Rectangle(Car1.x1,Car1.y1,Car1.x2,Car1.y2);
  TFT_Rectangle(Car2.x1,Car2.y1,Car2.x2,Car2.y2);
  TFT_Rectangle(Car3.x1,Car3.y1,Car3.x2,Car3.y2);
  TFT_Rectangle(Car4.x1,Car4.y1,Car4.x2,Car4.y2);
  
  //Score
  TFT_Write_Text("Score", DISPLAY_X - 60, 0);
  score1 = score/10 + 48;
  score0 = score%10 + 48;
  TFT_Write_Char(score1,DISPLAY_X - 20, 0);
  TFT_Write_Char(score0,DISPLAY_X - 10, 0);
  
  //Timer
  TFT_Write_Text("Timer", 5, 0);
  
  //Counter
  TFT_Write_Text("Counter", 5, GRID_SIZE);
  
  //Level
  TFT_Write_Text("Level", 160 - 30, 0);
  TFT_Write_Char(level+48, 160 + 8, 0);
  
  //Lives
  TFT_Write_Text("Lives", 160 - 30, GRID_SIZE);
  TFT_Write_Char(lives+48, 160 + 8, GRID_SIZE);

}

void speedcal(){
     adcVal = getAdcReading()/38.4 + 1; // Convert the ADC1 value between 1 and 100
}