_GameFinished:
;GameFinished.c,3 :: 		void GameFinished(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;GameFinished.c,4 :: 		TIM3_CR1 = 0x0000;  // Disable timer3
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;GameFinished.c,5 :: 		TIM1_CR1 = 0x0000;  // Disable timer1
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM1_CR1+0)
MOVT	R0, #hi_addr(TIM1_CR1+0)
STR	R1, [R0, #0]
;GameFinished.c,7 :: 		EXTI_IMR = (0 << 2) | (0 << 4) | (0 << 5) | (0 << 6) | (0 << 13);
MOVW	R1, #0
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
STR	R1, [R0, #0]
;GameFinished.c,8 :: 		while (1){
L_GameFinished0:
;GameFinished.c,9 :: 		TFT_Set_Brush(1, CL_YELLOW,0,0,0,0);
MOVS	R1, #0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #65504
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;GameFinished.c,10 :: 		TFT_Rectangle(0,0, DISPLAY_X, DISPLAY_Y);
MOVS	R3, #240
SXTH	R3, R3
MOVW	R2, #320
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Rectangle+0
;GameFinished.c,11 :: 		TFT_Write_Text("You Finished the Game", DISPLAY_X / 2 - 35, DISPLAY_Y / 2);
MOVW	R0, #lo_addr(?lstr1_GameFinished+0)
MOVT	R0, #hi_addr(?lstr1_GameFinished+0)
MOVW	R2, #120
MOVW	R1, #125
BL	_TFT_Write_Text+0
;GameFinished.c,12 :: 		TFT_Write_Text("Click the Joystick to Reset the Game", DISPLAY_X / 2 - 130, DISPLAY_Y / 2 + 10);
MOVW	R0, #lo_addr(?lstr2_GameFinished+0)
MOVT	R0, #hi_addr(?lstr2_GameFinished+0)
MOVW	R2, #130
MOVW	R1, #30
BL	_TFT_Write_Text+0
;GameFinished.c,13 :: 		}
IT	AL
BAL	L_GameFinished0
;GameFinished.c,14 :: 		}
L_end_GameFinished:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _GameFinished
