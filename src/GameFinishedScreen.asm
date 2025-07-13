_GameFinishedScreen:
;GameFinishedScreen.c,3 :: 		void GameFinishedScreen(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;GameFinishedScreen.c,4 :: 		TIM3_CR1 = 0x0000;  // Disable timer3
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;GameFinishedScreen.c,5 :: 		TIM1_CR1 = 0x0000;  // Disable timer1
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM1_CR1+0)
MOVT	R0, #hi_addr(TIM1_CR1+0)
STR	R1, [R0, #0]
;GameFinishedScreen.c,7 :: 		EXTI_IMR = (0 << 2) | (0 << 4) | (0 << 5) | (0 << 6) | (0 << 13);
MOVW	R1, #0
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
STR	R1, [R0, #0]
;GameFinishedScreen.c,9 :: 		TFT_Set_Brush(1, CL_YELLOW,0,0,0,0);
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
;GameFinishedScreen.c,10 :: 		TFT_Rectangle(0,0, DISPLAY_X, DISPLAY_Y);
MOVS	R3, #240
SXTH	R3, R3
MOVW	R2, #320
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Rectangle+0
;GameFinishedScreen.c,11 :: 		TFT_Write_Text("You Finished the Game", DISPLAY_X / 2 - 70, DISPLAY_Y / 2);
MOVW	R0, #lo_addr(?lstr1_GameFinishedScreen+0)
MOVT	R0, #hi_addr(?lstr1_GameFinishedScreen+0)
MOVW	R2, #120
MOVW	R1, #90
BL	_TFT_Write_Text+0
;GameFinishedScreen.c,12 :: 		TFT_Write_Text("Click the Joystick to Reset the Game", DISPLAY_X / 2 - 110, DISPLAY_Y / 2 + 30);
MOVW	R0, #lo_addr(?lstr2_GameFinishedScreen+0)
MOVT	R0, #hi_addr(?lstr2_GameFinishedScreen+0)
MOVW	R2, #150
MOVW	R1, #50
BL	_TFT_Write_Text+0
;GameFinishedScreen.c,13 :: 		Sound_Play(100, 2000);// Play sound of 1KHz in duration of 1s
MOVW	R1, #2000
MOVS	R0, #100
BL	_Sound_Play+0
;GameFinishedScreen.c,14 :: 		}
L_end_GameFinishedScreen:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _GameFinishedScreen
