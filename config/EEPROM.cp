#line 1 "E:/University of New Haven/Semester 2/Embedded Systems/Project 3/3C/Objective 2/EEPROM.c"
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
#line 1 "d:/mikroc pro for arm/include/stdint.h"





typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;
typedef signed long long int64_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;
typedef unsigned long long uint64_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;
typedef signed long long int_least64_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;
typedef unsigned long long uint_least64_t;



typedef signed long int int_fast8_t;
typedef signed long int int_fast16_t;
typedef signed long int int_fast32_t;
typedef signed long long int_fast64_t;


typedef unsigned long int uint_fast8_t;
typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long long uint_fast64_t;


typedef signed long int intptr_t;
typedef unsigned long int uintptr_t;


typedef signed long long intmax_t;
typedef unsigned long long uintmax_t;
#line 4 "E:/University of New Haven/Semester 2/Embedded Systems/Project 3/3C/Objective 2/EEPROM.c"
int i;


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
