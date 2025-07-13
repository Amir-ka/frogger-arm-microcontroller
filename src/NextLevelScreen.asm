_NextLevelScreen:
;NextLevelScreen.c,3 :: 		void NextLevelScreen(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;NextLevelScreen.c,4 :: 		TIM3_CR1 = 0x0000;  // Disable timer
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;NextLevelScreen.c,5 :: 		TIM1_CR1 = 0x0000;  // Disable timer
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM1_CR1+0)
MOVT	R0, #hi_addr(TIM1_CR1+0)
STR	R1, [R0, #0]
;NextLevelScreen.c,7 :: 		EXTI_IMR = (0 << 2) | (0 << 4) | (0 << 5) | (0 << 6) | (0 << 13);
MOVW	R1, #0
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
STR	R1, [R0, #0]
;NextLevelScreen.c,8 :: 		TFT_Set_Brush(1, CL_OLIVE,0,0,0,0);
MOVS	R1, #0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #33792
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;NextLevelScreen.c,9 :: 		TFT_Rectangle(0,0, DISPLAY_X, DISPLAY_Y);
MOVS	R3, #240
SXTH	R3, R3
MOVW	R2, #320
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Rectangle+0
;NextLevelScreen.c,10 :: 		TFT_Write_Text("Level", DISPLAY_X / 2 - 35, DISPLAY_Y / 2);
MOVW	R0, #lo_addr(?lstr1_NextLevelScreen+0)
MOVT	R0, #hi_addr(?lstr1_NextLevelScreen+0)
MOVW	R2, #120
MOVW	R1, #125
BL	_TFT_Write_Text+0
;NextLevelScreen.c,11 :: 		level = level + 1; //Add 1 to level
MOVW	R1, #lo_addr(_level+0)
MOVT	R1, #hi_addr(_level+0)
LDRSB	R0, [R1, #0]
ADDS	R0, R0, #1
STRB	R0, [R1, #0]
;NextLevelScreen.c,12 :: 		TFT_Write_Char(level+48, DISPLAY_X / 2, DISPLAY_Y / 2);
SXTB	R0, R0
ADDS	R0, #48
MOVW	R2, #120
MOVW	R1, #160
UXTH	R0, R0
BL	_TFT_Write_Char+0
;NextLevelScreen.c,13 :: 		Sound_Play(100, 500);// Play sound of 1KHz in duration of 1s
MOVW	R1, #500
MOVS	R0, #100
BL	_Sound_Play+0
;NextLevelScreen.c,14 :: 		delay_ms(2000);
MOVW	R7, #13823
MOVT	R7, #366
NOP
NOP
L_NextLevelScreen0:
SUBS	R7, R7, #1
BNE	L_NextLevelScreen0
NOP
NOP
NOP
;NextLevelScreen.c,15 :: 		}
L_end_NextLevelScreen:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _NextLevelScreen
