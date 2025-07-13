_main:
;Main.c,25 :: 		void main(){
;Main.c,27 :: 		level = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_level+0)
MOVT	R0, #hi_addr(_level+0)
STRB	R1, [R0, #0]
;Main.c,28 :: 		lives = 3;
MOVS	R1, #3
SXTB	R1, R1
MOVW	R0, #lo_addr(_lives+0)
MOVT	R0, #hi_addr(_lives+0)
STRB	R1, [R0, #0]
;Main.c,29 :: 		score = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_score+0)
MOVT	R0, #hi_addr(_score+0)
STRB	R1, [R0, #0]
;Main.c,32 :: 		NormalOperation:
___main_NormalOperation:
;Main.c,33 :: 		delay_ms(10);
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
;Main.c,34 :: 		InitializeHardware();
BL	_InitializeHardware+0
;Main.c,35 :: 		PinInitialize();
BL	_PinInitialize+0
;Main.c,36 :: 		ExternalIntConfiguration();
BL	_ExternalIntConfiguration+0
;Main.c,37 :: 		AdcConfiguration(); // Function to configure ADC on PC0
BL	_AdcConfiguration+0
;Main.c,38 :: 		PlayScreen();
BL	_PlayScreen+0
;Main.c,39 :: 		delay_ms(10);
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
;Main.c,40 :: 		Timer3Configuration();
BL	_Timer3Configuration+0
;Main.c,41 :: 		Timer1Configuration();
BL	_Timer1Configuration+0
;Main.c,43 :: 		for(;;){
L_main4:
;Main.c,52 :: 		Car2.y2 > Frog.y1)
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
;Main.c,55 :: 		break;
IT	AL
BAL	L_main5
;Main.c,56 :: 		}
L_main13:
;Main.c,64 :: 		Car4.y2 > Frog.y1)
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
;Main.c,67 :: 		break;
IT	AL
BAL	L_main5
;Main.c,68 :: 		}
L_main20:
;Main.c,71 :: 		if(Frog.x1 >= DISPLAY_X){
MOVW	R0, #lo_addr(_Frog+0)
MOVT	R0, #hi_addr(_Frog+0)
LDRSH	R0, [R0, #0]
CMP	R0, #320
IT	LT
BLT	L_main21
;Main.c,72 :: 		break;
IT	AL
BAL	L_main5
;Main.c,73 :: 		}
L_main21:
;Main.c,76 :: 		if(timer == 0){
MOVW	R0, #lo_addr(_timer+0)
MOVT	R0, #hi_addr(_timer+0)
LDRSB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_main22
;Main.c,77 :: 		break;
IT	AL
BAL	L_main5
;Main.c,78 :: 		}
L_main22:
;Main.c,81 :: 		if(Frog.row == 2){
MOVW	R0, #lo_addr(_Frog+12)
MOVT	R0, #hi_addr(_Frog+12)
LDRSH	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L_main23
;Main.c,82 :: 		if(level == 6){
MOVW	R0, #lo_addr(_level+0)
MOVT	R0, #hi_addr(_level+0)
LDRSB	R0, [R0, #0]
CMP	R0, #6
IT	NE
BNE	L_main24
;Main.c,83 :: 		goto Finish;
IT	AL
BAL	___main_Finish
;Main.c,84 :: 		}
L_main24:
;Main.c,86 :: 		NextLevelScreen();
BL	_NextLevelScreen+0
;Main.c,87 :: 		goto NormalOperation;
IT	AL
BAL	___main_NormalOperation
;Main.c,89 :: 		}
L_main23:
;Main.c,90 :: 		}
IT	AL
BAL	L_main4
L_main5:
;Main.c,93 :: 		if(lives > 1){
MOVW	R0, #lo_addr(_lives+0)
MOVT	R0, #hi_addr(_lives+0)
LDRSB	R0, [R0, #0]
CMP	R0, #1
IT	LE
BLE	L_main26
;Main.c,95 :: 		TIM3_CR1 = 0x0000;  // Disable timer
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;Main.c,96 :: 		TIM1_CR1 = 0x0000;  // Disable timer
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM1_CR1+0)
MOVT	R0, #hi_addr(TIM1_CR1+0)
STR	R1, [R0, #0]
;Main.c,98 :: 		EXTI_IMR = (0 << 2) | (0 << 4) | (0 << 5) | (0 << 6) | (0 << 13);
MOVW	R1, #0
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
STR	R1, [R0, #0]
;Main.c,99 :: 		lives = lives -1;
MOVW	R1, #lo_addr(_lives+0)
MOVT	R1, #hi_addr(_lives+0)
LDRSB	R0, [R1, #0]
SUBS	R0, R0, #1
STRB	R0, [R1, #0]
;Main.c,100 :: 		if(level == 1){
MOVW	R0, #lo_addr(_level+0)
MOVT	R0, #hi_addr(_level+0)
LDRSB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_main27
;Main.c,101 :: 		score = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_score+0)
MOVT	R0, #hi_addr(_score+0)
STRB	R1, [R0, #0]
;Main.c,102 :: 		}
IT	AL
BAL	L_main28
L_main27:
;Main.c,103 :: 		else if(level == 2){
MOVW	R0, #lo_addr(_level+0)
MOVT	R0, #hi_addr(_level+0)
LDRSB	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L_main29
;Main.c,104 :: 		score = 12;
MOVS	R1, #12
SXTB	R1, R1
MOVW	R0, #lo_addr(_score+0)
MOVT	R0, #hi_addr(_score+0)
STRB	R1, [R0, #0]
;Main.c,105 :: 		}
IT	AL
BAL	L_main30
L_main29:
;Main.c,106 :: 		else if(level == 3){
MOVW	R0, #lo_addr(_level+0)
MOVT	R0, #hi_addr(_level+0)
LDRSB	R0, [R0, #0]
CMP	R0, #3
IT	NE
BNE	L_main31
;Main.c,107 :: 		score = 24;
MOVS	R1, #24
SXTB	R1, R1
MOVW	R0, #lo_addr(_score+0)
MOVT	R0, #hi_addr(_score+0)
STRB	R1, [R0, #0]
;Main.c,108 :: 		}
IT	AL
BAL	L_main32
L_main31:
;Main.c,109 :: 		else if(level == 4){
MOVW	R0, #lo_addr(_level+0)
MOVT	R0, #hi_addr(_level+0)
LDRSB	R0, [R0, #0]
CMP	R0, #4
IT	NE
BNE	L_main33
;Main.c,110 :: 		score = 36;
MOVS	R1, #36
SXTB	R1, R1
MOVW	R0, #lo_addr(_score+0)
MOVT	R0, #hi_addr(_score+0)
STRB	R1, [R0, #0]
;Main.c,111 :: 		}
IT	AL
BAL	L_main34
L_main33:
;Main.c,112 :: 		else if(level == 5){
MOVW	R0, #lo_addr(_level+0)
MOVT	R0, #hi_addr(_level+0)
LDRSB	R0, [R0, #0]
CMP	R0, #5
IT	NE
BNE	L_main35
;Main.c,113 :: 		score = 48;
MOVS	R1, #48
SXTB	R1, R1
MOVW	R0, #lo_addr(_score+0)
MOVT	R0, #hi_addr(_score+0)
STRB	R1, [R0, #0]
;Main.c,114 :: 		}
IT	AL
BAL	L_main36
L_main35:
;Main.c,115 :: 		else if(level == 6){
MOVW	R0, #lo_addr(_level+0)
MOVT	R0, #hi_addr(_level+0)
LDRSB	R0, [R0, #0]
CMP	R0, #6
IT	NE
BNE	L_main37
;Main.c,116 :: 		score = 60;
MOVS	R1, #60
SXTB	R1, R1
MOVW	R0, #lo_addr(_score+0)
MOVT	R0, #hi_addr(_score+0)
STRB	R1, [R0, #0]
;Main.c,117 :: 		}
L_main37:
L_main36:
L_main34:
L_main32:
L_main30:
L_main28:
;Main.c,118 :: 		delay_ms(100);
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
;Main.c,119 :: 		goto NormalOperation;
IT	AL
BAL	___main_NormalOperation
;Main.c,120 :: 		}
L_main26:
;Main.c,124 :: 		GameOverScreen();
BL	_GameOverScreen+0
;Main.c,125 :: 		level = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_level+0)
MOVT	R0, #hi_addr(_level+0)
STRB	R1, [R0, #0]
;Main.c,126 :: 		lives = 3;
MOVS	R1, #3
SXTB	R1, R1
MOVW	R0, #lo_addr(_lives+0)
MOVT	R0, #hi_addr(_lives+0)
STRB	R1, [R0, #0]
;Main.c,127 :: 		score = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_score+0)
MOVT	R0, #hi_addr(_score+0)
STRB	R1, [R0, #0]
;Main.c,128 :: 		for(;;){
L_main41:
;Main.c,129 :: 		if (!GPIOC_IDR.B13){ // CLICK Pressed
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
_LX	[R0, ByteOffset(GPIOC_IDR+0)]
CMP	R0, #0
IT	NE
BNE	L_main44
;Main.c,130 :: 		goto NormalOperation;
IT	AL
BAL	___main_NormalOperation
;Main.c,131 :: 		}
L_main44:
;Main.c,132 :: 		}
IT	AL
BAL	L_main41
;Main.c,135 :: 		Finish:
___main_Finish:
;Main.c,136 :: 		level = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_level+0)
MOVT	R0, #hi_addr(_level+0)
STRB	R1, [R0, #0]
;Main.c,137 :: 		GameFinishedScreen();
BL	_GameFinishedScreen+0
;Main.c,138 :: 		for(;;){
L_main45:
;Main.c,139 :: 		if (!GPIOC_IDR.B13){ // CLICK Pressed
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
_LX	[R0, ByteOffset(GPIOC_IDR+0)]
CMP	R0, #0
IT	NE
BNE	L_main48
;Main.c,140 :: 		goto NormalOperation;
IT	AL
BAL	___main_NormalOperation
;Main.c,141 :: 		}
L_main48:
;Main.c,142 :: 		}
IT	AL
BAL	L_main45
;Main.c,143 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
