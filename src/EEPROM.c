#include "common.h"
#include "stdint.h"

int i;

// I2C helper functions
void I2C_Start() {
    I2C1_CR1 |= (1 << 8);
    while(!(I2C1_SR1 & (1 << 0)));
}

void I2C_Stop() {
    I2C1_CR1 |= (1 << 9);
    while(I2C1_SR2 & (1 << 1));
}

void I2C_Write(char dat) {
    I2C1_DR = dat;
    while(!(I2C1_SR1 & (1 << 7)));
}

char I2C_Read(char ack) {
    char dat;

    if(ack)
        I2C1_CR1 |= (1 << 10);
    else
        I2C1_CR1 &= ~(1 << 10);

    while(!(I2C1_SR1 & (1 << 6)));
    dat = I2C1_DR;

    return dat;
}

// Write current score to EEPROM
void WriteCurrentScore(CurrentScore *score) {
    unsigned char byte1, byte2, byte3, byte4;

    byte1 = (unsigned char)(score->score >> 24);
    byte2 = (unsigned char)(score->score >> 16);
    byte3 = (unsigned char)(score->score >> 8);
    byte4 = (unsigned char)score->score;

    I2C_Start();
    I2C_Write(EEPROM_ADDRESS * 2);
    I2C_Write(SCORE_ADDRESS);

    I2C_Write(byte1);
    I2C_Write(byte2);
    I2C_Write(byte3);
    I2C_Write(byte4);

    I2C_Write(score->initials[0]);
    I2C_Write(score->initials[1]);
    I2C_Write(score->initials[2]);

    I2C_Stop();
    Delay_ms(10);
}

// Read current score from EEPROM
void ReadCurrentScore(CurrentScore *score) {
    unsigned char byte1, byte2, byte3, byte4;

    I2C_Start();
    I2C_Write(EEPROM_ADDRESS * 2);
    I2C_Write(SCORE_ADDRESS);

    I2C_Start();
    I2C_Write((EEPROM_ADDRESS * 2) + 1);

    byte1 = I2C_Read(1);
    byte2 = I2C_Read(1);
    byte3 = I2C_Read(1);
    byte4 = I2C_Read(1);

    score->score = 0;
    score->score |= (unsigned long)byte1 << 24;
    score->score |= (unsigned long)byte2 << 16;
    score->score |= (unsigned long)byte3 << 8;
    score->score |= byte4;

    score->initials[0] = I2C_Read(1);
    score->initials[1] = I2C_Read(1);
    score->initials[2] = I2C_Read(0);

    I2C_Stop();
}

// UART functions
void UART_Write_Char(char c) {
    while(!(USART1_SR & (1<<7)));
    USART1_DR = c;
    while(!(USART1_SR & (1<<6)));
}

char UART_Read_Char() {
    while(!(USART1_SR & (1<<5)));
    return USART1_DR;
}

void GetPlayerInitials(char initials[]) {
    char *msg = "Enter 3 initials: ";
    char *ptr = msg;
    char i;

    while (*ptr) {
        UART_Write_Char(*ptr++);
        Delay_ms(1);
    }

    for (i = 0; i < 3; i++) {
        char receivedChar;
        do {
            receivedChar = UART_Read_Char();
            UART_Write_Char(receivedChar);
        } while (receivedChar == '\r' || receivedChar == '\n');

        initials[i] = receivedChar;
    }
}

void Write_Current_Score(unsigned long score, char initials[]) {
    CurrentScore newCurrentScore;

    newCurrentScore.score = score;
    for (i = 0; i < 3; i++) {
        newCurrentScore.initials[i] = initials[i];
    }

    WriteCurrentScore(&newCurrentScore);
}

