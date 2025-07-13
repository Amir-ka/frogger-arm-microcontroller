#include "common.h"

char score1;
char score0;

void GameOverScreen(){
  TIM3_CR1 = 0x0000;  // Disable timer
  TIM1_CR1 = 0x0000;  // Disable timer
  // Disable External interrupt
  EXTI_IMR = (0 << 2) | (0 << 4) | (0 << 5) | (0 << 6) | (0 << 13);
  TFT_Set_Brush(1, CL_PURPLE,0,0,0,0);
  TFT_Rectangle(0,0, DISPLAY_X, DISPLAY_Y);
  TFT_Write_Text("Your score is", DISPLAY_X / 2 - 55, GRID_SIZE * 5);
  score1 = score/10 + 48;
  score0 = score%10 + 48;
  TFT_Write_Char(score1,DISPLAY_X / 2 + 30, GRID_SIZE * 5);
  TFT_Write_Char(score0,DISPLAY_X / 2 + 40, GRID_SIZE * 5);
  TFT_Write_Text("Click the Joystick to Reset the Game", DISPLAY_X / 2 - 110, DISPLAY_Y / 2);
  Sound_Play(1000, 1000);// Play sound of 1KHz in duration of 1s

}