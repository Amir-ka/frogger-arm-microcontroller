_Timer1_IRQHandler:
;PlayScreen.c,46 :: 		void Timer1_IRQHandler() iv IVT_INT_TIM1_UP {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;PlayScreen.c,47 :: 		TIM1_SR.UIF = 0; // Clear this flag which will reset the timer
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM1_SR+0)
MOVT	R0, #hi_addr(TIM1_SR+0)
_SX	[R0, ByteOffset(TIM1_SR+0)]
;PlayScreen.c,48 :: 		counter = counter + 1; // Add 1 second to counter
MOVW	R1, #lo_addr(_counter+0)
MOVT	R1, #hi_addr(_counter+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;PlayScreen.c,51 :: 		TFT_Set_Brush(1, CL_SILVER,0,0,0,0);
MOVS	R1, #0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #50712
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;PlayScreen.c,52 :: 		TFT_Rectangle(45,GRID_SIZE*0, 65, GRID_SIZE*1);
MOVW	R3, #16
SXTH	R3, R3
MOVS	R2, #65
SXTH	R2, R2
MOVW	R1, #0
SXTH	R1, R1
MOVS	R0, #45
SXTH	R0, R0
BL	_TFT_Rectangle+0
;PlayScreen.c,53 :: 		if(timer > 0){
MOVW	R0, #lo_addr(_timer+0)
MOVT	R0, #hi_addr(_timer+0)
LDRSB	R0, [R0, #0]
CMP	R0, #0
IT	LE
BLE	L_Timer1_IRQHandler0
;PlayScreen.c,54 :: 		timer = timer-1; //Count down if the timer is more than 0
MOVW	R1, #lo_addr(_timer+0)
MOVT	R1, #hi_addr(_timer+0)
LDRSB	R0, [R1, #0]
SUBS	R0, R0, #1
STRB	R0, [R1, #0]
;PlayScreen.c,55 :: 		}
L_Timer1_IRQHandler0:
;PlayScreen.c,56 :: 		timer1 = timer/10 + 48;
MOVW	R2, #lo_addr(_timer+0)
MOVT	R2, #hi_addr(_timer+0)
LDRSB	R1, [R2, #0]
MOVS	R0, #10
SXTB	R0, R0
SDIV	R0, R1, R0
SXTB	R0, R0
ADDW	R3, R0, #48
MOVW	R0, #lo_addr(_timer1+0)
MOVT	R0, #hi_addr(_timer1+0)
STRB	R3, [R0, #0]
;PlayScreen.c,57 :: 		timer0 = timer%10 + 48;
MOV	R0, R2
LDRSB	R2, [R0, #0]
MOVS	R1, #10
SXTB	R1, R1
SDIV	R0, R2, R1
MLS	R0, R1, R0, R2
SXTB	R0, R0
ADDW	R1, R0, #48
MOVW	R0, #lo_addr(_timer0+0)
MOVT	R0, #hi_addr(_timer0+0)
STRB	R1, [R0, #0]
;PlayScreen.c,58 :: 		TFT_Write_Char(timer1,45, 0);
UXTB	R0, R3
MOVS	R2, #0
MOVS	R1, #45
BL	_TFT_Write_Char+0
;PlayScreen.c,59 :: 		TFT_Write_Char(timer0,55, 0);
MOVW	R0, #lo_addr(_timer0+0)
MOVT	R0, #hi_addr(_timer0+0)
LDRB	R0, [R0, #0]
MOVS	R2, #0
MOVS	R1, #55
BL	_TFT_Write_Char+0
;PlayScreen.c,62 :: 		TFT_Set_Brush(1, CL_SILVER,0,0,0,0);
MOVS	R1, #0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #50712
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;PlayScreen.c,63 :: 		TFT_Rectangle(60,GRID_SIZE*1, 90, GRID_SIZE*2);
MOVW	R3, #32
SXTH	R3, R3
MOVS	R2, #90
SXTH	R2, R2
MOVW	R1, #16
SXTH	R1, R1
MOVS	R0, #60
SXTH	R0, R0
BL	_TFT_Rectangle+0
;PlayScreen.c,64 :: 		counter2 = counter/100 + 48;
MOVW	R4, #lo_addr(_counter+0)
MOVT	R4, #hi_addr(_counter+0)
LDRSH	R1, [R4, #0]
MOVS	R0, #100
SXTH	R0, R0
SDIV	R0, R1, R0
SXTH	R0, R0
ADDW	R3, R0, #48
MOVW	R0, #lo_addr(_counter2+0)
MOVT	R0, #hi_addr(_counter2+0)
STRB	R3, [R0, #0]
;PlayScreen.c,65 :: 		counter1 = (counter/10)%10 + 48;
MOV	R0, R4
LDRSH	R1, [R0, #0]
MOVS	R0, #10
SXTH	R0, R0
SDIV	R2, R1, R0
SXTH	R2, R2
MOVS	R1, #10
SXTH	R1, R1
SDIV	R0, R2, R1
MLS	R0, R1, R0, R2
SXTH	R0, R0
ADDW	R1, R0, #48
MOVW	R0, #lo_addr(_counter1+0)
MOVT	R0, #hi_addr(_counter1+0)
STRB	R1, [R0, #0]
;PlayScreen.c,66 :: 		counter0 = counter%10 + 48;
MOV	R0, R4
LDRSH	R2, [R0, #0]
MOVS	R1, #10
SXTH	R1, R1
SDIV	R0, R2, R1
MLS	R0, R1, R0, R2
SXTH	R0, R0
ADDW	R1, R0, #48
MOVW	R0, #lo_addr(_counter0+0)
MOVT	R0, #hi_addr(_counter0+0)
STRB	R1, [R0, #0]
;PlayScreen.c,67 :: 		TFT_Write_Char(counter2,60, GRID_SIZE);
UXTB	R0, R3
MOVW	R2, #16
MOVS	R1, #60
BL	_TFT_Write_Char+0
;PlayScreen.c,68 :: 		TFT_Write_Char(counter1,70, GRID_SIZE);
MOVW	R0, #lo_addr(_counter1+0)
MOVT	R0, #hi_addr(_counter1+0)
LDRB	R0, [R0, #0]
MOVW	R2, #16
MOVS	R1, #70
BL	_TFT_Write_Char+0
;PlayScreen.c,69 :: 		TFT_Write_Char(counter0,80, GRID_SIZE);
MOVW	R0, #lo_addr(_counter0+0)
MOVT	R0, #hi_addr(_counter0+0)
LDRB	R0, [R0, #0]
MOVW	R2, #16
MOVS	R1, #80
BL	_TFT_Write_Char+0
;PlayScreen.c,70 :: 		}
L_end_Timer1_IRQHandler:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Timer1_IRQHandler
_TIMER3_ISR:
;PlayScreen.c,73 :: 		void TIMER3_ISR () iv IVT_INT_TIM3 {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;PlayScreen.c,74 :: 		speedcal();
BL	_speedcal+0
;PlayScreen.c,75 :: 		TIM3_ARR = 841+5909/adcVal - 148 * (level - 1); //set ARR of timer 3 so that we get 100ms to 750ms from the timer
MOVW	R0, #lo_addr(_adcVal+0)
MOVT	R0, #hi_addr(_adcVal+0)
LDRH	R1, [R0, #0]
MOVW	R0, #5909
UDIV	R0, R0, R1
UXTH	R0, R0
ADDW	R2, R0, #841
UXTH	R2, R2
MOVW	R0, #lo_addr(_level+0)
MOVT	R0, #hi_addr(_level+0)
LDRSB	R0, [R0, #0]
SUBS	R1, R0, #1
SXTH	R1, R1
MOVS	R0, #148
SXTH	R0, R0
MULS	R0, R1, R0
SXTH	R0, R0
SUB	R1, R2, R0
UXTH	R1, R1
MOVW	R0, #lo_addr(TIM3_ARR+0)
MOVT	R0, #hi_addr(TIM3_ARR+0)
STR	R1, [R0, #0]
;PlayScreen.c,77 :: 		TIM3_SR.UIF = 0;                  // Clear this flag which will reset the timer
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_SR+0)
MOVT	R0, #hi_addr(TIM3_SR+0)
_SX	[R0, ByteOffset(TIM3_SR+0)]
;PlayScreen.c,80 :: 		TFT_Set_Brush(1, CL_BLACK,0,0,0,0); // Erase previous position
MOVS	R1, #0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #0
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;PlayScreen.c,81 :: 		TFT_Rectangle(Car1.x1,Car1.y1,Car1.x2,Car1.y2);
MOVW	R0, #lo_addr(_Car1+6)
MOVT	R0, #hi_addr(_Car1+6)
LDRSH	R3, [R0, #0]
MOVW	R0, #lo_addr(_Car1+4)
MOVT	R0, #hi_addr(_Car1+4)
LDRSH	R2, [R0, #0]
MOVW	R0, #lo_addr(_Car1+2)
MOVT	R0, #hi_addr(_Car1+2)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Car1+0)
MOVT	R0, #hi_addr(_Car1+0)
LDRSH	R0, [R0, #0]
BL	_TFT_Rectangle+0
;PlayScreen.c,82 :: 		if(Car1.x1 == DISPLAY_X){
MOVW	R0, #lo_addr(_Car1+0)
MOVT	R0, #hi_addr(_Car1+0)
LDRSH	R0, [R0, #0]
CMP	R0, #320
IT	NE
BNE	L_TIMER3_ISR1
;PlayScreen.c,83 :: 		Car1.x1 = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_Car1+0)
MOVT	R0, #hi_addr(_Car1+0)
STRH	R1, [R0, #0]
;PlayScreen.c,84 :: 		Car1.x2 = Car1.x1 + 2 * GRID_SIZE;
MOVW	R1, #32
SXTH	R1, R1
MOVW	R0, #lo_addr(_Car1+4)
MOVT	R0, #hi_addr(_Car1+4)
STRH	R1, [R0, #0]
;PlayScreen.c,85 :: 		}
IT	AL
BAL	L_TIMER3_ISR2
L_TIMER3_ISR1:
;PlayScreen.c,87 :: 		Car1.x1 = Car1.x1 + GRID_SIZE; // Update position
MOVW	R1, #lo_addr(_Car1+0)
MOVT	R1, #hi_addr(_Car1+0)
LDRSH	R0, [R1, #0]
ADDS	R0, #16
STRH	R0, [R1, #0]
;PlayScreen.c,88 :: 		Car1.x2 = Car1.x2 + GRID_SIZE;
MOVW	R1, #lo_addr(_Car1+4)
MOVT	R1, #hi_addr(_Car1+4)
LDRSH	R0, [R1, #0]
ADDS	R0, #16
STRH	R0, [R1, #0]
;PlayScreen.c,89 :: 		}
L_TIMER3_ISR2:
;PlayScreen.c,90 :: 		TFT_Set_Brush(1, Car1.color,0,0,0,0); // Draw new position
MOVS	R2, #0
MOVS	R1, #0
MOVW	R0, #lo_addr(_Car1+8)
MOVT	R0, #hi_addr(_Car1+8)
LDRSH	R0, [R0, #0]
PUSH	(R2)
PUSH	(R1)
MOVS	R3, #0
MOVS	R2, #0
UXTH	R1, R0
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;PlayScreen.c,91 :: 		TFT_Rectangle(Car1.x1,Car1.y1,Car1.x2,Car1.y2);
MOVW	R0, #lo_addr(_Car1+6)
MOVT	R0, #hi_addr(_Car1+6)
LDRSH	R3, [R0, #0]
MOVW	R0, #lo_addr(_Car1+4)
MOVT	R0, #hi_addr(_Car1+4)
LDRSH	R2, [R0, #0]
MOVW	R0, #lo_addr(_Car1+2)
MOVT	R0, #hi_addr(_Car1+2)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Car1+0)
MOVT	R0, #hi_addr(_Car1+0)
LDRSH	R0, [R0, #0]
BL	_TFT_Rectangle+0
;PlayScreen.c,94 :: 		TFT_Set_Brush(1, CL_BLACK,0,0,0,0); // Erase previous position
MOVS	R1, #0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #0
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;PlayScreen.c,95 :: 		TFT_Rectangle(Car2.x1,Car2.y1,Car2.x2,Car2.y2);
MOVW	R0, #lo_addr(_Car2+6)
MOVT	R0, #hi_addr(_Car2+6)
LDRSH	R3, [R0, #0]
MOVW	R0, #lo_addr(_Car2+4)
MOVT	R0, #hi_addr(_Car2+4)
LDRSH	R2, [R0, #0]
MOVW	R0, #lo_addr(_Car2+2)
MOVT	R0, #hi_addr(_Car2+2)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Car2+0)
MOVT	R0, #hi_addr(_Car2+0)
LDRSH	R0, [R0, #0]
BL	_TFT_Rectangle+0
;PlayScreen.c,96 :: 		if(Car2.x1 == DISPLAY_X){
MOVW	R0, #lo_addr(_Car2+0)
MOVT	R0, #hi_addr(_Car2+0)
LDRSH	R0, [R0, #0]
CMP	R0, #320
IT	NE
BNE	L_TIMER3_ISR3
;PlayScreen.c,97 :: 		Car2.x1 = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_Car2+0)
MOVT	R0, #hi_addr(_Car2+0)
STRH	R1, [R0, #0]
;PlayScreen.c,98 :: 		Car2.x2 = Car2.x1 + 2 * GRID_SIZE;
MOVW	R1, #32
SXTH	R1, R1
MOVW	R0, #lo_addr(_Car2+4)
MOVT	R0, #hi_addr(_Car2+4)
STRH	R1, [R0, #0]
;PlayScreen.c,99 :: 		}
IT	AL
BAL	L_TIMER3_ISR4
L_TIMER3_ISR3:
;PlayScreen.c,101 :: 		Car2.x1 = Car2.x1 + GRID_SIZE; // Update position
MOVW	R1, #lo_addr(_Car2+0)
MOVT	R1, #hi_addr(_Car2+0)
LDRSH	R0, [R1, #0]
ADDS	R0, #16
STRH	R0, [R1, #0]
;PlayScreen.c,102 :: 		Car2.x2 = Car2.x2 + GRID_SIZE;
MOVW	R1, #lo_addr(_Car2+4)
MOVT	R1, #hi_addr(_Car2+4)
LDRSH	R0, [R1, #0]
ADDS	R0, #16
STRH	R0, [R1, #0]
;PlayScreen.c,103 :: 		}
L_TIMER3_ISR4:
;PlayScreen.c,104 :: 		TFT_Set_Brush(1, Car2.color,0,0,0,0); // Draw new position
MOVS	R2, #0
MOVS	R1, #0
MOVW	R0, #lo_addr(_Car2+8)
MOVT	R0, #hi_addr(_Car2+8)
LDRSH	R0, [R0, #0]
PUSH	(R2)
PUSH	(R1)
MOVS	R3, #0
MOVS	R2, #0
UXTH	R1, R0
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;PlayScreen.c,105 :: 		TFT_Rectangle(Car2.x1,Car2.y1,Car2.x2,Car2.y2);
MOVW	R0, #lo_addr(_Car2+6)
MOVT	R0, #hi_addr(_Car2+6)
LDRSH	R3, [R0, #0]
MOVW	R0, #lo_addr(_Car2+4)
MOVT	R0, #hi_addr(_Car2+4)
LDRSH	R2, [R0, #0]
MOVW	R0, #lo_addr(_Car2+2)
MOVT	R0, #hi_addr(_Car2+2)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Car2+0)
MOVT	R0, #hi_addr(_Car2+0)
LDRSH	R0, [R0, #0]
BL	_TFT_Rectangle+0
;PlayScreen.c,108 :: 		TFT_Set_Brush(1, CL_BLACK,0,0,0,0); // Erase previous position
MOVS	R1, #0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #0
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;PlayScreen.c,109 :: 		TFT_Rectangle(Car3.x1,Car3.y1,Car3.x2,Car3.y2);
MOVW	R0, #lo_addr(_Car3+6)
MOVT	R0, #hi_addr(_Car3+6)
LDRSH	R3, [R0, #0]
MOVW	R0, #lo_addr(_Car3+4)
MOVT	R0, #hi_addr(_Car3+4)
LDRSH	R2, [R0, #0]
MOVW	R0, #lo_addr(_Car3+2)
MOVT	R0, #hi_addr(_Car3+2)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Car3+0)
MOVT	R0, #hi_addr(_Car3+0)
LDRSH	R0, [R0, #0]
BL	_TFT_Rectangle+0
;PlayScreen.c,110 :: 		if(Car3.x1 == DISPLAY_X){
MOVW	R0, #lo_addr(_Car3+0)
MOVT	R0, #hi_addr(_Car3+0)
LDRSH	R0, [R0, #0]
CMP	R0, #320
IT	NE
BNE	L_TIMER3_ISR5
;PlayScreen.c,111 :: 		Car3.x1 = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_Car3+0)
MOVT	R0, #hi_addr(_Car3+0)
STRH	R1, [R0, #0]
;PlayScreen.c,112 :: 		Car3.x2 = Car3.x1 + 2 * GRID_SIZE;
MOVW	R1, #32
SXTH	R1, R1
MOVW	R0, #lo_addr(_Car3+4)
MOVT	R0, #hi_addr(_Car3+4)
STRH	R1, [R0, #0]
;PlayScreen.c,113 :: 		}
IT	AL
BAL	L_TIMER3_ISR6
L_TIMER3_ISR5:
;PlayScreen.c,115 :: 		Car3.x1 = Car3.x1 + GRID_SIZE; // Update position
MOVW	R1, #lo_addr(_Car3+0)
MOVT	R1, #hi_addr(_Car3+0)
LDRSH	R0, [R1, #0]
ADDS	R0, #16
STRH	R0, [R1, #0]
;PlayScreen.c,116 :: 		Car3.x2 = Car3.x2 + GRID_SIZE;
MOVW	R1, #lo_addr(_Car3+4)
MOVT	R1, #hi_addr(_Car3+4)
LDRSH	R0, [R1, #0]
ADDS	R0, #16
STRH	R0, [R1, #0]
;PlayScreen.c,117 :: 		}
L_TIMER3_ISR6:
;PlayScreen.c,118 :: 		TFT_Set_Brush(1, Car3.color,0,0,0,0); // Draw new position
MOVS	R2, #0
MOVS	R1, #0
MOVW	R0, #lo_addr(_Car3+8)
MOVT	R0, #hi_addr(_Car3+8)
LDRSH	R0, [R0, #0]
PUSH	(R2)
PUSH	(R1)
MOVS	R3, #0
MOVS	R2, #0
UXTH	R1, R0
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;PlayScreen.c,119 :: 		TFT_Rectangle(Car3.x1,Car3.y1,Car3.x2,Car3.y2);
MOVW	R0, #lo_addr(_Car3+6)
MOVT	R0, #hi_addr(_Car3+6)
LDRSH	R3, [R0, #0]
MOVW	R0, #lo_addr(_Car3+4)
MOVT	R0, #hi_addr(_Car3+4)
LDRSH	R2, [R0, #0]
MOVW	R0, #lo_addr(_Car3+2)
MOVT	R0, #hi_addr(_Car3+2)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Car3+0)
MOVT	R0, #hi_addr(_Car3+0)
LDRSH	R0, [R0, #0]
BL	_TFT_Rectangle+0
;PlayScreen.c,122 :: 		TFT_Set_Brush(1, CL_BLACK,0,0,0,0); // Erase previous position
MOVS	R1, #0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #0
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;PlayScreen.c,123 :: 		TFT_Rectangle(Car4.x1,Car4.y1,Car4.x2,Car4.y2);
MOVW	R0, #lo_addr(_Car4+6)
MOVT	R0, #hi_addr(_Car4+6)
LDRSH	R3, [R0, #0]
MOVW	R0, #lo_addr(_Car4+4)
MOVT	R0, #hi_addr(_Car4+4)
LDRSH	R2, [R0, #0]
MOVW	R0, #lo_addr(_Car4+2)
MOVT	R0, #hi_addr(_Car4+2)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Car4+0)
MOVT	R0, #hi_addr(_Car4+0)
LDRSH	R0, [R0, #0]
BL	_TFT_Rectangle+0
;PlayScreen.c,124 :: 		if(Car4.x1 == DISPLAY_X){
MOVW	R0, #lo_addr(_Car4+0)
MOVT	R0, #hi_addr(_Car4+0)
LDRSH	R0, [R0, #0]
CMP	R0, #320
IT	NE
BNE	L_TIMER3_ISR7
;PlayScreen.c,125 :: 		Car4.x1 = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_Car4+0)
MOVT	R0, #hi_addr(_Car4+0)
STRH	R1, [R0, #0]
;PlayScreen.c,126 :: 		Car4.x2 = Car4.x1 + 2 * GRID_SIZE;
MOVW	R1, #32
SXTH	R1, R1
MOVW	R0, #lo_addr(_Car4+4)
MOVT	R0, #hi_addr(_Car4+4)
STRH	R1, [R0, #0]
;PlayScreen.c,127 :: 		}
IT	AL
BAL	L_TIMER3_ISR8
L_TIMER3_ISR7:
;PlayScreen.c,129 :: 		Car4.x1 = Car4.x1 + GRID_SIZE; // Update position
MOVW	R1, #lo_addr(_Car4+0)
MOVT	R1, #hi_addr(_Car4+0)
LDRSH	R0, [R1, #0]
ADDS	R0, #16
STRH	R0, [R1, #0]
;PlayScreen.c,130 :: 		Car4.x2 = Car4.x2 + GRID_SIZE;
MOVW	R1, #lo_addr(_Car4+4)
MOVT	R1, #hi_addr(_Car4+4)
LDRSH	R0, [R1, #0]
ADDS	R0, #16
STRH	R0, [R1, #0]
;PlayScreen.c,131 :: 		}
L_TIMER3_ISR8:
;PlayScreen.c,132 :: 		TFT_Set_Brush(1, Car4.color,0,0,0,0); // Draw new position
MOVS	R2, #0
MOVS	R1, #0
MOVW	R0, #lo_addr(_Car4+8)
MOVT	R0, #hi_addr(_Car4+8)
LDRSH	R0, [R0, #0]
PUSH	(R2)
PUSH	(R1)
MOVS	R3, #0
MOVS	R2, #0
UXTH	R1, R0
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;PlayScreen.c,133 :: 		TFT_Rectangle(Car4.x1,Car4.y1,Car4.x2,Car4.y2);
MOVW	R0, #lo_addr(_Car4+6)
MOVT	R0, #hi_addr(_Car4+6)
LDRSH	R3, [R0, #0]
MOVW	R0, #lo_addr(_Car4+4)
MOVT	R0, #hi_addr(_Car4+4)
LDRSH	R2, [R0, #0]
MOVW	R0, #lo_addr(_Car4+2)
MOVT	R0, #hi_addr(_Car4+2)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Car4+0)
MOVT	R0, #hi_addr(_Car4+0)
LDRSH	R0, [R0, #0]
BL	_TFT_Rectangle+0
;PlayScreen.c,136 :: 		if(9 * GRID_SIZE > Frog.y1 && 3 * GRID_SIZE < Frog.y1)
MOVW	R0, #lo_addr(_Frog+2)
MOVT	R0, #hi_addr(_Frog+2)
LDRSH	R0, [R0, #0]
CMP	R0, #144
IT	GE
BGE	L__TIMER3_ISR59
MOVW	R0, #lo_addr(_Frog+2)
MOVT	R0, #hi_addr(_Frog+2)
LDRSH	R0, [R0, #0]
CMP	R0, #48
IT	LE
BLE	L__TIMER3_ISR58
L__TIMER3_ISR57:
;PlayScreen.c,138 :: 		TFT_Set_Brush(1, CL_BLUE,0,0,0,0); // Erase previous position
MOVS	R1, #0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #31
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;PlayScreen.c,139 :: 		TFT_Rectangle(Frog.x1,Frog.y1,Frog.x2,Frog.y2);
MOVW	R0, #lo_addr(_Frog+6)
MOVT	R0, #hi_addr(_Frog+6)
LDRSH	R3, [R0, #0]
MOVW	R0, #lo_addr(_Frog+4)
MOVT	R0, #hi_addr(_Frog+4)
LDRSH	R2, [R0, #0]
MOVW	R0, #lo_addr(_Frog+2)
MOVT	R0, #hi_addr(_Frog+2)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Frog+0)
MOVT	R0, #hi_addr(_Frog+0)
LDRSH	R0, [R0, #0]
BL	_TFT_Rectangle+0
;PlayScreen.c,140 :: 		Frog.x1 = Frog.x1 + GRID_SIZE; // Update position
MOVW	R1, #lo_addr(_Frog+0)
MOVT	R1, #hi_addr(_Frog+0)
LDRSH	R0, [R1, #0]
ADDS	R0, #16
STRH	R0, [R1, #0]
;PlayScreen.c,141 :: 		Frog.x2 = Frog.x2 + GRID_SIZE;
MOVW	R1, #lo_addr(_Frog+4)
MOVT	R1, #hi_addr(_Frog+4)
LDRSH	R0, [R1, #0]
ADDS	R0, #16
STRH	R0, [R1, #0]
;PlayScreen.c,143 :: 		TFT_Set_Brush(1, Frog.color,0,0,0,0); // draw new position
MOVS	R2, #0
MOVS	R1, #0
MOVW	R0, #lo_addr(_Frog+8)
MOVT	R0, #hi_addr(_Frog+8)
LDRSH	R0, [R0, #0]
PUSH	(R2)
PUSH	(R1)
MOVS	R3, #0
MOVS	R2, #0
UXTH	R1, R0
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;PlayScreen.c,144 :: 		TFT_Rectangle(Frog.x1,Frog.y1,Frog.x2,Frog.y2);
MOVW	R0, #lo_addr(_Frog+6)
MOVT	R0, #hi_addr(_Frog+6)
LDRSH	R3, [R0, #0]
MOVW	R0, #lo_addr(_Frog+4)
MOVT	R0, #hi_addr(_Frog+4)
LDRSH	R2, [R0, #0]
MOVW	R0, #lo_addr(_Frog+2)
MOVT	R0, #hi_addr(_Frog+2)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Frog+0)
MOVT	R0, #hi_addr(_Frog+0)
LDRSH	R0, [R0, #0]
BL	_TFT_Rectangle+0
;PlayScreen.c,136 :: 		if(9 * GRID_SIZE > Frog.y1 && 3 * GRID_SIZE < Frog.y1)
L__TIMER3_ISR59:
L__TIMER3_ISR58:
;PlayScreen.c,146 :: 		}
L_end_TIMER3_ISR:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _TIMER3_ISR
_JoystickUp:
;PlayScreen.c,148 :: 		void JoystickUp () iv IVT_INT_EXTI4 {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;PlayScreen.c,150 :: 		EXTI_PR.B4 = 1; // Clear pending flag for EXTI4
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
_SX	[R0, ByteOffset(EXTI_PR+0)]
;PlayScreen.c,151 :: 		if(Frog.y1 > 2 * GRID_SIZE){ // Check for collision with border
MOVW	R0, #lo_addr(_Frog+2)
MOVT	R0, #hi_addr(_Frog+2)
LDRSH	R0, [R0, #0]
CMP	R0, #32
IT	LE
BLE	L_JoystickUp12
;PlayScreen.c,155 :: 		Frog.x1 == 16*GRID_SIZE){
MOVW	R0, #lo_addr(_Frog+2)
MOVT	R0, #hi_addr(_Frog+2)
LDRSH	R0, [R0, #0]
CMP	R0, #64
IT	GT
BGT	L__JoystickUp67
MOVW	R0, #lo_addr(_Frog+0)
MOVT	R0, #hi_addr(_Frog+0)
LDRSH	R0, [R0, #0]
CMP	R0, #48
IT	EQ
BEQ	L__JoystickUp66
MOVW	R0, #lo_addr(_Frog+0)
MOVT	R0, #hi_addr(_Frog+0)
LDRSH	R0, [R0, #0]
CMP	R0, #64
IT	EQ
BEQ	L__JoystickUp65
MOVW	R0, #lo_addr(_Frog+0)
MOVT	R0, #hi_addr(_Frog+0)
LDRSH	R0, [R0, #0]
CMP	R0, #144
IT	EQ
BEQ	L__JoystickUp64
MOVW	R0, #lo_addr(_Frog+0)
MOVT	R0, #hi_addr(_Frog+0)
LDRSH	R0, [R0, #0]
CMP	R0, #160
IT	EQ
BEQ	L__JoystickUp63
MOVW	R0, #lo_addr(_Frog+0)
MOVT	R0, #hi_addr(_Frog+0)
LDRSH	R0, [R0, #0]
CMP	R0, #240
IT	EQ
BEQ	L__JoystickUp62
MOVW	R0, #lo_addr(_Frog+0)
MOVT	R0, #hi_addr(_Frog+0)
LDRSH	R0, [R0, #0]
CMP	R0, #256
IT	EQ
BEQ	L__JoystickUp61
IT	AL
BAL	L_JoystickUp15
L__JoystickUp67:
L__JoystickUp66:
L__JoystickUp65:
L__JoystickUp64:
L__JoystickUp63:
L__JoystickUp62:
L__JoystickUp61:
;PlayScreen.c,156 :: 		Sound_Play(10, 100); // Play sound of 10Hz in duration of 100ms
MOVS	R1, #100
MOVS	R0, #10
BL	_Sound_Play+0
;PlayScreen.c,157 :: 		Frog.row -= 1;
MOVW	R1, #lo_addr(_Frog+12)
MOVT	R1, #hi_addr(_Frog+12)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;PlayScreen.c,158 :: 		TFT_Set_Brush(1, RowColor[Frog.row + 1],0,0,0,0); // Replace previous position
MOVS	R3, #0
MOVS	R2, #0
ADDS	R0, R0, #1
SXTH	R0, R0
LSLS	R1, R0, #1
MOVW	R0, #lo_addr(_RowColor+0)
MOVT	R0, #hi_addr(_RowColor+0)
ADDS	R0, R0, R1
LDRSH	R0, [R0, #0]
UXTH	R0, R0
PUSH	(R3)
PUSH	(R2)
MOVS	R3, #0
MOVS	R2, #0
UXTH	R1, R0
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;PlayScreen.c,159 :: 		TFT_Rectangle(Frog.x1,Frog.y1,Frog.x2,Frog.y2);
MOVW	R0, #lo_addr(_Frog+6)
MOVT	R0, #hi_addr(_Frog+6)
LDRSH	R3, [R0, #0]
MOVW	R0, #lo_addr(_Frog+4)
MOVT	R0, #hi_addr(_Frog+4)
LDRSH	R2, [R0, #0]
MOVW	R0, #lo_addr(_Frog+2)
MOVT	R0, #hi_addr(_Frog+2)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Frog+0)
MOVT	R0, #hi_addr(_Frog+0)
LDRSH	R0, [R0, #0]
BL	_TFT_Rectangle+0
;PlayScreen.c,160 :: 		Frog.y1 = Frog.y1 - GRID_SIZE; // Update position
MOVW	R1, #lo_addr(_Frog+2)
MOVT	R1, #hi_addr(_Frog+2)
LDRSH	R0, [R1, #0]
SUBS	R0, #16
STRH	R0, [R1, #0]
;PlayScreen.c,161 :: 		Frog.y2 = Frog.y2 - GRID_SIZE;
MOVW	R1, #lo_addr(_Frog+6)
MOVT	R1, #hi_addr(_Frog+6)
LDRSH	R0, [R1, #0]
SUBS	R0, #16
STRH	R0, [R1, #0]
;PlayScreen.c,163 :: 		TFT_Set_Brush(1, Frog.color,0,0,0,0); // draw new position
MOVS	R2, #0
MOVS	R1, #0
MOVW	R0, #lo_addr(_Frog+8)
MOVT	R0, #hi_addr(_Frog+8)
LDRSH	R0, [R0, #0]
PUSH	(R2)
PUSH	(R1)
MOVS	R3, #0
MOVS	R2, #0
UXTH	R1, R0
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;PlayScreen.c,164 :: 		TFT_Rectangle(Frog.x1,Frog.y1,Frog.x2,Frog.y2);
MOVW	R0, #lo_addr(_Frog+6)
MOVT	R0, #hi_addr(_Frog+6)
LDRSH	R3, [R0, #0]
MOVW	R0, #lo_addr(_Frog+4)
MOVT	R0, #hi_addr(_Frog+4)
LDRSH	R2, [R0, #0]
MOVW	R0, #lo_addr(_Frog+2)
MOVT	R0, #hi_addr(_Frog+2)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Frog+0)
MOVT	R0, #hi_addr(_Frog+0)
LDRSH	R0, [R0, #0]
BL	_TFT_Rectangle+0
;PlayScreen.c,166 :: 		if (Frog.y1 < hy1)
MOVW	R0, #lo_addr(_hy1+0)
MOVT	R0, #hi_addr(_hy1+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Frog+2)
MOVT	R0, #hi_addr(_Frog+2)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	GE
BGE	L_JoystickUp16
;PlayScreen.c,168 :: 		hy1 = Frog.y1;
MOVW	R0, #lo_addr(_Frog+2)
MOVT	R0, #hi_addr(_Frog+2)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_hy1+0)
MOVT	R0, #hi_addr(_hy1+0)
STRH	R1, [R0, #0]
;PlayScreen.c,169 :: 		TFT_Set_Brush(1, CL_SILVER,0,0,0,0);
MOVS	R1, #0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #50712
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;PlayScreen.c,170 :: 		TFT_Rectangle(300,GRID_SIZE*0, DISPLAY_X, GRID_SIZE*2);
MOVW	R3, #32
SXTH	R3, R3
MOVW	R2, #320
SXTH	R2, R2
MOVW	R1, #0
SXTH	R1, R1
MOVW	R0, #300
SXTH	R0, R0
BL	_TFT_Rectangle+0
;PlayScreen.c,171 :: 		score = score + 1;
MOVW	R1, #lo_addr(_score+0)
MOVT	R1, #hi_addr(_score+0)
LDRSB	R0, [R1, #0]
ADDS	R2, R0, #1
STRB	R2, [R1, #0]
;PlayScreen.c,172 :: 		score1 = score/10 + 48;
SXTB	R1, R2
MOVS	R0, #10
SXTB	R0, R0
SDIV	R0, R1, R0
SXTB	R0, R0
ADDW	R3, R0, #48
MOVW	R0, #lo_addr(_score1+0)
MOVT	R0, #hi_addr(_score1+0)
STRB	R3, [R0, #0]
;PlayScreen.c,173 :: 		score0 = score%10 + 48;
SXTB	R2, R2
MOVS	R1, #10
SXTB	R1, R1
SDIV	R0, R2, R1
MLS	R0, R1, R0, R2
SXTB	R0, R0
ADDW	R1, R0, #48
MOVW	R0, #lo_addr(_score0+0)
MOVT	R0, #hi_addr(_score0+0)
STRB	R1, [R0, #0]
;PlayScreen.c,174 :: 		TFT_Write_Char(score1,DISPLAY_X - 20, 0);
UXTB	R0, R3
MOVS	R2, #0
MOVW	R1, #300
BL	_TFT_Write_Char+0
;PlayScreen.c,175 :: 		TFT_Write_Char(score0,DISPLAY_X - 10, 0);
MOVW	R0, #lo_addr(_score0+0)
MOVT	R0, #hi_addr(_score0+0)
LDRB	R0, [R0, #0]
MOVS	R2, #0
MOVW	R1, #310
BL	_TFT_Write_Char+0
;PlayScreen.c,176 :: 		}
L_JoystickUp16:
;PlayScreen.c,177 :: 		}
L_JoystickUp15:
;PlayScreen.c,178 :: 		}
L_JoystickUp12:
;PlayScreen.c,179 :: 		}
L_end_JoystickUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _JoystickUp
_JoystickLeft:
;PlayScreen.c,181 :: 		void JoystickLeft () iv IVT_INT_EXTI2{
SUB	SP, SP, #4
STR	LR, [SP, #0]
;PlayScreen.c,183 :: 		EXTI_PR.B2 = 1; // Clear pending flag for EXTI2
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
_SX	[R0, ByteOffset(EXTI_PR+0)]
;PlayScreen.c,184 :: 		if(Frog.x1 > 0){ // Check for collision with border
MOVW	R0, #lo_addr(_Frog+0)
MOVT	R0, #hi_addr(_Frog+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LE
BLE	L_JoystickLeft17
;PlayScreen.c,190 :: 		(Frog.x1 == 15 * GRID_SIZE && Frog.y1 == 3 * GRID_SIZE))){
MOVW	R0, #lo_addr(_Frog+0)
MOVT	R0, #hi_addr(_Frog+0)
LDRSH	R0, [R0, #0]
CMP	R0, #48
IT	NE
BNE	L__JoystickLeft75
MOVW	R0, #lo_addr(_Frog+2)
MOVT	R0, #hi_addr(_Frog+2)
LDRSH	R0, [R0, #0]
CMP	R0, #32
IT	NE
BNE	L__JoystickLeft74
IT	AL
BAL	L_JoystickLeft23
L__JoystickLeft75:
L__JoystickLeft74:
MOVW	R0, #lo_addr(_Frog+0)
MOVT	R0, #hi_addr(_Frog+0)
LDRSH	R0, [R0, #0]
CMP	R0, #48
IT	NE
BNE	L__JoystickLeft77
MOVW	R0, #lo_addr(_Frog+2)
MOVT	R0, #hi_addr(_Frog+2)
LDRSH	R0, [R0, #0]
CMP	R0, #48
IT	NE
BNE	L__JoystickLeft76
IT	AL
BAL	L_JoystickLeft23
L__JoystickLeft77:
L__JoystickLeft76:
MOVW	R0, #lo_addr(_Frog+0)
MOVT	R0, #hi_addr(_Frog+0)
LDRSH	R0, [R0, #0]
CMP	R0, #144
IT	NE
BNE	L__JoystickLeft79
MOVW	R0, #lo_addr(_Frog+2)
MOVT	R0, #hi_addr(_Frog+2)
LDRSH	R0, [R0, #0]
CMP	R0, #32
IT	NE
BNE	L__JoystickLeft78
IT	AL
BAL	L_JoystickLeft23
L__JoystickLeft79:
L__JoystickLeft78:
MOVW	R0, #lo_addr(_Frog+0)
MOVT	R0, #hi_addr(_Frog+0)
LDRSH	R0, [R0, #0]
CMP	R0, #144
IT	NE
BNE	L__JoystickLeft81
MOVW	R0, #lo_addr(_Frog+2)
MOVT	R0, #hi_addr(_Frog+2)
LDRSH	R0, [R0, #0]
CMP	R0, #48
IT	NE
BNE	L__JoystickLeft80
IT	AL
BAL	L_JoystickLeft23
L__JoystickLeft81:
L__JoystickLeft80:
MOVW	R0, #lo_addr(_Frog+0)
MOVT	R0, #hi_addr(_Frog+0)
LDRSH	R0, [R0, #0]
CMP	R0, #240
IT	NE
BNE	L__JoystickLeft83
MOVW	R0, #lo_addr(_Frog+2)
MOVT	R0, #hi_addr(_Frog+2)
LDRSH	R0, [R0, #0]
CMP	R0, #32
IT	NE
BNE	L__JoystickLeft82
IT	AL
BAL	L_JoystickLeft23
L__JoystickLeft83:
L__JoystickLeft82:
MOVW	R0, #lo_addr(_Frog+0)
MOVT	R0, #hi_addr(_Frog+0)
LDRSH	R0, [R0, #0]
CMP	R0, #240
IT	NE
BNE	L__JoystickLeft85
MOVW	R0, #lo_addr(_Frog+2)
MOVT	R0, #hi_addr(_Frog+2)
LDRSH	R0, [R0, #0]
CMP	R0, #48
IT	NE
BNE	L__JoystickLeft84
IT	AL
BAL	L_JoystickLeft23
L__JoystickLeft85:
L__JoystickLeft84:
MOVS	R0, #0
IT	AL
BAL	L_JoystickLeft22
L_JoystickLeft23:
MOVS	R0, #1
L_JoystickLeft22:
CMP	R0, #0
IT	NE
BNE	L_JoystickLeft32
;PlayScreen.c,191 :: 		Sound_Play(10, 100); // Play sound of 10Hz in duration of 100ms
MOVS	R1, #100
MOVS	R0, #10
BL	_Sound_Play+0
;PlayScreen.c,192 :: 		TFT_Set_Brush(1, RowColor[Frog.row],0,0,0,0); // Replace previous position
MOVS	R3, #0
MOVS	R2, #0
MOVW	R0, #lo_addr(_Frog+12)
MOVT	R0, #hi_addr(_Frog+12)
LDRSH	R0, [R0, #0]
LSLS	R1, R0, #1
MOVW	R0, #lo_addr(_RowColor+0)
MOVT	R0, #hi_addr(_RowColor+0)
ADDS	R0, R0, R1
LDRSH	R0, [R0, #0]
UXTH	R0, R0
PUSH	(R3)
PUSH	(R2)
MOVS	R3, #0
MOVS	R2, #0
UXTH	R1, R0
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;PlayScreen.c,193 :: 		TFT_Rectangle(Frog.x1,Frog.y1,Frog.x2,Frog.y2);
MOVW	R0, #lo_addr(_Frog+6)
MOVT	R0, #hi_addr(_Frog+6)
LDRSH	R3, [R0, #0]
MOVW	R0, #lo_addr(_Frog+4)
MOVT	R0, #hi_addr(_Frog+4)
LDRSH	R2, [R0, #0]
MOVW	R0, #lo_addr(_Frog+2)
MOVT	R0, #hi_addr(_Frog+2)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Frog+0)
MOVT	R0, #hi_addr(_Frog+0)
LDRSH	R0, [R0, #0]
BL	_TFT_Rectangle+0
;PlayScreen.c,194 :: 		Frog.x1 = Frog.x1 - GRID_SIZE; // Update position
MOVW	R1, #lo_addr(_Frog+0)
MOVT	R1, #hi_addr(_Frog+0)
LDRSH	R0, [R1, #0]
SUBS	R0, #16
STRH	R0, [R1, #0]
;PlayScreen.c,195 :: 		Frog.x2 = Frog.x2 - GRID_SIZE;
MOVW	R1, #lo_addr(_Frog+4)
MOVT	R1, #hi_addr(_Frog+4)
LDRSH	R0, [R1, #0]
SUBS	R0, #16
STRH	R0, [R1, #0]
;PlayScreen.c,197 :: 		TFT_Set_Brush(1, Frog.color,0,0,0,0); // draw new position
MOVS	R2, #0
MOVS	R1, #0
MOVW	R0, #lo_addr(_Frog+8)
MOVT	R0, #hi_addr(_Frog+8)
LDRSH	R0, [R0, #0]
PUSH	(R2)
PUSH	(R1)
MOVS	R3, #0
MOVS	R2, #0
UXTH	R1, R0
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;PlayScreen.c,198 :: 		TFT_Rectangle(Frog.x1,Frog.y1,Frog.x2,Frog.y2);
MOVW	R0, #lo_addr(_Frog+6)
MOVT	R0, #hi_addr(_Frog+6)
LDRSH	R3, [R0, #0]
MOVW	R0, #lo_addr(_Frog+4)
MOVT	R0, #hi_addr(_Frog+4)
LDRSH	R2, [R0, #0]
MOVW	R0, #lo_addr(_Frog+2)
MOVT	R0, #hi_addr(_Frog+2)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Frog+0)
MOVT	R0, #hi_addr(_Frog+0)
LDRSH	R0, [R0, #0]
BL	_TFT_Rectangle+0
;PlayScreen.c,199 :: 		}
L_JoystickLeft32:
;PlayScreen.c,200 :: 		}
L_JoystickLeft17:
;PlayScreen.c,201 :: 		}
L_end_JoystickLeft:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _JoystickLeft
_EXTI9_5_IRQHandler:
;PlayScreen.c,203 :: 		void EXTI9_5_IRQHandler() iv IVT_INT_EXTI9_5 {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;PlayScreen.c,205 :: 		if (EXTI_PR.B5) { // Check if EXTI5 interrupt is pending
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
_LX	[R0, ByteOffset(EXTI_PR+0)]
CMP	R0, #0
IT	EQ
BEQ	L_EXTI9_5_IRQHandler33
;PlayScreen.c,206 :: 		delay_ms(100); // 0.1s delay
MOVW	R7, #20351
MOVT	R7, #18
NOP
NOP
L_EXTI9_5_IRQHandler34:
SUBS	R7, R7, #1
BNE	L_EXTI9_5_IRQHandler34
NOP
NOP
NOP
;PlayScreen.c,207 :: 		EXTI_PR.B5 = 1; // Clear pending flag for EXTI5
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
_SX	[R0, ByteOffset(EXTI_PR+0)]
;PlayScreen.c,208 :: 		if(Frog.y2 < DISPLAY_Y){ // Check for collision with border
MOVW	R0, #lo_addr(_Frog+6)
MOVT	R0, #hi_addr(_Frog+6)
LDRSH	R0, [R0, #0]
CMP	R0, #240
IT	GE
BGE	L_EXTI9_5_IRQHandler36
;PlayScreen.c,209 :: 		Sound_Play(10, 100); // Play sound of 10Hz in duration of 100ms
MOVS	R1, #100
MOVS	R0, #10
BL	_Sound_Play+0
;PlayScreen.c,210 :: 		Frog.row += 1;
MOVW	R1, #lo_addr(_Frog+12)
MOVT	R1, #hi_addr(_Frog+12)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;PlayScreen.c,211 :: 		TFT_Set_Brush(1, RowColor[Frog.row - 1],0,0,0,0); // Replace previous position
MOVS	R3, #0
MOVS	R2, #0
SUBS	R0, R0, #1
SXTH	R0, R0
LSLS	R1, R0, #1
MOVW	R0, #lo_addr(_RowColor+0)
MOVT	R0, #hi_addr(_RowColor+0)
ADDS	R0, R0, R1
LDRSH	R0, [R0, #0]
UXTH	R0, R0
PUSH	(R3)
PUSH	(R2)
MOVS	R3, #0
MOVS	R2, #0
UXTH	R1, R0
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;PlayScreen.c,212 :: 		TFT_Rectangle(Frog.x1,Frog.y1,Frog.x2,Frog.y2);
MOVW	R0, #lo_addr(_Frog+6)
MOVT	R0, #hi_addr(_Frog+6)
LDRSH	R3, [R0, #0]
MOVW	R0, #lo_addr(_Frog+4)
MOVT	R0, #hi_addr(_Frog+4)
LDRSH	R2, [R0, #0]
MOVW	R0, #lo_addr(_Frog+2)
MOVT	R0, #hi_addr(_Frog+2)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Frog+0)
MOVT	R0, #hi_addr(_Frog+0)
LDRSH	R0, [R0, #0]
BL	_TFT_Rectangle+0
;PlayScreen.c,213 :: 		Frog.y1 = Frog.y1 + GRID_SIZE; // Update position
MOVW	R1, #lo_addr(_Frog+2)
MOVT	R1, #hi_addr(_Frog+2)
LDRSH	R0, [R1, #0]
ADDS	R0, #16
STRH	R0, [R1, #0]
;PlayScreen.c,214 :: 		Frog.y2 = Frog.y2 + GRID_SIZE;
MOVW	R1, #lo_addr(_Frog+6)
MOVT	R1, #hi_addr(_Frog+6)
LDRSH	R0, [R1, #0]
ADDS	R0, #16
STRH	R0, [R1, #0]
;PlayScreen.c,216 :: 		TFT_Set_Brush(1, Frog.color,0,0,0,0); // draw new position
MOVS	R2, #0
MOVS	R1, #0
MOVW	R0, #lo_addr(_Frog+8)
MOVT	R0, #hi_addr(_Frog+8)
LDRSH	R0, [R0, #0]
PUSH	(R2)
PUSH	(R1)
MOVS	R3, #0
MOVS	R2, #0
UXTH	R1, R0
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;PlayScreen.c,217 :: 		TFT_Rectangle(Frog.x1,Frog.y1,Frog.x2,Frog.y2);
MOVW	R0, #lo_addr(_Frog+6)
MOVT	R0, #hi_addr(_Frog+6)
LDRSH	R3, [R0, #0]
MOVW	R0, #lo_addr(_Frog+4)
MOVT	R0, #hi_addr(_Frog+4)
LDRSH	R2, [R0, #0]
MOVW	R0, #lo_addr(_Frog+2)
MOVT	R0, #hi_addr(_Frog+2)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Frog+0)
MOVT	R0, #hi_addr(_Frog+0)
LDRSH	R0, [R0, #0]
BL	_TFT_Rectangle+0
;PlayScreen.c,218 :: 		}
L_EXTI9_5_IRQHandler36:
;PlayScreen.c,219 :: 		}
IT	AL
BAL	L_EXTI9_5_IRQHandler37
L_EXTI9_5_IRQHandler33:
;PlayScreen.c,221 :: 		else if (EXTI_PR.B6) { // Check if EXTI6 interrupt is pending
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
_LX	[R0, ByteOffset(EXTI_PR+0)]
CMP	R0, #0
IT	EQ
BEQ	L_EXTI9_5_IRQHandler38
;PlayScreen.c,222 :: 		delay_ms(100); // 0.1s delay
MOVW	R7, #20351
MOVT	R7, #18
NOP
NOP
L_EXTI9_5_IRQHandler39:
SUBS	R7, R7, #1
BNE	L_EXTI9_5_IRQHandler39
NOP
NOP
NOP
;PlayScreen.c,223 :: 		EXTI_PR.B6 = 1; // Clear pending flag for EXTI6
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
_SX	[R0, ByteOffset(EXTI_PR+0)]
;PlayScreen.c,224 :: 		if(Frog.x2 < DISPLAY_X){ // Check for collision with border
MOVW	R0, #lo_addr(_Frog+4)
MOVT	R0, #hi_addr(_Frog+4)
LDRSH	R0, [R0, #0]
CMP	R0, #320
IT	GE
BGE	L_EXTI9_5_IRQHandler41
;PlayScreen.c,230 :: 		(Frog.x1 == 16 * GRID_SIZE && Frog.y1 == 3 * GRID_SIZE))){
MOVW	R0, #lo_addr(_Frog+0)
MOVT	R0, #hi_addr(_Frog+0)
LDRSH	R0, [R0, #0]
CMP	R0, #64
IT	NE
BNE	L__EXTI9_5_IRQHandler93
MOVW	R0, #lo_addr(_Frog+2)
MOVT	R0, #hi_addr(_Frog+2)
LDRSH	R0, [R0, #0]
CMP	R0, #32
IT	NE
BNE	L__EXTI9_5_IRQHandler92
IT	AL
BAL	L_EXTI9_5_IRQHandler47
L__EXTI9_5_IRQHandler93:
L__EXTI9_5_IRQHandler92:
MOVW	R0, #lo_addr(_Frog+0)
MOVT	R0, #hi_addr(_Frog+0)
LDRSH	R0, [R0, #0]
CMP	R0, #64
IT	NE
BNE	L__EXTI9_5_IRQHandler95
MOVW	R0, #lo_addr(_Frog+2)
MOVT	R0, #hi_addr(_Frog+2)
LDRSH	R0, [R0, #0]
CMP	R0, #48
IT	NE
BNE	L__EXTI9_5_IRQHandler94
IT	AL
BAL	L_EXTI9_5_IRQHandler47
L__EXTI9_5_IRQHandler95:
L__EXTI9_5_IRQHandler94:
MOVW	R0, #lo_addr(_Frog+0)
MOVT	R0, #hi_addr(_Frog+0)
LDRSH	R0, [R0, #0]
CMP	R0, #160
IT	NE
BNE	L__EXTI9_5_IRQHandler97
MOVW	R0, #lo_addr(_Frog+2)
MOVT	R0, #hi_addr(_Frog+2)
LDRSH	R0, [R0, #0]
CMP	R0, #32
IT	NE
BNE	L__EXTI9_5_IRQHandler96
IT	AL
BAL	L_EXTI9_5_IRQHandler47
L__EXTI9_5_IRQHandler97:
L__EXTI9_5_IRQHandler96:
MOVW	R0, #lo_addr(_Frog+0)
MOVT	R0, #hi_addr(_Frog+0)
LDRSH	R0, [R0, #0]
CMP	R0, #160
IT	NE
BNE	L__EXTI9_5_IRQHandler99
MOVW	R0, #lo_addr(_Frog+2)
MOVT	R0, #hi_addr(_Frog+2)
LDRSH	R0, [R0, #0]
CMP	R0, #48
IT	NE
BNE	L__EXTI9_5_IRQHandler98
IT	AL
BAL	L_EXTI9_5_IRQHandler47
L__EXTI9_5_IRQHandler99:
L__EXTI9_5_IRQHandler98:
MOVW	R0, #lo_addr(_Frog+0)
MOVT	R0, #hi_addr(_Frog+0)
LDRSH	R0, [R0, #0]
CMP	R0, #256
IT	NE
BNE	L__EXTI9_5_IRQHandler101
MOVW	R0, #lo_addr(_Frog+2)
MOVT	R0, #hi_addr(_Frog+2)
LDRSH	R0, [R0, #0]
CMP	R0, #32
IT	NE
BNE	L__EXTI9_5_IRQHandler100
IT	AL
BAL	L_EXTI9_5_IRQHandler47
L__EXTI9_5_IRQHandler101:
L__EXTI9_5_IRQHandler100:
MOVW	R0, #lo_addr(_Frog+0)
MOVT	R0, #hi_addr(_Frog+0)
LDRSH	R0, [R0, #0]
CMP	R0, #256
IT	NE
BNE	L__EXTI9_5_IRQHandler103
MOVW	R0, #lo_addr(_Frog+2)
MOVT	R0, #hi_addr(_Frog+2)
LDRSH	R0, [R0, #0]
CMP	R0, #48
IT	NE
BNE	L__EXTI9_5_IRQHandler102
IT	AL
BAL	L_EXTI9_5_IRQHandler47
L__EXTI9_5_IRQHandler103:
L__EXTI9_5_IRQHandler102:
MOVS	R0, #0
IT	AL
BAL	L_EXTI9_5_IRQHandler46
L_EXTI9_5_IRQHandler47:
MOVS	R0, #1
L_EXTI9_5_IRQHandler46:
CMP	R0, #0
IT	NE
BNE	L_EXTI9_5_IRQHandler56
;PlayScreen.c,231 :: 		Sound_Play(10, 100); // Play sound of 10Hz in duration of 100ms
MOVS	R1, #100
MOVS	R0, #10
BL	_Sound_Play+0
;PlayScreen.c,232 :: 		TFT_Set_Brush(1, RowColor[Frog.row],0,0,0,0); // Replace previous position
MOVS	R3, #0
MOVS	R2, #0
MOVW	R0, #lo_addr(_Frog+12)
MOVT	R0, #hi_addr(_Frog+12)
LDRSH	R0, [R0, #0]
LSLS	R1, R0, #1
MOVW	R0, #lo_addr(_RowColor+0)
MOVT	R0, #hi_addr(_RowColor+0)
ADDS	R0, R0, R1
LDRSH	R0, [R0, #0]
UXTH	R0, R0
PUSH	(R3)
PUSH	(R2)
MOVS	R3, #0
MOVS	R2, #0
UXTH	R1, R0
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;PlayScreen.c,233 :: 		TFT_Rectangle(Frog.x1,Frog.y1,Frog.x2,Frog.y2);
MOVW	R0, #lo_addr(_Frog+6)
MOVT	R0, #hi_addr(_Frog+6)
LDRSH	R3, [R0, #0]
MOVW	R0, #lo_addr(_Frog+4)
MOVT	R0, #hi_addr(_Frog+4)
LDRSH	R2, [R0, #0]
MOVW	R0, #lo_addr(_Frog+2)
MOVT	R0, #hi_addr(_Frog+2)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Frog+0)
MOVT	R0, #hi_addr(_Frog+0)
LDRSH	R0, [R0, #0]
BL	_TFT_Rectangle+0
;PlayScreen.c,234 :: 		Frog.x1 = Frog.x1 + GRID_SIZE; // Update position
MOVW	R1, #lo_addr(_Frog+0)
MOVT	R1, #hi_addr(_Frog+0)
LDRSH	R0, [R1, #0]
ADDS	R0, #16
STRH	R0, [R1, #0]
;PlayScreen.c,235 :: 		Frog.x2 = Frog.x2 + GRID_SIZE;
MOVW	R1, #lo_addr(_Frog+4)
MOVT	R1, #hi_addr(_Frog+4)
LDRSH	R0, [R1, #0]
ADDS	R0, #16
STRH	R0, [R1, #0]
;PlayScreen.c,237 :: 		TFT_Set_Brush(1, Frog.color,0,0,0,0); // draw new position
MOVS	R2, #0
MOVS	R1, #0
MOVW	R0, #lo_addr(_Frog+8)
MOVT	R0, #hi_addr(_Frog+8)
LDRSH	R0, [R0, #0]
PUSH	(R2)
PUSH	(R1)
MOVS	R3, #0
MOVS	R2, #0
UXTH	R1, R0
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;PlayScreen.c,238 :: 		TFT_Rectangle(Frog.x1,Frog.y1,Frog.x2,Frog.y2);
MOVW	R0, #lo_addr(_Frog+6)
MOVT	R0, #hi_addr(_Frog+6)
LDRSH	R3, [R0, #0]
MOVW	R0, #lo_addr(_Frog+4)
MOVT	R0, #hi_addr(_Frog+4)
LDRSH	R2, [R0, #0]
MOVW	R0, #lo_addr(_Frog+2)
MOVT	R0, #hi_addr(_Frog+2)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Frog+0)
MOVT	R0, #hi_addr(_Frog+0)
LDRSH	R0, [R0, #0]
BL	_TFT_Rectangle+0
;PlayScreen.c,239 :: 		}
L_EXTI9_5_IRQHandler56:
;PlayScreen.c,240 :: 		}
L_EXTI9_5_IRQHandler41:
;PlayScreen.c,241 :: 		}
L_EXTI9_5_IRQHandler38:
L_EXTI9_5_IRQHandler37:
;PlayScreen.c,242 :: 		}
L_end_EXTI9_5_IRQHandler:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _EXTI9_5_IRQHandler
_PlayScreen:
;PlayScreen.c,244 :: 		void PlayScreen(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;PlayScreen.c,246 :: 		TFT_Set_Pen(CL_BLACK, 0); //Set the pen width to 0
MOVS	R1, #0
MOVW	R0, #0
BL	_TFT_Set_Pen+0
;PlayScreen.c,247 :: 		timer = 60 - (level-1) * 10;
MOVW	R0, #lo_addr(_level+0)
MOVT	R0, #hi_addr(_level+0)
LDRSB	R0, [R0, #0]
SUBS	R1, R0, #1
SXTH	R1, R1
MOVS	R0, #10
SXTH	R0, R0
MULS	R0, R1, R0
SXTH	R0, R0
RSB	R1, R0, #60
MOVW	R0, #lo_addr(_timer+0)
MOVT	R0, #hi_addr(_timer+0)
STRB	R1, [R0, #0]
;PlayScreen.c,249 :: 		Frog.x1 = 160;
MOVS	R1, #160
SXTH	R1, R1
MOVW	R0, #lo_addr(_Frog+0)
MOVT	R0, #hi_addr(_Frog+0)
STRH	R1, [R0, #0]
;PlayScreen.c,250 :: 		Frog.y1 = DISPLAY_Y - GRID_SIZE;
MOVW	R1, #224
SXTH	R1, R1
MOVW	R0, #lo_addr(_Frog+2)
MOVT	R0, #hi_addr(_Frog+2)
STRH	R1, [R0, #0]
;PlayScreen.c,251 :: 		Frog.x2 = Frog.x1 + GRID_SIZE;
MOVW	R1, #176
SXTH	R1, R1
MOVW	R0, #lo_addr(_Frog+4)
MOVT	R0, #hi_addr(_Frog+4)
STRH	R1, [R0, #0]
;PlayScreen.c,252 :: 		Frog.y2 = Frog.y1 + GRID_SIZE;
MOVW	R1, #240
SXTH	R1, R1
MOVW	R0, #lo_addr(_Frog+6)
MOVT	R0, #hi_addr(_Frog+6)
STRH	R1, [R0, #0]
;PlayScreen.c,253 :: 		Frog.color = CL_LIME;
MOVW	R1, #2016
SXTH	R1, R1
MOVW	R0, #lo_addr(_Frog+8)
MOVT	R0, #hi_addr(_Frog+8)
STRH	R1, [R0, #0]
;PlayScreen.c,254 :: 		Frog.row = 14;
MOVS	R1, #14
SXTH	R1, R1
MOVW	R0, #lo_addr(_Frog+12)
MOVT	R0, #hi_addr(_Frog+12)
STRH	R1, [R0, #0]
;PlayScreen.c,255 :: 		hy1 = Frog.y1;
MOVW	R1, #224
SXTH	R1, R1
MOVW	R0, #lo_addr(_hy1+0)
MOVT	R0, #hi_addr(_hy1+0)
STRH	R1, [R0, #0]
;PlayScreen.c,258 :: 		Car1.x1 = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_Car1+0)
MOVT	R0, #hi_addr(_Car1+0)
STRH	R1, [R0, #0]
;PlayScreen.c,259 :: 		Car1.y1 = DISPLAY_Y - 2 * GRID_SIZE;
MOVW	R1, #208
SXTH	R1, R1
MOVW	R0, #lo_addr(_Car1+2)
MOVT	R0, #hi_addr(_Car1+2)
STRH	R1, [R0, #0]
;PlayScreen.c,260 :: 		Car1.x2 = Car1.x1 + 2 * GRID_SIZE;
MOVW	R1, #32
SXTH	R1, R1
MOVW	R0, #lo_addr(_Car1+4)
MOVT	R0, #hi_addr(_Car1+4)
STRH	R1, [R0, #0]
;PlayScreen.c,261 :: 		Car1.y2 = Car1.y1 + GRID_SIZE;
MOVW	R1, #224
SXTH	R1, R1
MOVW	R0, #lo_addr(_Car1+6)
MOVT	R0, #hi_addr(_Car1+6)
STRH	R1, [R0, #0]
;PlayScreen.c,262 :: 		Car1.color = CL_RED;
MOVW	R1, #63488
SXTH	R1, R1
MOVW	R0, #lo_addr(_Car1+8)
MOVT	R0, #hi_addr(_Car1+8)
STRH	R1, [R0, #0]
;PlayScreen.c,265 :: 		Car2.x1 = 0 - 10 * GRID_SIZE;
MOVW	R1, #65376
SXTH	R1, R1
MOVW	R0, #lo_addr(_Car2+0)
MOVT	R0, #hi_addr(_Car2+0)
STRH	R1, [R0, #0]
;PlayScreen.c,266 :: 		Car2.y1 = DISPLAY_Y - 3 * GRID_SIZE;
MOVW	R1, #192
SXTH	R1, R1
MOVW	R0, #lo_addr(_Car2+2)
MOVT	R0, #hi_addr(_Car2+2)
STRH	R1, [R0, #0]
;PlayScreen.c,267 :: 		Car2.x2 = Car2.x1 + 2 * GRID_SIZE;
MOVW	R1, #65408
SXTH	R1, R1
MOVW	R0, #lo_addr(_Car2+4)
MOVT	R0, #hi_addr(_Car2+4)
STRH	R1, [R0, #0]
;PlayScreen.c,268 :: 		Car2.y2 = Car2.y1 + GRID_SIZE;
MOVW	R1, #208
SXTH	R1, R1
MOVW	R0, #lo_addr(_Car2+6)
MOVT	R0, #hi_addr(_Car2+6)
STRH	R1, [R0, #0]
;PlayScreen.c,269 :: 		Car2.color = CL_RED;
MOVW	R1, #63488
SXTH	R1, R1
MOVW	R0, #lo_addr(_Car2+8)
MOVT	R0, #hi_addr(_Car2+8)
STRH	R1, [R0, #0]
;PlayScreen.c,272 :: 		Car3.x1 = 0 - 5 * GRID_SIZE;
MOVW	R1, #65456
SXTH	R1, R1
MOVW	R0, #lo_addr(_Car3+0)
MOVT	R0, #hi_addr(_Car3+0)
STRH	R1, [R0, #0]
;PlayScreen.c,273 :: 		Car3.y1 = DISPLAY_Y - 4 * GRID_SIZE;
MOVW	R1, #176
SXTH	R1, R1
MOVW	R0, #lo_addr(_Car3+2)
MOVT	R0, #hi_addr(_Car3+2)
STRH	R1, [R0, #0]
;PlayScreen.c,274 :: 		Car3.x2 = Car3.x1 + 2 * GRID_SIZE;
MOVW	R1, #65488
SXTH	R1, R1
MOVW	R0, #lo_addr(_Car3+4)
MOVT	R0, #hi_addr(_Car3+4)
STRH	R1, [R0, #0]
;PlayScreen.c,275 :: 		Car3.y2 = Car3.y1 + GRID_SIZE;
MOVW	R1, #192
SXTH	R1, R1
MOVW	R0, #lo_addr(_Car3+6)
MOVT	R0, #hi_addr(_Car3+6)
STRH	R1, [R0, #0]
;PlayScreen.c,276 :: 		Car3.color = CL_RED;
MOVW	R1, #63488
SXTH	R1, R1
MOVW	R0, #lo_addr(_Car3+8)
MOVT	R0, #hi_addr(_Car3+8)
STRH	R1, [R0, #0]
;PlayScreen.c,279 :: 		Car4.x1 = 0 - 15 * GRID_SIZE;
MOVW	R1, #65296
SXTH	R1, R1
MOVW	R0, #lo_addr(_Car4+0)
MOVT	R0, #hi_addr(_Car4+0)
STRH	R1, [R0, #0]
;PlayScreen.c,280 :: 		Car4.y1 = DISPLAY_Y - 5 * GRID_SIZE;
MOVW	R1, #160
SXTH	R1, R1
MOVW	R0, #lo_addr(_Car4+2)
MOVT	R0, #hi_addr(_Car4+2)
STRH	R1, [R0, #0]
;PlayScreen.c,281 :: 		Car4.x2 = Car4.x1 + 2 * GRID_SIZE;
MOVW	R1, #65328
SXTH	R1, R1
MOVW	R0, #lo_addr(_Car4+4)
MOVT	R0, #hi_addr(_Car4+4)
STRH	R1, [R0, #0]
;PlayScreen.c,282 :: 		Car4.y2 = Car4.y1 + GRID_SIZE;
MOVW	R1, #176
SXTH	R1, R1
MOVW	R0, #lo_addr(_Car4+6)
MOVT	R0, #hi_addr(_Car4+6)
STRH	R1, [R0, #0]
;PlayScreen.c,283 :: 		Car4.color = CL_RED;
MOVW	R1, #63488
SXTH	R1, R1
MOVW	R0, #lo_addr(_Car4+8)
MOVT	R0, #hi_addr(_Car4+8)
STRH	R1, [R0, #0]
;PlayScreen.c,287 :: 		TFT_Set_Brush(1, CL_GREEN,0,0,0,0);
MOVS	R1, #0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #1024
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;PlayScreen.c,288 :: 		TFT_Rectangle(0,0, DISPLAY_X, DISPLAY_Y);
MOVS	R3, #240
SXTH	R3, R3
MOVW	R2, #320
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Rectangle+0
;PlayScreen.c,291 :: 		TFT_Set_Brush(1, CL_BLACK,0,0,0,0);
MOVS	R1, #0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #0
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;PlayScreen.c,292 :: 		TFT_Rectangle(0,GRID_SIZE*10, DISPLAY_X, GRID_SIZE*14);
MOVW	R3, #224
SXTH	R3, R3
MOVW	R2, #320
SXTH	R2, R2
MOVW	R1, #160
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Rectangle+0
;PlayScreen.c,295 :: 		TFT_Set_Brush(1, CL_BLUE,0,0,0,0);
MOVS	R1, #0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #31
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;PlayScreen.c,296 :: 		TFT_Rectangle(0,GRID_SIZE*4, DISPLAY_X, GRID_SIZE*9);
MOVW	R3, #144
SXTH	R3, R3
MOVW	R2, #320
SXTH	R2, R2
MOVW	R1, #64
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Rectangle+0
;PlayScreen.c,299 :: 		TFT_Set_Brush(1, CL_SILVER,0,0,0,0);
MOVS	R1, #0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #50712
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;PlayScreen.c,300 :: 		TFT_Rectangle(0,GRID_SIZE*0, DISPLAY_X, GRID_SIZE*2);
MOVW	R3, #32
SXTH	R3, R3
MOVW	R2, #320
SXTH	R2, R2
MOVW	R1, #0
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Rectangle+0
;PlayScreen.c,303 :: 		TFT_Set_Brush(1, CL_MAROON,0,0,0,0);
MOVS	R1, #0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #32768
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;PlayScreen.c,304 :: 		TFT_Rectangle(0, GRID_SIZE*2, GRID_SIZE*3, GRID_SIZE*4);
MOVW	R3, #64
SXTH	R3, R3
MOVW	R2, #48
SXTH	R2, R2
MOVW	R1, #32
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Rectangle+0
;PlayScreen.c,305 :: 		TFT_Rectangle(GRID_SIZE*5, GRID_SIZE*2, GRID_SIZE*9, GRID_SIZE*4);
MOVW	R3, #64
SXTH	R3, R3
MOVW	R2, #144
SXTH	R2, R2
MOVW	R1, #32
SXTH	R1, R1
MOVW	R0, #80
SXTH	R0, R0
BL	_TFT_Rectangle+0
;PlayScreen.c,306 :: 		TFT_Rectangle(GRID_SIZE*11, GRID_SIZE*2, GRID_SIZE*15, GRID_SIZE*4);
MOVW	R3, #64
SXTH	R3, R3
MOVW	R2, #240
SXTH	R2, R2
MOVW	R1, #32
SXTH	R1, R1
MOVW	R0, #176
SXTH	R0, R0
BL	_TFT_Rectangle+0
;PlayScreen.c,307 :: 		TFT_Rectangle(GRID_SIZE*17, GRID_SIZE*2, GRID_SIZE*20, GRID_SIZE*4);
MOVW	R3, #64
SXTH	R3, R3
MOVW	R2, #320
SXTH	R2, R2
MOVW	R1, #32
SXTH	R1, R1
MOVW	R0, #272
SXTH	R0, R0
BL	_TFT_Rectangle+0
;PlayScreen.c,310 :: 		TFT_Set_Brush(1, Frog.color,0,0,0,0);
MOVS	R2, #0
MOVS	R1, #0
MOVW	R0, #lo_addr(_Frog+8)
MOVT	R0, #hi_addr(_Frog+8)
LDRSH	R0, [R0, #0]
PUSH	(R2)
PUSH	(R1)
MOVS	R3, #0
MOVS	R2, #0
UXTH	R1, R0
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;PlayScreen.c,311 :: 		TFT_Rectangle(Frog.x1,Frog.y1,Frog.x2,Frog.y2);
MOVW	R0, #lo_addr(_Frog+6)
MOVT	R0, #hi_addr(_Frog+6)
LDRSH	R3, [R0, #0]
MOVW	R0, #lo_addr(_Frog+4)
MOVT	R0, #hi_addr(_Frog+4)
LDRSH	R2, [R0, #0]
MOVW	R0, #lo_addr(_Frog+2)
MOVT	R0, #hi_addr(_Frog+2)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Frog+0)
MOVT	R0, #hi_addr(_Frog+0)
LDRSH	R0, [R0, #0]
BL	_TFT_Rectangle+0
;PlayScreen.c,314 :: 		TFT_Set_Brush(1, Car1.color,0,0,0,0);
MOVS	R2, #0
MOVS	R1, #0
MOVW	R0, #lo_addr(_Car1+8)
MOVT	R0, #hi_addr(_Car1+8)
LDRSH	R0, [R0, #0]
PUSH	(R2)
PUSH	(R1)
MOVS	R3, #0
MOVS	R2, #0
UXTH	R1, R0
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;PlayScreen.c,315 :: 		TFT_Rectangle(Car1.x1,Car1.y1,Car1.x2,Car1.y2);
MOVW	R0, #lo_addr(_Car1+6)
MOVT	R0, #hi_addr(_Car1+6)
LDRSH	R3, [R0, #0]
MOVW	R0, #lo_addr(_Car1+4)
MOVT	R0, #hi_addr(_Car1+4)
LDRSH	R2, [R0, #0]
MOVW	R0, #lo_addr(_Car1+2)
MOVT	R0, #hi_addr(_Car1+2)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Car1+0)
MOVT	R0, #hi_addr(_Car1+0)
LDRSH	R0, [R0, #0]
BL	_TFT_Rectangle+0
;PlayScreen.c,316 :: 		TFT_Rectangle(Car2.x1,Car2.y1,Car2.x2,Car2.y2);
MOVW	R0, #lo_addr(_Car2+6)
MOVT	R0, #hi_addr(_Car2+6)
LDRSH	R3, [R0, #0]
MOVW	R0, #lo_addr(_Car2+4)
MOVT	R0, #hi_addr(_Car2+4)
LDRSH	R2, [R0, #0]
MOVW	R0, #lo_addr(_Car2+2)
MOVT	R0, #hi_addr(_Car2+2)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Car2+0)
MOVT	R0, #hi_addr(_Car2+0)
LDRSH	R0, [R0, #0]
BL	_TFT_Rectangle+0
;PlayScreen.c,317 :: 		TFT_Rectangle(Car3.x1,Car3.y1,Car3.x2,Car3.y2);
MOVW	R0, #lo_addr(_Car3+6)
MOVT	R0, #hi_addr(_Car3+6)
LDRSH	R3, [R0, #0]
MOVW	R0, #lo_addr(_Car3+4)
MOVT	R0, #hi_addr(_Car3+4)
LDRSH	R2, [R0, #0]
MOVW	R0, #lo_addr(_Car3+2)
MOVT	R0, #hi_addr(_Car3+2)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Car3+0)
MOVT	R0, #hi_addr(_Car3+0)
LDRSH	R0, [R0, #0]
BL	_TFT_Rectangle+0
;PlayScreen.c,318 :: 		TFT_Rectangle(Car4.x1,Car4.y1,Car4.x2,Car4.y2);
MOVW	R0, #lo_addr(_Car4+6)
MOVT	R0, #hi_addr(_Car4+6)
LDRSH	R3, [R0, #0]
MOVW	R0, #lo_addr(_Car4+4)
MOVT	R0, #hi_addr(_Car4+4)
LDRSH	R2, [R0, #0]
MOVW	R0, #lo_addr(_Car4+2)
MOVT	R0, #hi_addr(_Car4+2)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Car4+0)
MOVT	R0, #hi_addr(_Car4+0)
LDRSH	R0, [R0, #0]
BL	_TFT_Rectangle+0
;PlayScreen.c,321 :: 		TFT_Write_Text("Score", DISPLAY_X - 60, 0);
MOVW	R0, #lo_addr(?lstr1_PlayScreen+0)
MOVT	R0, #hi_addr(?lstr1_PlayScreen+0)
MOVS	R2, #0
MOVW	R1, #260
BL	_TFT_Write_Text+0
;PlayScreen.c,322 :: 		score1 = score/10 + 48;
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
;PlayScreen.c,323 :: 		score0 = score%10 + 48;
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
;PlayScreen.c,324 :: 		TFT_Write_Char(score1,DISPLAY_X - 20, 0);
UXTB	R0, R3
MOVS	R2, #0
MOVW	R1, #300
BL	_TFT_Write_Char+0
;PlayScreen.c,325 :: 		TFT_Write_Char(score0,DISPLAY_X - 10, 0);
MOVW	R0, #lo_addr(_score0+0)
MOVT	R0, #hi_addr(_score0+0)
LDRB	R0, [R0, #0]
MOVS	R2, #0
MOVW	R1, #310
BL	_TFT_Write_Char+0
;PlayScreen.c,328 :: 		TFT_Write_Text("Timer", 5, 0);
MOVW	R0, #lo_addr(?lstr2_PlayScreen+0)
MOVT	R0, #hi_addr(?lstr2_PlayScreen+0)
MOVS	R2, #0
MOVS	R1, #5
BL	_TFT_Write_Text+0
;PlayScreen.c,331 :: 		TFT_Write_Text("Counter", 5, GRID_SIZE);
MOVW	R0, #lo_addr(?lstr3_PlayScreen+0)
MOVT	R0, #hi_addr(?lstr3_PlayScreen+0)
MOVW	R2, #16
MOVS	R1, #5
BL	_TFT_Write_Text+0
;PlayScreen.c,334 :: 		TFT_Write_Text("Level", 160 - 30, 0);
MOVW	R0, #lo_addr(?lstr4_PlayScreen+0)
MOVT	R0, #hi_addr(?lstr4_PlayScreen+0)
MOVS	R2, #0
MOVW	R1, #130
BL	_TFT_Write_Text+0
;PlayScreen.c,335 :: 		TFT_Write_Char(level+48, 160 + 8, 0);
MOVW	R0, #lo_addr(_level+0)
MOVT	R0, #hi_addr(_level+0)
LDRSB	R0, [R0, #0]
ADDS	R0, #48
MOVS	R2, #0
MOVW	R1, #168
UXTH	R0, R0
BL	_TFT_Write_Char+0
;PlayScreen.c,338 :: 		TFT_Write_Text("Lives", 160 - 30, GRID_SIZE);
MOVW	R0, #lo_addr(?lstr5_PlayScreen+0)
MOVT	R0, #hi_addr(?lstr5_PlayScreen+0)
MOVW	R2, #16
MOVW	R1, #130
BL	_TFT_Write_Text+0
;PlayScreen.c,339 :: 		TFT_Write_Char(lives+48, 160 + 8, GRID_SIZE);
MOVW	R0, #lo_addr(_lives+0)
MOVT	R0, #hi_addr(_lives+0)
LDRSB	R0, [R0, #0]
ADDS	R0, #48
MOVW	R2, #16
MOVW	R1, #168
UXTH	R0, R0
BL	_TFT_Write_Char+0
;PlayScreen.c,341 :: 		}
L_end_PlayScreen:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _PlayScreen
_speedcal:
;PlayScreen.c,343 :: 		void speedcal(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;PlayScreen.c,344 :: 		adcVal = getAdcReading()/38.4 + 1; // Convert the ADC1 value between 1 and 100
BL	_getAdcReading+0
BL	__UnsignedIntegralToFloat+0
MOVW	R2, #39322
MOVT	R2, #16921
BL	__Div_FP+0
MOV	R2, #1065353216
BL	__Add_FP+0
BL	__FloatToUnsignedIntegral+0
UXTH	R0, R0
MOVW	R1, #lo_addr(_adcVal+0)
MOVT	R1, #hi_addr(_adcVal+0)
STRH	R0, [R1, #0]
;PlayScreen.c,345 :: 		}
L_end_speedcal:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _speedcal
