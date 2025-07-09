// LCD Connections
sbit LCD_RS at RC6_bit;
sbit LCD_EN at RC7_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;

sbit LCD_RS_Direction at TRISC6_bit;
sbit LCD_EN_Direction at TRISC7_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;


unsigned int adcValue;
float voltage, emf;
char emfStr[16];
char radstr[8];
unsigned int Radcount = 0;
unsigned int radm = 0;
bit Pstate;






void main() {
    TRISB1_bit = 1;
    TRISB2_bit = 1;
    TRISB3_bit = 1;
    Pstate=0;
    ADC_Init();
    Lcd_Init();
    Lcd_Cmd(_LCD_CLEAR);

    Lcd_Out(1, 1, "EMF (uT):");
    Lcd_Out(2, 1, "RAD:");

    while(1) {

             if(PORTB.B2 == 1){
             if(!(Pstate) & PORTB.B1==1){
              Radcount++ ;
              Pstate=1;
              radm = (Radcount)*60;   // 60  is the K constant that will the RAD sensor  provide that  will convert the pulses sensored to the correct RAD value
              IntToStr(radm, radstr);
              Lcd_Out(2,10, "     ");
              Lcd_Out(2,10, radstr);
             }
             if(!PORTB.B1){
              Pstate=0;
             }
             }
             if(PORTB.B2 == 0){
             Radcount=0;
             Lcd_Out(2,10, "     ");
             }
        adcValue = ADC_Read(0);
        voltage = (adcValue * 5.0) / 1023.0;
        emf = voltage * 10.0;  // 10.0 is the K constant that will the  EMF sensor  will provide and will convert me sensored value to the correct EMF

        FloatToStr(emf, emfStr);
        Lcd_Out(1, 10, "       ");
        Lcd_Out(1, 10, emfStr);

    }
}