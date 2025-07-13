_InitializeHardware:
;Hardware.c,3 :: 		void InitializeHardware(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Hardware.c,5 :: 		TFT_Init_ILI9341_8bit(DISPLAY_X, DISPLAY_Y);
MOVS	R1, #240
MOVW	R0, #320
BL	_TFT_Init_ILI9341_8bit+0
;Hardware.c,7 :: 		}
L_end_InitializeHardware:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitializeHardware
_PinInitialize:
;Hardware.c,9 :: 		void PinInitialize(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Hardware.c,11 :: 		RCC_APB2ENR |= 1 << 2; // Enable GPIOA clock - necessary to use GPIOA
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;Hardware.c,12 :: 		RCC_APB2ENR |= 1 << 3; // Enable GPIOB clock - necessary to use GPIOB
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;Hardware.c,13 :: 		RCC_APB2ENR |= 1 << 4; // Enable GPIOC clock - necessary to use GPIOC
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #16
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;Hardware.c,14 :: 		RCC_APB2ENR |= 1 << 5; // Enable GPIOD clock - necessary to use GPIOD
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #32
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;Hardware.c,15 :: 		RCC_APB2ENR |= 1 << 6; // Enable GPIOE clock
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #64
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;Hardware.c,18 :: 		GPIOA_CRL = 0X88888888; // Set PORTA/L as input
MOV	R1, #-2004318072
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
STR	R1, [R0, #0]
;Hardware.c,19 :: 		GPIOB_CRL = 0X88888888; // Set PORTB/L as input
MOV	R1, #-2004318072
MOVW	R0, #lo_addr(GPIOB_CRL+0)
MOVT	R0, #hi_addr(GPIOB_CRL+0)
STR	R1, [R0, #0]
;Hardware.c,20 :: 		GPIOC_CRH = 0X88888888; // Set PORTC/H as input
MOV	R1, #-2004318072
MOVW	R0, #lo_addr(GPIOC_CRH+0)
MOVT	R0, #hi_addr(GPIOC_CRH+0)
STR	R1, [R0, #0]
;Hardware.c,21 :: 		GPIOD_CRL = 0X88888888; // Set PORTD/L as input
MOV	R1, #-2004318072
MOVW	R0, #lo_addr(GPIOD_CRL+0)
MOVT	R0, #hi_addr(GPIOD_CRL+0)
STR	R1, [R0, #0]
;Hardware.c,22 :: 		GPIOE_CRH = 0x33333333; // Configure GPIOE/H as output for LEDs
MOV	R1, #858993459
MOVW	R0, #lo_addr(GPIOE_CRH+0)
MOVT	R0, #hi_addr(GPIOE_CRH+0)
STR	R1, [R0, #0]
;Hardware.c,26 :: 		Sound_Init(&GPIOE_ODR, 14);
MOVS	R1, #14
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
BL	_Sound_Init+0
;Hardware.c,27 :: 		}
L_end_PinInitialize:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _PinInitialize
_ExternalIntConfiguration:
;Hardware.c,29 :: 		void ExternalIntConfiguration(){
;Hardware.c,30 :: 		RCC_APB2ENR.AFIOEN = 1;     // Enable clock for alternate pin function
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
_SX	[R0, ByteOffset(RCC_APB2ENR+0)]
;Hardware.c,31 :: 		AFIO_EXTICR1  = 0x00000300; // PD2 as External interrupt
MOVW	R1, #768
MOVW	R0, #lo_addr(AFIO_EXTICR1+0)
MOVT	R0, #hi_addr(AFIO_EXTICR1+0)
STR	R1, [R0, #0]
;Hardware.c,32 :: 		AFIO_EXTICR2 |= 0x00000013; // PA6, PB5, PD4 as External interrupt
MOVW	R0, #lo_addr(AFIO_EXTICR2+0)
MOVT	R0, #hi_addr(AFIO_EXTICR2+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #19
MOVW	R0, #lo_addr(AFIO_EXTICR2+0)
MOVT	R0, #hi_addr(AFIO_EXTICR2+0)
STR	R1, [R0, #0]
;Hardware.c,33 :: 		AFIO_EXTICR4 |= 0x00000020; // PC13 as External interrupt
MOVW	R0, #lo_addr(AFIO_EXTICR4+0)
MOVT	R0, #hi_addr(AFIO_EXTICR4+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #32
MOVW	R0, #lo_addr(AFIO_EXTICR4+0)
MOVT	R0, #hi_addr(AFIO_EXTICR4+0)
STR	R1, [R0, #0]
;Hardware.c,36 :: 		EXTI_FTSR |= (1 << 2) | (1 << 4) | (1 << 5) | (1 << 6) | (1 << 13); // Enable falling edge
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
LDR	R1, [R0, #0]
MOVW	R0, #8308
ORRS	R1, R0
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
STR	R1, [R0, #0]
;Hardware.c,39 :: 		EXTI_IMR |= (1 << 2) | (1 << 4) | (1 << 5) | (1 << 6) | (1 << 13);
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
LDR	R1, [R0, #0]
MOVW	R0, #8308
ORRS	R1, R0
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
STR	R1, [R0, #0]
;Hardware.c,42 :: 		NVIC_ISER0 |= (1 << 8) | (1 << 10); // EXTI2, EXTI4
MOVW	R0, #lo_addr(NVIC_ISER0+0)
MOVT	R0, #hi_addr(NVIC_ISER0+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1280
MOVW	R0, #lo_addr(NVIC_ISER0+0)
MOVT	R0, #hi_addr(NVIC_ISER0+0)
STR	R1, [R0, #0]
;Hardware.c,43 :: 		NVIC_ISER0.B23 = 1; // EXTI9_5
MOVW	R1, #lo_addr(NVIC_ISER0+0)
MOVT	R1, #hi_addr(NVIC_ISER0+0)
LDR	R0, [R1, #0]
BFI	R0, R2, #23, #1
STR	R0, [R1, #0]
;Hardware.c,44 :: 		NVIC_ISER1 |= (1 << (40 - 32)); // EXTI15_10
MOVW	R0, #lo_addr(NVIC_ISER1+0)
MOVT	R0, #hi_addr(NVIC_ISER1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #256
MOVW	R0, #lo_addr(NVIC_ISER1+0)
MOVT	R0, #hi_addr(NVIC_ISER1+0)
STR	R1, [R0, #0]
;Hardware.c,45 :: 		}
L_end_ExternalIntConfiguration:
BX	LR
; end of _ExternalIntConfiguration
_AdcConfiguration:
;Hardware.c,47 :: 		void AdcConfiguration(){   // ADC for PC0
;Hardware.c,48 :: 		RCC_APB2ENR |= 1 << 4; // Enable PORTC clock
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #16
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;Hardware.c,49 :: 		RCC_APB2ENR |= 1 << 9 ; // Enable ADC1 Clock
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #512
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;Hardware.c,50 :: 		GPIOC_CRL &= ~(0xF << 0); // Configure PC0 as an Analog Input
MOVW	R0, #lo_addr(GPIOC_CRL+0)
MOVT	R0, #hi_addr(GPIOC_CRL+0)
LDR	R1, [R0, #0]
MVN	R0, #15
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_CRL+0)
MOVT	R0, #hi_addr(GPIOC_CRL+0)
STR	R1, [R0, #0]
;Hardware.c,51 :: 		ADC1_SQR1 = (0b0000 << 20); // 1 conversion
MOVW	R1, #0
MOVW	R0, #lo_addr(ADC1_SQR1+0)
MOVT	R0, #hi_addr(ADC1_SQR1+0)
STR	R1, [R0, #0]
;Hardware.c,52 :: 		ADC1_SQR3 = 10;        // Select Channel 10 as only one in conversion sequence
MOVS	R1, #10
MOVW	R0, #lo_addr(ADC1_SQR3+0)
MOVT	R0, #hi_addr(ADC1_SQR3+0)
STR	R1, [R0, #0]
;Hardware.c,53 :: 		ADC1_SMPR1 = 0b100; // Set sample time on channel 10
MOVS	R1, #4
MOVW	R0, #lo_addr(ADC1_SMPR1+0)
MOVT	R0, #hi_addr(ADC1_SMPR1+0)
STR	R1, [R0, #0]
;Hardware.c,54 :: 		ADC1_CR2 |= (0b111 << 17); // Set software start as external event for regular group conversion
MOVW	R0, #lo_addr(ADC1_CR2+0)
MOVT	R0, #hi_addr(ADC1_CR2+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC1_CR2+0)
MOVT	R0, #hi_addr(ADC1_CR2+0)
STR	R1, [R0, #0]
;Hardware.c,55 :: 		ADC1_CR2.ADON = 1; // Enable ADC1
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ADC1_CR2+0)
MOVT	R0, #hi_addr(ADC1_CR2+0)
_SX	[R0, ByteOffset(ADC1_CR2+0)]
;Hardware.c,56 :: 		delay_ms(10);
MOVW	R7, #54463
MOVT	R7, #1
NOP
NOP
L_AdcConfiguration0:
SUBS	R7, R7, #1
BNE	L_AdcConfiguration0
NOP
NOP
NOP
;Hardware.c,57 :: 		}
L_end_AdcConfiguration:
BX	LR
; end of _AdcConfiguration
_getAdcReading:
;Hardware.c,59 :: 		unsigned int getAdcReading(){
;Hardware.c,61 :: 		ADC1_CR2 |= (1 << 22) | (1 << 20);
MOVW	R0, #lo_addr(ADC1_CR2+0)
MOVT	R0, #hi_addr(ADC1_CR2+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC1_CR2+0)
MOVT	R0, #hi_addr(ADC1_CR2+0)
STR	R1, [R0, #0]
;Hardware.c,62 :: 		while(!(ADC1_SR & 0b10)); // Wait until the ADC conversion has ended
L_getAdcReading2:
MOVW	R0, #lo_addr(ADC1_SR+0)
MOVT	R0, #hi_addr(ADC1_SR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #2
CMP	R0, #0
IT	NE
BNE	L_getAdcReading3
IT	AL
BAL	L_getAdcReading2
L_getAdcReading3:
;Hardware.c,63 :: 		return ADC1_DR;        // Read value from data register. This also clears start bit
MOVW	R0, #lo_addr(ADC1_DR+0)
MOVT	R0, #hi_addr(ADC1_DR+0)
LDR	R0, [R0, #0]
;Hardware.c,64 :: 		}
L_end_getAdcReading:
BX	LR
; end of _getAdcReading
_Timer3Configuration:
;Hardware.c,66 :: 		void Timer3Configuration(){
;Hardware.c,67 :: 		RCC_APB1ENR |= (1 << 1);   // Enable TIMER3 clock. RCC: Clock Configuration Register
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;Hardware.c,68 :: 		TIM3_CR1 = 0x0000;  // Disable timer until configuration is complete
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;Hardware.c,69 :: 		TIM3_PSC = 7999;    // Clock to TIMx_CNT = 72000000 (clock applied to prescaler register) /
MOVW	R1, #7999
MOVW	R0, #lo_addr(TIM3_PSC+0)
MOVT	R0, #hi_addr(TIM3_PSC+0)
STR	R1, [R0, #0]
;Hardware.c,71 :: 		TIM3_ARR = 6750;        // Reload timer count register with this value when count register resets
MOVW	R1, #6750
MOVW	R0, #lo_addr(TIM3_ARR+0)
MOVT	R0, #hi_addr(TIM3_ARR+0)
STR	R1, [R0, #0]
;Hardware.c,73 :: 		NVIC_ISER0.B29 = 1;        // Enable global interrupt for TIMER3 in NVIC
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(NVIC_ISER0+0)
MOVT	R1, #hi_addr(NVIC_ISER0+0)
LDR	R0, [R1, #0]
BFI	R0, R2, #29, #1
STR	R0, [R1, #0]
;Hardware.c,74 :: 		TIM3_DIER.UIE = 1;          // Update interrupt enable
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
_SX	[R0, ByteOffset(TIM3_DIER+0)]
;Hardware.c,75 :: 		TIM3_CR1 = 0x0001;         // Enable TIMER3, count up
MOVS	R1, #1
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;Hardware.c,76 :: 		}
L_end_Timer3Configuration:
BX	LR
; end of _Timer3Configuration
_Timer1Configuration:
;Hardware.c,78 :: 		void Timer1Configuration(){
;Hardware.c,79 :: 		RCC_APB2ENR |= (1 << 11);   // Enable TIMER1 clock. RCC: Clock Configuration Register
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2048
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;Hardware.c,80 :: 		TIM1_CR1 = 0x0000;  // Disable timer until configuration is complete
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM1_CR1+0)
MOVT	R0, #hi_addr(TIM1_CR1+0)
STR	R1, [R0, #0]
;Hardware.c,81 :: 		TIM1_PSC = 7999;    // Clock to TIMx_CNT = 72000000 (clock applied to prescaler register) /
MOVW	R1, #7999
MOVW	R0, #lo_addr(TIM1_PSC+0)
MOVT	R0, #hi_addr(TIM1_PSC+0)
STR	R1, [R0, #0]
;Hardware.c,83 :: 		TIM1_ARR = 9000;        // Reload timer count register with this value when count register resets
MOVW	R1, #9000
MOVW	R0, #lo_addr(TIM1_ARR+0)
MOVT	R0, #hi_addr(TIM1_ARR+0)
STR	R1, [R0, #0]
;Hardware.c,85 :: 		NVIC_ISER0.B25 = 1;        // Enable global interrupt for TIMER3 in NVIC
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(NVIC_ISER0+0)
MOVT	R1, #hi_addr(NVIC_ISER0+0)
LDR	R0, [R1, #0]
BFI	R0, R2, #25, #1
STR	R0, [R1, #0]
;Hardware.c,86 :: 		TIM1_DIER.UIE = 1;          // Update interrupt enable
MOVW	R0, #lo_addr(TIM1_DIER+0)
MOVT	R0, #hi_addr(TIM1_DIER+0)
_SX	[R0, ByteOffset(TIM1_DIER+0)]
;Hardware.c,87 :: 		TIM1_CR1 = 0x0001;         // Enable TIMER1, count up (BIT4=0)
MOVS	R1, #1
MOVW	R0, #lo_addr(TIM1_CR1+0)
MOVT	R0, #hi_addr(TIM1_CR1+0)
STR	R1, [R0, #0]
;Hardware.c,88 :: 		}
L_end_Timer1Configuration:
BX	LR
; end of _Timer1Configuration
