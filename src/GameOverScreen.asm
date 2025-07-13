_GameOverScreen:
;GameOverScreen.c,6 :: 		void GameOverScreen(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;GameOverScreen.c,7 :: 		TIM3_CR1 = 0x0000;  // Disable timer
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;GameOverScreen.c,8 :: 		TIM1_CR1 = 0x0000;  // Disable timer
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM1_CR1+0)
MOVT	R0, #hi_addr(TIM1_CR1+0)
STR	R1, [R0, #0]
;GameOverScreen.c,10 :: 		EXTI_IMR = (0 << 2) | (0 << 4) | (0 << 5) | (0 << 6) | (0 << 13);
MOVW	R1, #0
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
STR	R1, [R0, #0]
;GameOverScreen.c,11 :: 		TFT_Set_Brush(1, CL_PURPLE,0,0,0,0);
MOVS	R1, #0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #32784
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;GameOverScreen.c,12 :: 		TFT_Rectangle(0,0, DISPLAY_X, DISPLAY_Y);
MOVS	R3, #240
SXTH	R3, R3
MOVW	R2, #320
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Rectangle+0
;GameOverScreen.c,13 :: 		TFT_Write_Text("Your score is", DISPLAY_X / 2 - 55, GRID_SIZE * 5);
MOVW	R0, #lo_addr(?lstr1_GameOverScreen+0)
MOVT	R0, #hi_addr(?lstr1_GameOverScreen+0)
MOVW	R2, #80
MOVW	R1, #105
BL	_TFT_Write_Text+0
;GameOverScreen.c,14 :: 		score1 = score/10 + 48;
MOVW	R2, #lo_addr(_score+0)
MOVT	R2, #hi_addr(_score+0)
LDRSB	R1, [R2, #0]
MOVS	R0, #10
SXTB	R0, R0
SDIV	R0, R1, R0
SXTB	R0, R0
ADDW	R3, R0, #48
MOVW	R0, #lo_addr(_score1+0)
MOVT	R0, #hi_addr(_score1+0)
STRB	R3, [R0, #0]
;GameOverScreen.c,15 :: 		score0 = score%10 + 48;
MOV	R0, R2
LDRSB	R2, [R0, #0]
MOVS	R1, #10
SXTB	R1, R1
SDIV	R0, R2, R1
MLS	R0, R1, R0, R2
SXTB	R0, R0
ADDW	R1, R0, #48
MOVW	R0, #lo_addr(_score0+0)
MOVT	R0, #hi_addr(_score0+0)
STRB	R1, [R0, #0]
;GameOverScreen.c,16 :: 		TFT_Write_Char(score1,DISPLAY_X / 2 + 30, GRID_SIZE * 5);
UXTB	R0, R3
MOVW	R2, #80
MOVW	R1, #190
BL	_TFT_Write_Char+0
;GameOverScreen.c,17 :: 		TFT_Write_Char(score0,DISPLAY_X / 2 + 40, GRID_SIZE * 5);
MOVW	R0, #lo_addr(_score0+0)
MOVT	R0, #hi_addr(_score0+0)
LDRB	R0, [R0, #0]
MOVW	R2, #80
MOVW	R1, #200
BL	_TFT_Write_Char+0
;GameOverScreen.c,18 :: 		TFT_Write_Text("Click the Joystick to Reset the Game", DISPLAY_X / 2 - 110, DISPLAY_Y / 2);
MOVW	R0, #lo_addr(?lstr2_GameOverScreen+0)
MOVT	R0, #hi_addr(?lstr2_GameOverScreen+0)
MOVW	R2, #120
MOVW	R1, #50
BL	_TFT_Write_Text+0
;GameOverScreen.c,19 :: 		Sound_Play(1000, 1000);// Play sound of 1KHz in duration of 1s
MOVW	R1, #1000
MOVW	R0, #1000
BL	_Sound_Play+0
;GameOverScreen.c,21 :: 		}
L_end_GameOverScreen:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _GameOverScreen
