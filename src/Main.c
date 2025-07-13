/*
Name: Amirhossein Karimi/ Joaquim Bahebura/ Trevor Saccone
Date: 12/16/2024
Course: ELEC3371-01
Description: This is Project 3C. This is basically the final code for the game Frogger. You will start from the bottom of
the map and your goal is to get to the safe zone (Green zone) at the top by passing the obsticles.
The game has 6 Levels.By passing each level, the speed of the cars and the flow of the water will increase. 
Also, the timer declines(10 seconds).
You have 3 lives. When you lose, your lives will decrease and you will begin from the level you lost at.
If you lose all your lives, you will lose the game and your score will show up on the screen.
*/
#include "common.h"

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
  //Initialize the level, lives and score.
  level = 1;
  lives = 3;
  score = 0;
  
  //This is where we start the game after losing or winning the game
  NormalOperation:
  delay_ms(10);
  InitializeHardware();
  PinInitialize();
  ExternalIntConfiguration();
  AdcConfiguration(); // Function to configure ADC on PC0
  PlayScreen();
  delay_ms(10);
  Timer3Configuration();
  Timer1Configuration();

  for(;;){
      //Check for collissions
      if(Car1.x1 < Frog.x2 &&  \
      Car1.x2 > Frog.x1 &&  \
      Car1.y1 < Frog.y2 &&  \
      Car1.y2 > Frog.y1 || \
      Car2.x1 < Frog.x2 &&  \
      Car2.x2 > Frog.x1 &&  \
      Car2.y1 < Frog.y2 &&  \
      Car2.y2 > Frog.y1)
      {
          // Collision detected
          break;
      }
      if(Car3.x1 < Frog.x2 &&  \
      Car3.x2 > Frog.x1 &&  \
      Car3.y1 < Frog.y2 &&  \
      Car3.y2 > Frog.y1 || \
      Car4.x1 < Frog.x2 &&  \
      Car4.x2 > Frog.x1 &&  \
      Car4.y1 < Frog.y2 &&  \
      Car4.y2 > Frog.y1)
      {
          // Collision detected
          break;
      }

      // If it goes out of screen in the river, you will lose
      if(Frog.x1 >= DISPLAY_X){
          break;
      }

      // If timer is 0 you lose
      if(timer == 0){
          break;
      }

      // If you finished a level you go to the next level or you finish the game
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

  // When losing, check for lives
  if(lives > 1){
      // There are lives
      TIM3_CR1 = 0x0000;  // Disable timer
      TIM1_CR1 = 0x0000;  // Disable timer
      // Disable External interrupt
      EXTI_IMR = (0 << 2) | (0 << 4) | (0 << 5) | (0 << 6) | (0 << 13);
      lives = lives -1;
      if(level == 1){
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
      // There are no lives adn you lost
      GameOverScreen();
      level = 1;
      lives = 3;
      score = 0;
      for(;;){
          if (!GPIOC_IDR.B13){ // CLICK Pressed
                 goto NormalOperation;
             }
      }
  }

  Finish:
  level = 1;
  GameFinishedScreen();
  for(;;){
      if (!GPIOC_IDR.B13){ // CLICK Pressed
             goto NormalOperation;
         }
  }
}