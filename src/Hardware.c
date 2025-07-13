#include "common.h"

void InitializeHardware(){
  // Initialize 240x320 TFT display
  TFT_Init_ILI9341_8bit(DISPLAY_X, DISPLAY_Y);

}

void PinInitialize(){
    //GPIO Ports Initialization
    RCC_APB2ENR |= 1 << 2; // Enable GPIOA clock - necessary to use GPIOA
    RCC_APB2ENR |= 1 << 3; // Enable GPIOB clock - necessary to use GPIOB
    RCC_APB2ENR |= 1 << 4; // Enable GPIOC clock - necessary to use GPIOC
    RCC_APB2ENR |= 1 << 5; // Enable GPIOD clock - necessary to use GPIOD
    RCC_APB2ENR |= 1 << 6; // Enable GPIOE clock


    GPIOA_CRL = 0X88888888; // Set PORTA/L as input
    GPIOB_CRL = 0X88888888; // Set PORTB/L as input
    GPIOC_CRH = 0X88888888; // Set PORTC/H as input
    GPIOD_CRL = 0X88888888; // Set PORTD/L as input
    GPIOE_CRH = 0x33333333; // Configure GPIOE/H as output for LEDs


    // Initialize the pin GPIOE_ODR.14 for playing sound
    Sound_Init(&GPIOE_ODR, 14);
}

void ExternalIntConfiguration(){
     RCC_APB2ENR.AFIOEN = 1;     // Enable clock for alternate pin function
     AFIO_EXTICR1  = 0x00000300; // PD2 as External interrupt
     AFIO_EXTICR2 |= 0x00000013; // PA6, PB5, PD4 as External interrupt
     AFIO_EXTICR4 |= 0x00000020; // PC13 as External interrupt

     // Configure EXTI for falling edge
     EXTI_FTSR |= (1 << 2) | (1 << 4) | (1 << 5) | (1 << 6) | (1 << 13); // Enable falling edge

     // Enable interrupts for these EXTI lines
     EXTI_IMR |= (1 << 2) | (1 << 4) | (1 << 5) | (1 << 6) | (1 << 13);

     // Enable NVIC for corresponding interrupt lines
     NVIC_ISER0 |= (1 << 8) | (1 << 10); // EXTI2, EXTI4
     NVIC_ISER0.B23 = 1; // EXTI9_5
     NVIC_ISER1 |= (1 << (40 - 32)); // EXTI15_10
}

void AdcConfiguration(){   // ADC for PC0
        RCC_APB2ENR |= 1 << 4; // Enable PORTC clock
        RCC_APB2ENR |= 1 << 9 ; // Enable ADC1 Clock
        GPIOC_CRL &= ~(0xF << 0); // Configure PC0 as an Analog Input
        ADC1_SQR1 = (0b0000 << 20); // 1 conversion
        ADC1_SQR3 = 10;        // Select Channel 10 as only one in conversion sequence
        ADC1_SMPR1 = 0b100; // Set sample time on channel 10
        ADC1_CR2 |= (0b111 << 17); // Set software start as external event for regular group conversion
        ADC1_CR2.ADON = 1; // Enable ADC1
        delay_ms(10);
}

unsigned int getAdcReading(){
        // Bit 20 is set to start conversion of an external channel, bit 22 starts the conversion
        ADC1_CR2 |= (1 << 22) | (1 << 20);
        while(!(ADC1_SR & 0b10)); // Wait until the ADC conversion has ended
        return ADC1_DR;        // Read value from data register. This also clears start bit
}

void Timer3Configuration(){
        RCC_APB1ENR |= (1 << 1);   // Enable TIMER3 clock. RCC: Clock Configuration Register
        TIM3_CR1 = 0x0000;  // Disable timer until configuration is complete
        TIM3_PSC = 7999;    // Clock to TIMx_CNT = 72000000 (clock applied to prescaler register) /
                                            // 7999 (Value in TIMx_PSC) + 1) = 9000
        TIM3_ARR = 6750;        // Reload timer count register with this value when count register resets
                                                // to 0 after counting from zero to this value
        NVIC_ISER0.B29 = 1;        // Enable global interrupt for TIMER3 in NVIC
        TIM3_DIER.UIE = 1;          // Update interrupt enable
        TIM3_CR1 = 0x0001;         // Enable TIMER3, count up
}

void Timer1Configuration(){
     RCC_APB2ENR |= (1 << 11);   // Enable TIMER1 clock. RCC: Clock Configuration Register
     TIM1_CR1 = 0x0000;  // Disable timer until configuration is complete
     TIM1_PSC = 7999;    // Clock to TIMx_CNT = 72000000 (clock applied to prescaler register) /
                                        //                     7999 (Value in TIMx_PSC) + 1) = 9000
     TIM1_ARR = 9000;        // Reload timer count register with this value when count register resets
                                            // to 0 after counting from zero to this value
     NVIC_ISER0.B25 = 1;        // Enable global interrupt for TIMER3 in NVIC
     TIM1_DIER.UIE = 1;          // Update interrupt enable
     TIM1_CR1 = 0x0001;         // Enable TIMER1, count up (BIT4=0)
}


/*
void InitializeUART1(){

}

void InitializeTimer1(){

}
*/