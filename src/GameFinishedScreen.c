#include "common.h"

void GameFinishedScreen(){
  TIM3_CR1 = 0x0000;  // Disable timer3
  TIM1_CR1 = 0x0000;  // Disable timer1
  // Disable External interrupt
  EXTI_IMR = (0 << 2) | (0 << 4) | (0 << 5) | (0 << 6) | (0 << 13);
  
      TFT_Set_Brush(1, CL_YELLOW,0,0,0,0);
      TFT_Rectangle(0,0, DISPLAY_X, DISPLAY_Y);
      TFT_Write_Text("You Finished the Game", DISPLAY_X / 2 - 70, DISPLAY_Y / 2);
      TFT_Write_Text("Click the Joystick to Reset the Game", DISPLAY_X / 2 - 110, DISPLAY_Y / 2 + 30);
      Sound_Play(100, 2000);// Play sound of 1KHz in duration of 1s
}