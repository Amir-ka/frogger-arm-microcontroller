void InitializeHardware();
void PinInitialize(); // To initialize GPIO ports
void ExternalIntConfiguration(); // Forward declaration of sub function used for EXTI configuration
void AdcConfiguration(); // Function to configure ADC on PC0
unsigned int getAdcReading(); // Begins conversion and returns 12 bit value
void Timer3Configuration(); // Forward declaration of sub function used for TIMER3 configuration
void Timer1Configuration(); // Forward declaration of sub function used for TIMER1 configuration