#include "stdint.h"

// Constants for EEPROM
#define EEPROM_ADDRESS 0x50
#define SCORE_ADDRESS  0x00

// Structure definition for current score
typedef struct {
    unsigned long score;
    char initials[3];
} CurrentScore;

// Function prototypes
void Init_I2C();
void InitializeUSART1();
void WriteCurrentScore(CurrentScore *);
void ReadCurrentScore(CurrentScore *);
void UART_Write_Char(char);
char UART_Read_Char();
void GetPlayerInitials(char[]);
void Write_Current_Score(unsigned long, char[]);

