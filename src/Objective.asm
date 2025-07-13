_main:
;Objective2.c,14 :: 		void main(){
;Objective2.c,15 :: 		level = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_level+0)
MOVT	R0, #hi_addr(_level+0)
STRB	R1, [R0, #0]
;Objective2.c,16 :: 		lives = 3;
MOVS	R1, #3
SXTB	R1, R1
MOVW	R0, #lo_addr(_lives+0)
MOVT	R0, #hi_addr(_lives+0)
STRB	R1, [R0, #0]
;Objective2.c,17 :: 		score = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_score+0)
MOVT	R0, #hi_addr(_score+0)
STRB	R1, [R0, #0]
;Objective2.c,18 :: 		NormalOperation:
___main_NormalOperation:
;Objective2.c,19 :: 		delay_ms(10);
MOVW	R7, #54463
MOVT	R7, #1
NOP
NOP
L_main0:
SUBS	R7, R7, #1
BNE	L_main0
NOP
NOP
NOP
;Objective2.c,20 :: 		InitializeHardware();
BL	_InitializeHardware+0
;Objective2.c,21 :: 		PinInitialize();
BL	_PinInitialize+0
;Objective2.c,22 :: 		ExternalIntConfiguration();
BL	_ExternalIntConfiguration+0
;Objective2.c,23 :: 		AdcConfiguration(); // Function to configure ADC on PC0
BL	_AdcConfiguration+0
;Objective2.c,24 :: 		PlayScreen();
BL	_PlayScreen+0
;Objective2.c,25 :: 		delay_ms(10);
MOVW	R7, #54463
MOVT	R7, #1
NOP
NOP
L_main2:
SUBS	R7, R7, #1
BNE	L_main2
NOP
NOP
NOP
;Objective2.c,26 :: 		Timer3Configuration();
BL	_Timer3Configuration+0
;Objective2.c,27 :: 		Timer1Configuration();
BL	_Timer1Configuration+0
;Objective2.c,29 :: 		for(;;){
L_main4:
;Objective2.c,37 :: 		Car2.y2 > Frog.y1)
MOVW	R0, #lo_addr(_Frog+4)
MOVT	R0, #hi_addr(_Frog+4)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Car1+0)
MOVT	R0, #hi_addr(_Car1+0)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	GE
BGE	L__main58
MOVW	R0, #lo_addr(_Frog+0)
MOVT	R0, #hi_addr(_Frog+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Car1+4)
MOVT	R0, #hi_addr(_Car1+4)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	LE
BLE	L__main57
MOVW	R0, #lo_addr(_Frog+6)
MOVT	R0, #hi_addr(_Frog+6)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Car1+2)
MOVT	R0, #hi_addr(_Car1+2)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	GE
BGE	L__main56
MOVW	R0, #lo_addr(_Frog+2)
MOVT	R0, #hi_addr(_Frog+2)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Car1+6)
MOVT	R0, #hi_addr(_Car1+6)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	LE
BLE	L__main55
IT	AL
BAL	L__main52
L__main58:
L__main57:
L__main56:
L__main55:
MOVW	R0, #lo_addr(_Frog+4)
MOVT	R0, #hi_addr(_Frog+4)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Car2+0)
MOVT	R0, #hi_addr(_Car2+0)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	GE
BGE	L__main62
MOVW	R0, #lo_addr(_Frog+0)
MOVT	R0, #hi_addr(_Frog+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Car2+4)
MOVT	R0, #hi_addr(_Car2+4)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	LE
BLE	L__main61
MOVW	R0, #lo_addr(_Frog+6)
MOVT	R0, #hi_addr(_Frog+6)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Car2+2)
MOVT	R0, #hi_addr(_Car2+2)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	GE
BGE	L__main60
MOVW	R0, #lo_addr(_Frog+2)
MOVT	R0, #hi_addr(_Frog+2)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Car2+6)
MOVT	R0, #hi_addr(_Car2+6)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	LE
BLE	L__main59
IT	AL
BAL	L__main52
L__main62:
L__main61:
L__main60:
L__main59:
IT	AL
BAL	L_main13
L__main52:
;Objective2.c,40 :: 		break;
IT	AL
BAL	L_main5
;Objective2.c,41 :: 		}
L_main13:
;Objective2.c,49 :: 		Car4.y2 > Frog.y1)
MOVW	R0, #lo_addr(_Frog+4)
MOVT	R0, #hi_addr(_Frog+4)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Car3+0)
MOVT	R0, #hi_addr(_Car3+0)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	GE
BGE	L__main66
MOVW	R0, #lo_addr(_Frog+0)
MOVT	R0, #hi_addr(_Frog+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Car3+4)
MOVT	R0, #hi_addr(_Car3+4)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	LE
BLE	L__main65
MOVW	R0, #lo_addr(_Frog+6)
MOVT	R0, #hi_addr(_Frog+6)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Car3+2)
MOVT	R0, #hi_addr(_Car3+2)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	GE
BGE	L__main64
MOVW	R0, #lo_addr(_Frog+2)
MOVT	R0, #hi_addr(_Frog+2)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Car3+6)
MOVT	R0, #hi_addr(_Car3+6)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	LE
BLE	L__main63
IT	AL
BAL	L__main49
L__main66:
L__main65:
L__main64:
L__main63:
MOVW	R0, #lo_addr(_Frog+4)
MOVT	R0, #hi_addr(_Frog+4)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Car4+0)
MOVT	R0, #hi_addr(_Car4+0)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	GE
BGE	L__main70
MOVW	R0, #lo_addr(_Frog+0)
MOVT	R0, #hi_addr(_Frog+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Car4+4)
MOVT	R0, #hi_addr(_Car4+4)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	LE
BLE	L__main69
MOVW	R0, #lo_addr(_Frog+6)
MOVT	R0, #hi_addr(_Frog+6)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Car4+2)
MOVT	R0, #hi_addr(_Car4+2)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	GE
BGE	L__main68
MOVW	R0, #lo_addr(_Frog+2)
MOVT	R0, #hi_addr(_Frog+2)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Car4+6)
MOVT	R0, #hi_addr(_Car4+6)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	LE
BLE	L__main67
IT	AL
BAL	L__main49
L__main70:
L__main69:
L__main68:
L__main67:
IT	AL
BAL	L_main20
L__main49:
;Objective2.c,52 :: 		break;
IT	AL
BAL	L_main5
;Objective2.c,53 :: 		}
L_main20:
;Objective2.c,56 :: 		if(Frog.x1 >= DISPLAY_X){
MOVW	R0, #lo_addr(_Frog+0)
MOVT	R0, #hi_addr(_Frog+0)
LDRSH	R0, [R0, #0]
CMP	R0, #320
IT	LT
BLT	L_main21
;Objective2.c,57 :: 		break;
IT	AL
BAL	L_main5
;Objective2.c,58 :: 		}
L_main21:
;Objective2.c,61 :: 		if(timer == 0){
MOVW	R0, #lo_addr(_timer+0)
MOVT	R0, #hi_addr(_timer+0)
LDRSB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_main22
;Objective2.c,62 :: 		break;
IT	AL
BAL	L_main5
;Objective2.c,63 :: 		}
L_main22:
;Objective2.c,66 :: 		if(Frog.row == 2){
MOVW	R0, #lo_addr(_Frog+12)
MOVT	R0, #hi_addr(_Frog+12)
LDRSH	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L_main23
;Objective2.c,67 :: 		if(level == 6){
MOVW	R0, #lo_addr(_level+0)
MOVT	R0, #hi_addr(_level+0)
LDRSB	R0, [R0, #0]
CMP	R0, #6
IT	NE
BNE	L_main24
;Objective2.c,68 :: 		goto Finish;
IT	AL
BAL	___main_Finish
;Objective2.c,69 :: 		}
L_main24:
;Objective2.c,71 :: 		NextLevelScreen();
BL	_NextLevelScreen+0
;Objective2.c,72 :: 		goto NormalOperation;
IT	AL
BAL	___main_NormalOperation
;Objective2.c,74 :: 		}
L_main23:
;Objective2.c,75 :: 		}
IT	AL
BAL	L_main4
L_main5:
;Objective2.c,78 :: 		if(lives != 1){
MOVW	R0, #lo_addr(_lives+0)
MOVT	R0, #hi_addr(_lives+0)
LDRSB	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_main26
;Objective2.c,79 :: 		TIM3_CR1 = 0x0000;  // Disable timer
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;Objective2.c,80 :: 		TIM1_CR1 = 0x0000;  // Disable timer
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM1_CR1+0)
MOVT	R0, #hi_addr(TIM1_CR1+0)
STR	R1, [R0, #0]
;Objective2.c,82 :: 		EXTI_IMR = (0 << 2) | (0 << 4) | (0 << 5) | (0 << 6) | (0 << 13);
MOVW	R1, #0
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
STR	R1, [R0, #0]
;Objective2.c,83 :: 		lives = lives -1;
MOVW	R1, #lo_addr(_lives+0)
MOVT	R1, #hi_addr(_lives+0)
LDRSB	R0, [R1, #0]
SUBS	R0, R0, #1
STRB	R0, [R1, #0]
;Objective2.c,84 :: 		if(level < 2){
MOVW	R0, #lo_addr(_level+0)
MOVT	R0, #hi_addr(_level+0)
LDRSB	R0, [R0, #0]
CMP	R0, #2
IT	GE
BGE	L_main27
;Objective2.c,85 :: 		score = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_score+0)
MOVT	R0, #hi_addr(_score+0)
STRB	R1, [R0, #0]
;Objective2.c,86 :: 		}
IT	AL
BAL	L_main28
L_main27:
;Objective2.c,87 :: 		else if(level == 2){
MOVW	R0, #lo_addr(_level+0)
MOVT	R0, #hi_addr(_level+0)
LDRSB	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L_main29
;Objective2.c,88 :: 		score = 12;
MOVS	R1, #12
SXTB	R1, R1
MOVW	R0, #lo_addr(_score+0)
MOVT	R0, #hi_addr(_score+0)
STRB	R1, [R0, #0]
;Objective2.c,89 :: 		}
IT	AL
BAL	L_main30
L_main29:
;Objective2.c,90 :: 		else if(level == 3){
MOVW	R0, #lo_addr(_level+0)
MOVT	R0, #hi_addr(_level+0)
LDRSB	R0, [R0, #0]
CMP	R0, #3
IT	NE
BNE	L_main31
;Objective2.c,91 :: 		score = 24;
MOVS	R1, #24
SXTB	R1, R1
MOVW	R0, #lo_addr(_score+0)
MOVT	R0, #hi_addr(_score+0)
STRB	R1, [R0, #0]
;Objective2.c,92 :: 		}
IT	AL
BAL	L_main32
L_main31:
;Objective2.c,93 :: 		else if(level == 4){
MOVW	R0, #lo_addr(_level+0)
MOVT	R0, #hi_addr(_level+0)
LDRSB	R0, [R0, #0]
CMP	R0, #4
IT	NE
BNE	L_main33
;Objective2.c,94 :: 		score = 36;
MOVS	R1, #36
SXTB	R1, R1
MOVW	R0, #lo_addr(_score+0)
MOVT	R0, #hi_addr(_score+0)
STRB	R1, [R0, #0]
;Objective2.c,95 :: 		}
IT	AL
BAL	L_main34
L_main33:
;Objective2.c,96 :: 		else if(level == 5){
MOVW	R0, #lo_addr(_level+0)
MOVT	R0, #hi_addr(_level+0)
LDRSB	R0, [R0, #0]
CMP	R0, #5
IT	NE
BNE	L_main35
;Objective2.c,97 :: 		score = 48;
MOVS	R1, #48
SXTB	R1, R1
MOVW	R0, #lo_addr(_score+0)
MOVT	R0, #hi_addr(_score+0)
STRB	R1, [R0, #0]
;Objective2.c,98 :: 		}
IT	AL
BAL	L_main36
L_main35:
;Objective2.c,99 :: 		else if(level == 6){
MOVW	R0, #lo_addr(_level+0)
MOVT	R0, #hi_addr(_level+0)
LDRSB	R0, [R0, #0]
CMP	R0, #6
IT	NE
BNE	L_main37
;Objective2.c,100 :: 		score = 60;
MOVS	R1, #60
SXTB	R1, R1
MOVW	R0, #lo_addr(_score+0)
MOVT	R0, #hi_addr(_score+0)
STRB	R1, [R0, #0]
;Objective2.c,101 :: 		}
L_main37:
L_main36:
L_main34:
L_main32:
L_main30:
L_main28:
;Objective2.c,102 :: 		delay_ms(100);
MOVW	R7, #20351
MOVT	R7, #18
NOP
NOP
L_main38:
SUBS	R7, R7, #1
BNE	L_main38
NOP
NOP
NOP
;Objective2.c,103 :: 		goto NormalOperation;
IT	AL
BAL	___main_NormalOperation
;Objective2.c,104 :: 		}
L_main26:
;Objective2.c,107 :: 		GameOverScreen();
BL	_GameOverScreen+0
;Objective2.c,108 :: 		level = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_level+0)
MOVT	R0, #hi_addr(_level+0)
STRB	R1, [R0, #0]
;Objective2.c,109 :: 		lives = 3;
MOVS	R1, #3
SXTB	R1, R1
MOVW	R0, #lo_addr(_lives+0)
MOVT	R0, #hi_addr(_lives+0)
STRB	R1, [R0, #0]
;Objective2.c,110 :: 		score = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_score+0)
MOVT	R0, #hi_addr(_score+0)
STRB	R1, [R0, #0]
;Objective2.c,111 :: 		for(;;){
L_main41:
;Objective2.c,112 :: 		if (!GPIOC_IDR.B13){ // CLICK Pressed
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
_LX	[R0, ByteOffset(GPIOC_IDR+0)]
CMP	R0, #0
IT	NE
BNE	L_main44
;Objective2.c,113 :: 		goto NormalOperation;
IT	AL
BAL	___main_NormalOperation
;Objective2.c,114 :: 		}
L_main44:
;Objective2.c,115 :: 		}
IT	AL
BAL	L_main41
;Objective2.c,118 :: 		Finish:
___main_Finish:
;Objective2.c,119 :: 		level = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_level+0)
MOVT	R0, #hi_addr(_level+0)
STRB	R1, [R0, #0]
;Objective2.c,120 :: 		GameFinishedScreen();
BL	_GameFinishedScreen+0
;Objective2.c,121 :: 		for(;;){
L_main45:
;Objective2.c,122 :: 		if (!GPIOC_IDR.B13){ // CLICK Pressed
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
_LX	[R0, ByteOffset(GPIOC_IDR+0)]
CMP	R0, #0
IT	NE
BNE	L_main48
;Objective2.c,123 :: 		goto NormalOperation;
IT	AL
BAL	___main_NormalOperation
;Objective2.c,124 :: 		}
L_main48:
;Objective2.c,125 :: 		}
IT	AL
BAL	L_main45
;Objective2.c,126 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
