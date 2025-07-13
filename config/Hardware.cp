#line 1 "E:/University of New Haven/Semester 2/Embedded Systems/Project 3/3C/Objective 2/Hardware.c"
#line 1 "e:/university of new haven/semester 2/embedded systems/project 3/3c/objective 2/common.h"
#line 1 "e:/university of new haven/semester 2/embedded systems/project 3/3c/objective 2/hardware.h"
void InitializeHardware();
void PinInitialize();
void ExternalIntConfiguration();
void AdcConfiguration();
unsigned int getAdcReading();
void Timer3Configuration();
void Timer1Configuration();
#line 1 "e:/university of new haven/semester 2/embedded systems/project 3/3c/objective 2/playscreen.h"
void PlayScreen();
#line 1 "e:/university of new haven/semester 2/embedded systems/project 3/3c/objective 2/gameoverscreen.h"
void GameOverScreen();
#line 1 "e:/university of new haven/semester 2/embedded systems/project 3/3c/objective 2/nextlevelscreen.h"
void NextLevelScreen();
#line 1 "e:/university of new haven/semester 2/embedded systems/project 3/3c/objective 2/gamefinishedscreen.h"
void GameFinishedScreen();
#line 14 "e:/university of new haven/semester 2/embedded systems/project 3/3c/objective 2/common.h"
struct Object{
 int x1;
 int y1;
 int x2;
 int y2;
 int color;
 int direction;
 int row;
};

extern struct Object Frog;
extern struct Object Car1;
extern struct Object Car2;
extern struct Object Car3;
extern struct Object Car4;

extern short int timer;
extern short int level;
extern short int lives;
extern short int score;
#line 3 "E:/University of New Haven/Semester 2/Embedded Systems/Project 3/3C/Objective 2/Hardware.c"
void InitializeHardware(){

 TFT_Init_ILI9341_8bit( 320 ,  240 );

}

void PinInitialize(){

 RCC_APB2ENR |= 1 << 2;
 RCC_APB2ENR |= 1 << 3;
 RCC_APB2ENR |= 1 << 4;
 RCC_APB2ENR |= 1 << 5;
 RCC_APB2ENR |= 1 << 6;


 GPIOA_CRL = 0X88888888;
 GPIOB_CRL = 0X88888888;
 GPIOC_CRH = 0X88888888;
 GPIOD_CRL = 0X88888888;
 GPIOE_CRH = 0x33333333;



 Sound_Init(&GPIOE_ODR, 14);
}

void ExternalIntConfiguration(){
 RCC_APB2ENR.AFIOEN = 1;
 AFIO_EXTICR1 = 0x00000300;
 AFIO_EXTICR2 |= 0x00000013;
 AFIO_EXTICR4 |= 0x00000020;


 EXTI_FTSR |= (1 << 2) | (1 << 4) | (1 << 5) | (1 << 6) | (1 << 13);


 EXTI_IMR |= (1 << 2) | (1 << 4) | (1 << 5) | (1 << 6) | (1 << 13);


 NVIC_ISER0 |= (1 << 8) | (1 << 10);
 NVIC_ISER0.B23 = 1;
 NVIC_ISER1 |= (1 << (40 - 32));
}

void AdcConfiguration(){
 RCC_APB2ENR |= 1 << 4;
 RCC_APB2ENR |= 1 << 9 ;
 GPIOC_CRL &= ~(0xF << 0);
 ADC1_SQR1 = (0b0000 << 20);
 ADC1_SQR3 = 10;
 ADC1_SMPR1 = 0b100;
 ADC1_CR2 |= (0b111 << 17);
 ADC1_CR2.ADON = 1;
 delay_ms(10);
}

unsigned int getAdcReading(){

 ADC1_CR2 |= (1 << 22) | (1 << 20);
 while(!(ADC1_SR & 0b10));
 return ADC1_DR;
}

void Timer3Configuration(){
 RCC_APB1ENR |= (1 << 1);
 TIM3_CR1 = 0x0000;
 TIM3_PSC = 7999;

 TIM3_ARR = 6750;

 NVIC_ISER0.B29 = 1;
 TIM3_DIER.UIE = 1;
 TIM3_CR1 = 0x0001;
}

void Timer1Configuration(){
 RCC_APB2ENR |= (1 << 11);
 TIM1_CR1 = 0x0000;
 TIM1_PSC = 7999;

 TIM1_ARR = 9000;

 NVIC_ISER0.B25 = 1;
 TIM1_DIER.UIE = 1;
 TIM1_CR1 = 0x0001;
}
