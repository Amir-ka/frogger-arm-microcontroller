#include "common.h"

void NextLevelScreen(){
  TIM3_CR1 = 0x0000;  // Disable timer
  TIM1_CR1 = 0x0000;  // Disable timer
  // Disable External interrupt
  EXTI_IMR = (0 << 2) | (0 << 4) | (0 << 5) | (0 << 6) | (0 << 13);
  TFT_Set_Brush(1, CL_OLIVE,0,0,0,0);
  TFT_Rectangle(0,0, DISPLAY_X, DISPLAY_Y);
  TFT_Write_Text("Level", DISPLAY_X / 2 - 35, DISPLAY_Y / 2);
  level = level + 1; //Add 1 to level
  TFT_Write_Char(level+48, DISPLAY_X / 2, DISPLAY_Y / 2);
  Sound_Play(100, 500);// Play sound of 1KHz in duration of 1s
  delay_ms(2000);
}