_I2C_Start:
;EEPROM.c,7 :: 		void I2C_Start() {
;EEPROM.c,8 :: 		I2C1_CR1 |= (1 << 8);
MOVW	R0, #lo_addr(I2C1_CR1+0)
MOVT	R0, #hi_addr(I2C1_CR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #256
MOVW	R0, #lo_addr(I2C1_CR1+0)
MOVT	R0, #hi_addr(I2C1_CR1+0)
STR	R1, [R0, #0]
;EEPROM.c,9 :: 		while(!(I2C1_SR1 & (1 << 0)));
L_I2C_Start0:
MOVW	R0, #lo_addr(I2C1_SR1+0)
MOVT	R0, #hi_addr(I2C1_SR1+0)
LDR	R0, [R0, #0]
AND	R0, R0, #1
CMP	R0, #0
IT	NE
BNE	L_I2C_Start1
IT	AL
BAL	L_I2C_Start0
L_I2C_Start1:
;EEPROM.c,10 :: 		}
L_end_I2C_Start:
BX	LR
; end of _I2C_Start
_I2C_Stop:
;EEPROM.c,12 :: 		void I2C_Stop() {
;EEPROM.c,13 :: 		I2C1_CR1 |= (1 << 9);
MOVW	R0, #lo_addr(I2C1_CR1+0)
MOVT	R0, #hi_addr(I2C1_CR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #512
MOVW	R0, #lo_addr(I2C1_CR1+0)
MOVT	R0, #hi_addr(I2C1_CR1+0)
STR	R1, [R0, #0]
;EEPROM.c,14 :: 		while(I2C1_SR2 & (1 << 1));
L_I2C_Stop2:
MOVW	R0, #lo_addr(I2C1_SR2+0)
MOVT	R0, #hi_addr(I2C1_SR2+0)
LDR	R0, [R0, #0]
AND	R0, R0, #2
CMP	R0, #0
IT	EQ
BEQ	L_I2C_Stop3
IT	AL
BAL	L_I2C_Stop2
L_I2C_Stop3:
;EEPROM.c,15 :: 		}
L_end_I2C_Stop:
BX	LR
; end of _I2C_Stop
_I2C_Write:
;EEPROM.c,17 :: 		void I2C_Write(char dat) {
; dat start address is: 0 (R0)
; dat end address is: 0 (R0)
; dat start address is: 0 (R0)
;EEPROM.c,18 :: 		I2C1_DR = dat;
MOVW	R1, #lo_addr(I2C1_DR+0)
MOVT	R1, #hi_addr(I2C1_DR+0)
STR	R0, [R1, #0]
; dat end address is: 0 (R0)
;EEPROM.c,19 :: 		while(!(I2C1_SR1 & (1 << 7)));
L_I2C_Write4:
MOVW	R1, #lo_addr(I2C1_SR1+0)
MOVT	R1, #hi_addr(I2C1_SR1+0)
LDR	R1, [R1, #0]
AND	R1, R1, #128
CMP	R1, #0
IT	NE
BNE	L_I2C_Write5
IT	AL
BAL	L_I2C_Write4
L_I2C_Write5:
;EEPROM.c,20 :: 		}
L_end_I2C_Write:
BX	LR
; end of _I2C_Write
_I2C_Read:
;EEPROM.c,22 :: 		char I2C_Read(char ack) {
; ack start address is: 0 (R0)
; ack end address is: 0 (R0)
; ack start address is: 0 (R0)
;EEPROM.c,25 :: 		if(ack)
CMP	R0, #0
IT	EQ
BEQ	L_I2C_Read6
; ack end address is: 0 (R0)
;EEPROM.c,26 :: 		I2C1_CR1 |= (1 << 10);
MOVW	R1, #lo_addr(I2C1_CR1+0)
MOVT	R1, #hi_addr(I2C1_CR1+0)
LDR	R1, [R1, #0]
ORR	R2, R1, #1024
MOVW	R1, #lo_addr(I2C1_CR1+0)
MOVT	R1, #hi_addr(I2C1_CR1+0)
STR	R2, [R1, #0]
IT	AL
BAL	L_I2C_Read7
L_I2C_Read6:
;EEPROM.c,28 :: 		I2C1_CR1 &= ~(1 << 10);
MOVW	R1, #lo_addr(I2C1_CR1+0)
MOVT	R1, #hi_addr(I2C1_CR1+0)
LDR	R2, [R1, #0]
MVN	R1, #1024
ANDS	R2, R1
MOVW	R1, #lo_addr(I2C1_CR1+0)
MOVT	R1, #hi_addr(I2C1_CR1+0)
STR	R2, [R1, #0]
L_I2C_Read7:
;EEPROM.c,30 :: 		while(!(I2C1_SR1 & (1 << 6)));
L_I2C_Read8:
MOVW	R1, #lo_addr(I2C1_SR1+0)
MOVT	R1, #hi_addr(I2C1_SR1+0)
LDR	R1, [R1, #0]
AND	R1, R1, #64
CMP	R1, #0
IT	NE
BNE	L_I2C_Read9
IT	AL
BAL	L_I2C_Read8
L_I2C_Read9:
;EEPROM.c,31 :: 		dat = I2C1_DR;
MOVW	R1, #lo_addr(I2C1_DR+0)
MOVT	R1, #hi_addr(I2C1_DR+0)
; dat start address is: 0 (R0)
LDR	R0, [R1, #0]
;EEPROM.c,33 :: 		return dat;
; dat end address is: 0 (R0)
;EEPROM.c,34 :: 		}
L_end_I2C_Read:
BX	LR
; end of _I2C_Read
_WriteCurrentScore:
;EEPROM.c,37 :: 		void WriteCurrentScore(CurrentScore *score) {
; score start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R3, R0
; score end address is: 0 (R0)
; score start address is: 12 (R3)
;EEPROM.c,40 :: 		byte1 = (unsigned char)(score->score >> 24);
LDR	R2, [R3, #0]
LSRS	R1, R2, #24
; byte1 start address is: 16 (R4)
UXTB	R4, R1
;EEPROM.c,41 :: 		byte2 = (unsigned char)(score->score >> 16);
LSRS	R1, R2, #16
; byte2 start address is: 20 (R5)
UXTB	R5, R1
;EEPROM.c,42 :: 		byte3 = (unsigned char)(score->score >> 8);
LSRS	R1, R2, #8
; byte3 start address is: 24 (R6)
UXTB	R6, R1
;EEPROM.c,43 :: 		byte4 = (unsigned char)score->score;
; byte4 start address is: 8 (R2)
UXTB	R2, R2
;EEPROM.c,45 :: 		I2C_Start();
BL	_I2C_Start+0
;EEPROM.c,46 :: 		I2C_Write(EEPROM_ADDRESS * 2);
MOVS	R0, #160
BL	_I2C_Write+0
;EEPROM.c,47 :: 		I2C_Write(SCORE_ADDRESS);
MOVS	R0, #0
BL	_I2C_Write+0
;EEPROM.c,49 :: 		I2C_Write(byte1);
UXTB	R0, R4
; byte1 end address is: 16 (R4)
BL	_I2C_Write+0
;EEPROM.c,50 :: 		I2C_Write(byte2);
UXTB	R0, R5
; byte2 end address is: 20 (R5)
BL	_I2C_Write+0
;EEPROM.c,51 :: 		I2C_Write(byte3);
UXTB	R0, R6
; byte3 end address is: 24 (R6)
BL	_I2C_Write+0
;EEPROM.c,52 :: 		I2C_Write(byte4);
UXTB	R0, R2
; byte4 end address is: 8 (R2)
BL	_I2C_Write+0
;EEPROM.c,54 :: 		I2C_Write(score->initials[0]);
ADDS	R1, R3, #4
LDRB	R1, [R1, #0]
UXTB	R0, R1
BL	_I2C_Write+0
;EEPROM.c,55 :: 		I2C_Write(score->initials[1]);
ADDS	R1, R3, #4
ADDS	R1, R1, #1
LDRB	R1, [R1, #0]
UXTB	R0, R1
BL	_I2C_Write+0
;EEPROM.c,56 :: 		I2C_Write(score->initials[2]);
ADDS	R1, R3, #4
; score end address is: 12 (R3)
ADDS	R1, R1, #2
LDRB	R1, [R1, #0]
UXTB	R0, R1
BL	_I2C_Write+0
;EEPROM.c,58 :: 		I2C_Stop();
BL	_I2C_Stop+0
;EEPROM.c,59 :: 		Delay_ms(10);
MOVW	R7, #54463
MOVT	R7, #1
NOP
NOP
L_WriteCurrentScore10:
SUBS	R7, R7, #1
BNE	L_WriteCurrentScore10
NOP
NOP
NOP
;EEPROM.c,60 :: 		}
L_end_WriteCurrentScore:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _WriteCurrentScore
_ReadCurrentScore:
;EEPROM.c,63 :: 		void ReadCurrentScore(CurrentScore *score) {
; score start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
MOV	R3, R0
; score end address is: 0 (R0)
; score start address is: 12 (R3)
;EEPROM.c,66 :: 		I2C_Start();
BL	_I2C_Start+0
;EEPROM.c,67 :: 		I2C_Write(EEPROM_ADDRESS * 2);
MOVS	R0, #160
BL	_I2C_Write+0
;EEPROM.c,68 :: 		I2C_Write(SCORE_ADDRESS);
MOVS	R0, #0
BL	_I2C_Write+0
;EEPROM.c,70 :: 		I2C_Start();
BL	_I2C_Start+0
;EEPROM.c,71 :: 		I2C_Write((EEPROM_ADDRESS * 2) + 1);
MOVS	R0, #161
BL	_I2C_Write+0
;EEPROM.c,73 :: 		byte1 = I2C_Read(1);
MOVS	R0, #1
BL	_I2C_Read+0
; byte1 start address is: 24 (R6)
UXTB	R6, R0
;EEPROM.c,74 :: 		byte2 = I2C_Read(1);
MOVS	R0, #1
BL	_I2C_Read+0
; byte2 start address is: 16 (R4)
UXTB	R4, R0
;EEPROM.c,75 :: 		byte3 = I2C_Read(1);
MOVS	R0, #1
BL	_I2C_Read+0
; byte3 start address is: 20 (R5)
UXTB	R5, R0
;EEPROM.c,76 :: 		byte4 = I2C_Read(1);
MOVS	R0, #1
BL	_I2C_Read+0
; byte4 start address is: 0 (R0)
;EEPROM.c,78 :: 		score->score = 0;
MOVS	R1, #0
STR	R1, [R3, #0]
;EEPROM.c,79 :: 		score->score |= (unsigned long)byte1 << 24;
UXTB	R1, R6
; byte1 end address is: 24 (R6)
LSLS	R2, R1, #24
LDR	R1, [R3, #0]
ORRS	R1, R2
STR	R1, [R3, #0]
;EEPROM.c,80 :: 		score->score |= (unsigned long)byte2 << 16;
UXTB	R1, R4
; byte2 end address is: 16 (R4)
LSLS	R2, R1, #16
LDR	R1, [R3, #0]
ORRS	R1, R2
STR	R1, [R3, #0]
;EEPROM.c,81 :: 		score->score |= (unsigned long)byte3 << 8;
UXTB	R1, R5
; byte3 end address is: 20 (R5)
LSLS	R2, R1, #8
LDR	R1, [R3, #0]
ORRS	R1, R2
STR	R1, [R3, #0]
;EEPROM.c,82 :: 		score->score |= byte4;
LDR	R1, [R3, #0]
ORRS	R1, R0
; byte4 end address is: 0 (R0)
STR	R1, [R3, #0]
;EEPROM.c,84 :: 		score->initials[0] = I2C_Read(1);
ADDS	R1, R3, #4
STR	R1, [SP, #4]
MOVS	R0, #1
BL	_I2C_Read+0
LDR	R1, [SP, #4]
STRB	R0, [R1, #0]
;EEPROM.c,85 :: 		score->initials[1] = I2C_Read(1);
ADDS	R1, R3, #4
ADDS	R1, R1, #1
STR	R1, [SP, #4]
MOVS	R0, #1
BL	_I2C_Read+0
LDR	R1, [SP, #4]
STRB	R0, [R1, #0]
;EEPROM.c,86 :: 		score->initials[2] = I2C_Read(0);
ADDS	R1, R3, #4
; score end address is: 12 (R3)
ADDS	R1, R1, #2
STR	R1, [SP, #4]
MOVS	R0, #0
BL	_I2C_Read+0
LDR	R1, [SP, #4]
STRB	R0, [R1, #0]
;EEPROM.c,88 :: 		I2C_Stop();
BL	_I2C_Stop+0
;EEPROM.c,89 :: 		}
L_end_ReadCurrentScore:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _ReadCurrentScore
_UART_Write_Char:
;EEPROM.c,92 :: 		void UART_Write_Char(char c) {
; c start address is: 0 (R0)
; c end address is: 0 (R0)
; c start address is: 0 (R0)
; c end address is: 0 (R0)
;EEPROM.c,93 :: 		while(!(USART1_SR & (1<<7)));
L_UART_Write_Char12:
; c start address is: 0 (R0)
MOVW	R1, #lo_addr(USART1_SR+0)
MOVT	R1, #hi_addr(USART1_SR+0)
LDR	R1, [R1, #0]
AND	R1, R1, #128
CMP	R1, #0
IT	NE
BNE	L_UART_Write_Char13
IT	AL
BAL	L_UART_Write_Char12
L_UART_Write_Char13:
;EEPROM.c,94 :: 		USART1_DR = c;
MOVW	R1, #lo_addr(USART1_DR+0)
MOVT	R1, #hi_addr(USART1_DR+0)
STR	R0, [R1, #0]
; c end address is: 0 (R0)
;EEPROM.c,95 :: 		while(!(USART1_SR & (1<<6)));
L_UART_Write_Char14:
MOVW	R1, #lo_addr(USART1_SR+0)
MOVT	R1, #hi_addr(USART1_SR+0)
LDR	R1, [R1, #0]
AND	R1, R1, #64
CMP	R1, #0
IT	NE
BNE	L_UART_Write_Char15
IT	AL
BAL	L_UART_Write_Char14
L_UART_Write_Char15:
;EEPROM.c,96 :: 		}
L_end_UART_Write_Char:
BX	LR
; end of _UART_Write_Char
_UART_Read_Char:
;EEPROM.c,98 :: 		char UART_Read_Char() {
;EEPROM.c,99 :: 		while(!(USART1_SR & (1<<5)));
L_UART_Read_Char16:
MOVW	R0, #lo_addr(USART1_SR+0)
MOVT	R0, #hi_addr(USART1_SR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #32
CMP	R0, #0
IT	NE
BNE	L_UART_Read_Char17
IT	AL
BAL	L_UART_Read_Char16
L_UART_Read_Char17:
;EEPROM.c,100 :: 		return USART1_DR;
MOVW	R0, #lo_addr(USART1_DR+0)
MOVT	R0, #hi_addr(USART1_DR+0)
LDR	R0, [R0, #0]
;EEPROM.c,101 :: 		}
L_end_UART_Read_Char:
BX	LR
; end of _UART_Read_Char
_GetPlayerInitials:
;EEPROM.c,103 :: 		void GetPlayerInitials(char initials[]) {
; initials start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
MOV	R1, R0
; initials end address is: 0 (R0)
; initials start address is: 4 (R1)
;EEPROM.c,104 :: 		char *msg = "Enter 3 initials: ";
; msg start address is: 8 (R2)
MOVW	R2, #lo_addr(?lstr1_EEPROM+0)
MOVT	R2, #hi_addr(?lstr1_EEPROM+0)
;EEPROM.c,105 :: 		char *ptr = msg;
; ptr start address is: 0 (R0)
MOV	R0, R2
; initials end address is: 4 (R1)
; msg end address is: 8 (R2)
; ptr end address is: 0 (R0)
MOV	R2, R1
MOV	R3, R0
;EEPROM.c,108 :: 		while (*ptr) {
L_GetPlayerInitials18:
; ptr start address is: 12 (R3)
; initials start address is: 8 (R2)
LDRB	R1, [R3, #0]
CMP	R1, #0
IT	EQ
BEQ	L_GetPlayerInitials19
;EEPROM.c,109 :: 		UART_Write_Char(*ptr++);
LDRB	R1, [R3, #0]
UXTB	R0, R1
BL	_UART_Write_Char+0
ADDS	R3, R3, #1
;EEPROM.c,110 :: 		Delay_ms(1);
MOVW	R7, #11999
MOVT	R7, #0
NOP
NOP
L_GetPlayerInitials20:
SUBS	R7, R7, #1
BNE	L_GetPlayerInitials20
NOP
NOP
NOP
;EEPROM.c,111 :: 		}
; ptr end address is: 12 (R3)
IT	AL
BAL	L_GetPlayerInitials18
L_GetPlayerInitials19:
;EEPROM.c,113 :: 		for (i = 0; i < 3; i++) {
; i start address is: 0 (R0)
MOVS	R0, #0
; initials end address is: 8 (R2)
; i end address is: 0 (R0)
L_GetPlayerInitials22:
; i start address is: 0 (R0)
; initials start address is: 8 (R2)
CMP	R0, #3
IT	CS
BCS	L_GetPlayerInitials23
; initials end address is: 8 (R2)
; i end address is: 0 (R0)
UXTB	R4, R0
MOV	R3, R2
;EEPROM.c,118 :: 		} while (receivedChar == '\r' || receivedChar == '\n');
IT	AL
BAL	L__GetPlayerInitials35
L__GetPlayerInitials36:
L__GetPlayerInitials35:
; initials start address is: 12 (R3)
; i start address is: 16 (R4)
; i end address is: 16 (R4)
; initials end address is: 12 (R3)
IT	AL
BAL	L__GetPlayerInitials34
L__GetPlayerInitials37:
L__GetPlayerInitials34:
;EEPROM.c,116 :: 		receivedChar = UART_Read_Char();
; i start address is: 16 (R4)
; initials start address is: 12 (R3)
BL	_UART_Read_Char+0
STRB	R0, [SP, #4]
;EEPROM.c,117 :: 		UART_Write_Char(receivedChar);
BL	_UART_Write_Char+0
;EEPROM.c,118 :: 		} while (receivedChar == '\r' || receivedChar == '\n');
LDRB	R1, [SP, #4]
CMP	R1, #13
IT	EQ
BEQ	L__GetPlayerInitials36
LDRB	R1, [SP, #4]
CMP	R1, #10
IT	EQ
BEQ	L__GetPlayerInitials37
L__GetPlayerInitials33:
;EEPROM.c,120 :: 		initials[i] = receivedChar;
ADDS	R2, R3, R4
LDRB	R1, [SP, #4]
STRB	R1, [R2, #0]
;EEPROM.c,113 :: 		for (i = 0; i < 3; i++) {
ADDS	R1, R4, #1
; i end address is: 16 (R4)
; i start address is: 0 (R0)
UXTB	R0, R1
;EEPROM.c,121 :: 		}
MOV	R2, R3
; initials end address is: 12 (R3)
; i end address is: 0 (R0)
IT	AL
BAL	L_GetPlayerInitials22
L_GetPlayerInitials23:
;EEPROM.c,122 :: 		}
L_end_GetPlayerInitials:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _GetPlayerInitials
_Write_Current_Score:
;EEPROM.c,124 :: 		void Write_Current_Score(unsigned long score, char initials[]) {
; initials start address is: 4 (R1)
; score start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; initials end address is: 4 (R1)
; score end address is: 0 (R0)
; score start address is: 0 (R0)
; initials start address is: 4 (R1)
;EEPROM.c,127 :: 		newCurrentScore.score = score;
STR	R0, [SP, #4]
; score end address is: 0 (R0)
;EEPROM.c,128 :: 		for (i = 0; i < 3; i++) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
STRH	R3, [R2, #0]
; initials end address is: 4 (R1)
MOV	R0, R1
L_Write_Current_Score30:
; initials start address is: 0 (R0)
; initials start address is: 0 (R0)
; initials end address is: 0 (R0)
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRSH	R2, [R2, #0]
CMP	R2, #3
IT	GE
BGE	L_Write_Current_Score31
; initials end address is: 0 (R0)
;EEPROM.c,129 :: 		newCurrentScore.initials[i] = initials[i];
; initials start address is: 0 (R0)
ADD	R3, SP, #8
MOVW	R4, #lo_addr(_i+0)
MOVT	R4, #hi_addr(_i+0)
LDRSH	R2, [R4, #0]
ADDS	R3, R3, R2
MOV	R2, R4
LDRSH	R2, [R2, #0]
ADDS	R2, R0, R2
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
;EEPROM.c,128 :: 		for (i = 0; i < 3; i++) {
MOV	R2, R4
LDRSH	R2, [R2, #0]
ADDS	R2, R2, #1
STRH	R2, [R4, #0]
;EEPROM.c,130 :: 		}
; initials end address is: 0 (R0)
IT	AL
BAL	L_Write_Current_Score30
L_Write_Current_Score31:
;EEPROM.c,132 :: 		WriteCurrentScore(&newCurrentScore);
ADD	R2, SP, #4
MOV	R0, R2
BL	_WriteCurrentScore+0
;EEPROM.c,133 :: 		}
L_end_Write_Current_Score:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Write_Current_Score
