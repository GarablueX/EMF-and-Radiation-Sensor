
_main:

;SSSS.c,30 :: 		void main() {
;SSSS.c,31 :: 		TRISB1_bit = 1;
	BSF        TRISB1_bit+0, BitPos(TRISB1_bit+0)
;SSSS.c,32 :: 		TRISB2_bit = 1;
	BSF        TRISB2_bit+0, BitPos(TRISB2_bit+0)
;SSSS.c,33 :: 		TRISB3_bit = 1;
	BSF        TRISB3_bit+0, BitPos(TRISB3_bit+0)
;SSSS.c,34 :: 		Pstate=0;
	BCF        _Pstate+0, BitPos(_Pstate+0)
;SSSS.c,35 :: 		ADC_Init();
	CALL       _ADC_Init+0
;SSSS.c,36 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;SSSS.c,37 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;SSSS.c,39 :: 		Lcd_Out(1, 1, "EMF (uT):");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_SSSS+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;SSSS.c,40 :: 		Lcd_Out(2, 1, "RAD:");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_SSSS+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;SSSS.c,42 :: 		while(1) {
L_main0:
;SSSS.c,44 :: 		if(PORTB.B2 == 1){
	BTFSS      PORTB+0, 2
	GOTO       L_main2
;SSSS.c,45 :: 		if(!(Pstate) & PORTB.B1==1){
	BTFSC      _Pstate+0, BitPos(_Pstate+0)
	GOTO       L__main7
	BSF        116, 0
	GOTO       L__main8
L__main7:
	BCF        116, 0
L__main8:
	BTFSC      PORTB+0, 1
	GOTO       L__main9
	BCF        3, 0
	GOTO       L__main10
L__main9:
	BSF        3, 0
L__main10:
	BTFSS      116, 0
	GOTO       L__main11
	BTFSS      3, 0
	GOTO       L__main11
	BSF        116, 0
	GOTO       L__main12
L__main11:
	BCF        116, 0
L__main12:
	BTFSS      116, 0
	GOTO       L_main3
;SSSS.c,46 :: 		Radcount++ ;
	INCF       _Radcount+0, 1
	BTFSC      STATUS+0, 2
	INCF       _Radcount+1, 1
;SSSS.c,47 :: 		Pstate=1;
	BSF        _Pstate+0, BitPos(_Pstate+0)
;SSSS.c,48 :: 		radm = (Radcount)*60;   // 60  is the K constant that will the RAD sensor  provide that  will convert the pulses sensored to the correct RAD value
	MOVF       _Radcount+0, 0
	MOVWF      R0+0
	MOVF       _Radcount+1, 0
	MOVWF      R0+1
	MOVLW      60
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	MOVWF      _radm+0
	MOVF       R0+1, 0
	MOVWF      _radm+1
;SSSS.c,49 :: 		IntToStr(radm, radstr);
	MOVF       R0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _radstr+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;SSSS.c,50 :: 		Lcd_Out(2,10, "     ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_SSSS+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;SSSS.c,51 :: 		Lcd_Out(2,10, radstr);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _radstr+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;SSSS.c,52 :: 		}
L_main3:
;SSSS.c,53 :: 		if(!PORTB.B1){
	BTFSC      PORTB+0, 1
	GOTO       L_main4
;SSSS.c,54 :: 		Pstate=0;
	BCF        _Pstate+0, BitPos(_Pstate+0)
;SSSS.c,55 :: 		}
L_main4:
;SSSS.c,56 :: 		}
L_main2:
;SSSS.c,57 :: 		if(PORTB.B2 == 0){
	BTFSC      PORTB+0, 2
	GOTO       L_main5
;SSSS.c,58 :: 		Radcount=0;
	CLRF       _Radcount+0
	CLRF       _Radcount+1
;SSSS.c,59 :: 		Lcd_Out(2,10, "     ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_SSSS+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;SSSS.c,60 :: 		}
L_main5:
;SSSS.c,61 :: 		adcValue = ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _adcValue+0
	MOVF       R0+1, 0
	MOVWF      _adcValue+1
;SSSS.c,62 :: 		voltage = (adcValue * 5.0) / 1023.0;
	CALL       _word2double+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      129
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      192
	MOVWF      R4+1
	MOVLW      127
	MOVWF      R4+2
	MOVLW      136
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _voltage+0
	MOVF       R0+1, 0
	MOVWF      _voltage+1
	MOVF       R0+2, 0
	MOVWF      _voltage+2
	MOVF       R0+3, 0
	MOVWF      _voltage+3
;SSSS.c,63 :: 		emf = voltage * 10.0;  // 10.0 is the K constant that will the  EMF sensor  will provide and will convert me sensored value to the correct EMF
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      130
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _emf+0
	MOVF       R0+1, 0
	MOVWF      _emf+1
	MOVF       R0+2, 0
	MOVWF      _emf+2
	MOVF       R0+3, 0
	MOVWF      _emf+3
;SSSS.c,65 :: 		FloatToStr(emf, emfStr);
	MOVF       R0+0, 0
	MOVWF      FARG_FloatToStr_fnum+0
	MOVF       R0+1, 0
	MOVWF      FARG_FloatToStr_fnum+1
	MOVF       R0+2, 0
	MOVWF      FARG_FloatToStr_fnum+2
	MOVF       R0+3, 0
	MOVWF      FARG_FloatToStr_fnum+3
	MOVLW      _emfStr+0
	MOVWF      FARG_FloatToStr_str+0
	CALL       _FloatToStr+0
;SSSS.c,66 :: 		Lcd_Out(1, 10, "       ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_SSSS+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;SSSS.c,67 :: 		Lcd_Out(1, 10, emfStr);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _emfStr+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;SSSS.c,69 :: 		}
	GOTO       L_main0
;SSSS.c,70 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
