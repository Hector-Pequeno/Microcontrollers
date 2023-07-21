;
; Este codigo permite controlar y seleccionar opciones del menu y, segun lo seleccionado, se encenderan LEDS
; dentro de la pantalla LCD
;
; PUERTO A = AUX LCD ; PUERTO B = TECLADO ; PUERTO C = LEDS ; PUERTO D = PANTALLA LCD
;
; Variables para guardar la posicion en pantalla
CONT_RANDOM EQU 0x01	    ; Contador para determinar que valores tendra cada pareja de cartas 
CONT_CASILLAS EQU 0x34
CUAL_CARTA EQU 0x35	    ; Con esto vemos cual carta es la que se esta volteando
CARTA1 EQU 0x36 ; Guarda el valor de la carta1
CARTA2 EQU 0x37 ; Guarda el valor de la carta2
PIVOTE EQU 0x38 ; Para checar a cual carta corresponde
CARTA_VALOR EQU 0x39 ; Guarda el valor de la carta que se esta volteando
POSICION1 EQU 0x40 ; Posicion de la carta1
POSICION2 EQU 0x41 ; Posicion de la carta2
ESPACIO EQU 0X50 ; Guarda el valor en ASCII de espacio
;
; Variables donde almacenamos los valores detras de las cartas
POS_1 EQU 0x02		    ; 1 casilla - Primer fila
POS_2 EQU 0x03		    ; 2 casilla - Primer fila
POS_3 EQU 0x04		    ; 3 casilla - Primer fila
POS_4 EQU 0x05		    ; 4 casilla - Primer fila
POS_5 EQU 0x06		    ; 5 casilla - Primer fila
POS_6 EQU 0x07		    ; 6 casilla - Primer fila
POS_7 EQU 0x08		    ; 7 casilla - Primer fila
POS_8 EQU 0x09		    ; 8 casilla - Primer fila
POS_9 EQU 0x10		    ; 9 casilla - Primer fila
POS_10 EQU 0x11		    ; 10 casilla - Primer fila
POS_11 EQU 0x12		    ; 11 casilla - Primer fila
POS_12 EQU 0x13		    ; 12 casilla - Primer fila
POS_13 EQU 0x14		    ; 13 casilla - Primer fila
POS_14 EQU 0x15		    ; 14 casilla - Primer fila
POS_15 EQU 0x16		    ; 15 casilla - Primer fila
POS_16 EQU 0x17		    ; 16 casilla - Primer fila
POS_17 EQU 0x18		    ; 1 casilla - Segunda fila
POS_18 EQU 0x19		    ; 2 casilla - Segunda fila
POS_19 EQU 0x20		    ; 3 casilla - Segunda fila
POS_20 EQU 0x21		    ; 4 casilla - Segunda fila
POS_21 EQU 0x22		    ; 5 casilla - Segunda fila
POS_22 EQU 0x23		    ; 6 casilla - Segunda fila
POS_23 EQU 0x24		    ; 7 casilla - Segunda fila
POS_24 EQU 0x25		    ; 8 casilla - Segunda fila
POS_25 EQU 0x26		    ; 9 casilla - Segunda fila
POS_26 EQU 0x27		    ; 10 casilla - Segunda fila
POS_27 EQU 0x28		    ; 11 casilla - Segunda fila
POS_28 EQU 0x29		    ; 12 casilla - Segunda fila
POS_29 EQU 0x30		    ; 13 casilla - Segunda fila
POS_30 EQU 0x31		    ; 14 casilla - Segunda fila
POS_31 EQU 0x32		    ; 15 casilla - Segunda fila
POS_32 EQU 0x33		    ; 16 casilla - Segunda fila
; Variables para actualizar la pantalla ( si se encuentra una pareja, etc )
SIGUE_1 EQU 0x0A		    ; 1 casilla - Primer fila
SIGUE_2 EQU 0x0B		    ; 2 casilla - Primer fila
SIGUE_3 EQU 0x0C		    ; 3 casilla - Primer fila
SIGUE_4 EQU 0x0D		    ; 4 casilla - Primer fila
SIGUE_5 EQU 0x0E		    ; 5 casilla - Primer fila
SIGUE_6 EQU 0x0F		    ; 6 casilla - Primer fila
SIGUE_7 EQU 0x1A		    ; 7 casilla - Primer fila
SIGUE_8 EQU 0x1B		    ; 8 casilla - Primer fila
SIGUE_9 EQU 0x1C		    ; 9 casilla - Primer fila
SIGUE_10 EQU 0x1D		    ; 10 casilla - Primer fila
SIGUE_11 EQU 0x1E		    ; 11 casilla - Primer fila
SIGUE_12 EQU 0x1F		    ; 12 casilla - Primer fila
SIGUE_13 EQU 0x2A		    ; 13 casilla - Primer fila
SIGUE_14 EQU 0x2B		    ; 14 casilla - Primer fila
SIGUE_15 EQU 0x2C		    ; 15 casilla - Primer fila
SIGUE_16 EQU 0x2D		    ; 16 casilla - Primer fila
SIGUE_17 EQU 0x2E		    ; 1 casilla - Segunda fila
SIGUE_18 EQU 0x2F		    ; 2 casilla - Segunda fila
SIGUE_19 EQU 0x3A		    ; 3 casilla - Segunda fila
SIGUE_20 EQU 0x3B		    ; 4 casilla - Segunda fila
SIGUE_21 EQU 0x3C		    ; 5 casilla - Segunda fila
SIGUE_22 EQU 0x3D		    ; 6 casilla - Segunda fila
SIGUE_23 EQU 0x3E		    ; 7 casilla - Segunda fila
SIGUE_24 EQU 0x3F		    ; 8 casilla - Segunda fila
SIGUE_25 EQU 0x42		    ; 9 casilla - Segunda fila
SIGUE_26 EQU 0x43		    ; 10 casilla - Segunda fila
SIGUE_27 EQU 0x44		    ; 11 casilla - Segunda fila
SIGUE_28 EQU 0x45		    ; 12 casilla - Segunda fila
SIGUE_29 EQU 0x46		    ; 13 casilla - Segunda fila
SIGUE_30 EQU 0x47		    ; 14 casilla - Segunda fila
SIGUE_31 EQU 0x48		    ; 15 casilla - Segunda fila
SIGUE_32 EQU 0x49		    ; 16 casilla - Segunda fila
; 
TURNOS	 EQU 0x54	    ; Control de turnos, es el usado en la formula
TURNOSres EQU 0x68	    ; Ayuda a identificar cuantos turnos quedan
POSICION EQU 0x55	    ; Posicion Actual
CONTROLX EQU 0x56	    ; Control Horizontal
CONTROLY EQU 0x57	    ; Control Vertical
ALERTAint EQU 0x58	    ; Nos ayuda a verificar si se genero una INTERRUPCION   
CONT_PAREJAS EQU 0x59	    ; Ayuda a verificar si se encontraron las 16 parejas
SCORE EQU 0x51		    ; Registro de el resultado
VALOReprom1 EQU 0x52	    ; Valor de la EEPROM pos 1
VALOReprom2 EQU 0x53	    ; Valor de la EEPROM pos 2
VALOReprom3 EQU 0x63	    ; Valor de la EEPROM pos 3
DECENAS EQU 0x64	    ; Valor de Decena
CENTENA EQU 0x65
UNIDADES EQU 0x66	    ; Valor de Unidades
DIEZ EQU .10		    ; Constante para multiplicar por 10
flagABORT EQU 0x67	    ; Bandera de Abort, para verificar si fue abort o final de juego
 ;   
    #include "p18f45k50.inc"
    processor 18f45k50;
    ORG 0x00		; Posicion Reset
    GOTO configuracion	; Rutina de configuracion
    ORG 0x08		; Interrupcion
    GOTO interrupcion	; Rutina de interrupcion
;
interrupcion:
    BSF ALERTAint,0,A	;Activamos nuestro registro de control de apoyo en interrupciones
    CALL ABORTint	;REALIZAMOS EL DETENIMIENTO DEL JUEGO
    CALL mNOTIME	;Rutina de falta de tiempo
    BCF INTCON,TMR0IF,A ;APAGAMOS BANDERA DE INTERRUPCION
    CLRF T0CON,A	;APAGAMOS REGISTRO CONTROL TMR0
    RETFIE
;
configuracion:	; Configuramos Puertos del Microcontrolador
;
    ; Configuramos pantalla LCD
    #DEFINE RS LATA, 1, A	    ; RS DEFINIDO EN PUERTO A, BIT 1
    #DEFINE E LATA, 2, A	    ; E DEFINIDO EN PUERTO A, BIT 2
    #DEFINE RW LATA, 3, A 	    ; RW DEFINIDO EN PUERTO A, BIT 3
    #DEFINE dataLCD LATD, A  ; dataLCD DEFINIDO EN TODO EL PUERTO D   
;
    MOVLB .15		; Movemos 15 al BSR
    CLRF ANSELA, BANKED	; Ponemos en digital el puerto A
    CLRF TRISA, A	; Ponemos en modo salida el puerto A
;
    CLRF ANSELD, BANKED	; Ponemos en digital el puerto D
    CLRF TRISD, A	; Ponemos en modo salida el puerto D
    CLRF LATD ; Limpiamos el valor en puerto D
;
    CLRF ANSELC, BANKED  ; Ponemos en digital las salidas de los LEDS
    CLRF TRISC, A	 ; Ponemos en modo salida los LEDS
;
    ; Configuramos el teclado matricial
    CLRF ANSELB, BANKED	    ; Ponemos en digital el puerto B
    BCF INTCON2, 7, A	    ; Habilitamos pull ups globales
    MOVLW b'00001111'	    ; Definicmos 50/50 I/O
    MOVWF TRISB, A	    ; Definimos I/O
    MOVWF WPUB, A	    ; Activamos respectivamente las pullups
    SETF LATB, A	    ; Ponemos en 1 debido al nuevo orden Logico
;
; Configuramos adicional del teclado matricial
C1 EQU b'11101111'	    ; Literal para escanear columna 1
C2 EQU b'11011111'	    ; Literal para escanear columna 2
C3 EQU b'10111111'	    ; Literal para escanear columna 3
			    ; No analizamos C4, ya que no la utilizaremos...       
;
; Configuracion de INTERRUPCIONES ( TMR0 activa interrupciones )
    BSF INTCON, 7, A	;ACTIVAMOS INTERRUPCIONES GLOBALES
    BCF INTCON, 2, A	;APAGAMOS BANDERA DE DESBORDAMIENTO TMR0
    BSF INTCON, 5, A	;ACTIVAMOS INTERRUPCIONES EN TMR0
;
;

;    
; Configuramos los valores iniciales de la EEPROM    
    ;Iniciamos las primeras 3 posiciones de la memoria en 0
    ;CONFIGURAMOS PRIMER SLOT DE MEMORIA
    movlw .0		;Direccion en la que escribiremos
    movwf EEADR,A	;Movemos la direccion a nuestro registro
    movff WREG,EEDATA	;Movemos nuestro WREG = 0 al registro de datos lecura/escritura
    call EscrituraEEPROM;Escribimos en la EEPROM
    
    ;CONFIGURAMOS SEGUNDO SLOT DE MEMORIA
    movlw .1		;Direccion en la que escribiremos
    movwf EEADR,A	;Movemos la direccion a nuestro registro
    movlw .0		;Mandamos valor a nuestro espacio de memoria
    movff WREG,EEDATA	;Movemos nuestro WREG = 0 al registro de datos lecura/escritura
    call EscrituraEEPROM;Escribimos en la EEPROM
    
    ;CONFIGURAMOS TERCER SLOT DE MEMORIA

    movlw .2		;Direccion en la que escribiremos
    movwf EEADR,A	;Movemos la direccion a nuestro registro
    movlw .0		;Mandamos valor a nuestro espacio de memoria
    movff WREG,EEDATA	;Movemos nuestro WREG = 0 al registro de datos lecura/escritura
    call EscrituraEEPROM;Escribimos en la EEPROM
;
;
    
;    
; Iniciamos variables 
    MOVLW .41
    MOVWF TURNOSres, A	    ;Contador de turnos que sera decrementado
    MOVLW .0
    MOVWF TURNOS, A	    ;Iniciamos control de turnos en 0
    MOVLW .1
    MOVWF CONTROLX, A	    ;Iniciamos nuestro control X en 1
    MOVWF CONTROLY, A	    ;Iniciamos nuestro control Y en 1
    MOVLW .0
    MOVWF ALERTAint, A	    ;Iniciamos nuestra variable de control de interrupcion en 0
    CLRF POSICION ; POSICION = 0
    CLRF CONT_PAREJAS,A    ;Asignamos 0 a las parejas encontradas 
    MOVLW 0X01
    MOVWF CONT_RANDOM ; CONTADOR DE RANDOM = 1. se rotara para el template a usar
    CLRF CONT_CASILLAS
    CLRF CUAL_CARTA
    CLRF CARTA1
    CLRF CARTA2
    CLRF PIVOTE 
    CLRF CARTA_VALOR
    CLRF POSICION1
    CLRF POSICION2
    MOVLW 0X20
    MOVWF ESPACIO ; Valor de espacio en ASCII
    movlw .0	;Iniciamos en 0 las variables de cambio de Formato BIN to ASCCI
    movwf DECENAS,A
    movwf CENTENA,A
    movwf SCORE,A	    ;forzamos SCORE = 0
    movwf UNIDADES,A

;
; esperaLCD = TMR2 con interrupcion ; 
;
;	    ------------- INICIALIZACION DE LA PANTALLA ---------------
INICIO:
    CALL esperaLCD	    ; Esperamos a que la LCD termine de encenderse
    MOVLW b'00000110'	    ; Increment cursor position, No display shift 
    CALL configLCD	    
    MOVLW b'00111000'	    ; Bit interface = 4, 2 lineas, Resolucion 5x8
    CALL configLCD	    
    MOVLW b'00001111'	    ; Display ON, Cursor ON y Blink ON
    CALL configLCD
    MOVLW b'00000001'	    ; Limpiamos LCD y Movemos cursor al inicio
    CALL configLCD    
;	    -------------- Creamos nuestros caracteres personalizados--
    call creacionCHAR	    ;Creamos nuestros caracteres
;
    ;Reinicio de Variables
    MOVLW .41
    MOVWF TURNOSres, A	    ;Contador de turnos que sera decrementado
    MOVLW .0
    MOVWF TURNOS, A	    ;Iniciamos control de turnos en 0
    MOVLW .1
    MOVWF CONTROLX, A	    ;Iniciamos nuestro control X en 1
    MOVWF CONTROLY, A	    ;Iniciamos nuestro control Y en 1
    MOVLW .0
    MOVWF ALERTAint, A	    ;Iniciamos nuestra variable de control de interrupcion en 0
    CLRF POSICION ; POSICION = 0
    CLRF CONT_PAREJAS,A    ;Asignamos 0 a las parejas encontradas 
    CLRF CONT_CASILLAS
    CLRF CUAL_CARTA
    CLRF CARTA1
    CLRF CARTA2
    CLRF PIVOTE 
    CLRF CARTA_VALOR
    CLRF POSICION1
    CLRF POSICION2
    MOVLW 0X20
    MOVWF ESPACIO ; Valor de espacio en ASCII
    movlw .0	;Iniciamos en 0 las variables de cambio de Formato BIN to ASCCI
    movwf DECENAS,A
    movwf SCORE,A	    ;forzamos SCORE = 0
    movwf UNIDADES,A
    
    GOTO MAIN_MENU	    
;
;	    --------- HABILITAMOS SELECCION EN PANTALLA MENU ----------
SCAN_MENU:
    CALL SCANc1MENU		    ; Verificamos columna 1
    CALL SCANc2MENU		    ; Verificamos columna 2
    GOTO SCAN_MENU		    
;
SCANc1MENU:
    MOVLW C1		    ; Movemos C1 al WREG
    MOVWF LATB, A	    ; Movemos al puerto B
    BTFSS PORTB, 0, A	    ; Verificamos si se selecciona el 1
    GOTO PLAY		    ; Tecla 1 = JUGAR
    RETURN
;
SCANc2MENU:
    MOVLW C2		    ; Movemos C2 al WREG
    MOVWF LATB, A	    ; Movemos al puerto B
    BTFSS PORTB, 0, A	    ; Verificamos si se presiona el 2
    GOTO MARCADORES	    ; Tecla 2 = PUNTAJES
    RETURN
;
;
;	    ----------- PANTALLA DE JUEGO - COMIENZA A JUGAR ------------
PLAY:
    BTFSS PORTB, 0, A	    ; Verificamos que se suelte el boton
    GOTO PLAY		    ; Si sigue pulsado, esperamos a que se suelte
    CALL PARPADEOgreen	    ; Encendemos LEDS VERDES
    GOTO PantallaPlay	    ; Desplegamos la pantalla del juego
;    
PantallaPlay: ; Informacion de la pantalla de juego
;
    ;Rotamos bit de control
    RLNCF CONT_RANDOM, 1 ; MOVEMOS EL BIT DE SELECCION DE RANDOM
    ;Primer pantalla
    BTFSC CONT_RANDOM, 0 ; Si vale 1, se asignan los valores a las variables de cada casilla con el caso #1
    CALL RANDOM1 ;   
    ;Segunda pantalla
    BTFSC CONT_RANDOM, 1 ; Si vale 1, se asignan los valores a las variables de cada casilla con el caso #1
    CALL RANDOM2 ;   
    ;Tercera pantalla
    BTFSC CONT_RANDOM, 2 ; Si vale 1, se asignan los valores a las variables de cada casilla con el caso #1
    CALL RANDOM3 ;   
    ;Cuarta pantalla
    BTFSC CONT_RANDOM, 3 ; Si vale 1, se asignan los valores a las variables de cada casilla con el caso #1
    CALL RANDOM4 ;   
    ;Quinta pantalla
    BTFSC CONT_RANDOM, 4 ; Si vale 1, se asignan los valores a las variables de cada casilla con el caso #1
    CALL RANDOM5 ;
    ;Sexta pantalla
    BTFSC CONT_RANDOM, 5 ; Si vale 1, se asignan los valores a las variables de cada casilla con el caso #1
    CALL RANDOM6 ;
    ;Septima pantalla
    BTFSC CONT_RANDOM, 6 ; Si vale 1, se asignan los valores a las variables de cada casilla con el caso #1
    CALL RANDOM7 ;
    ;Octava pantalla
    BTFSC CONT_RANDOM, 7 ; Si vale 1, se asignan los valores a las variables de cada casilla con el caso #1
    CALL RANDOM8 ;   
   
    MOVLW b'00000001'	    ; Limpiamos LCD y movemos cursor al inicio
    CALL configLCD	    
    MOVLW 'R'		    
    CALL writeLCD	    
    MOVLW 'E'		    
    CALL writeLCD	    
    MOVLW 'A'		    
    CALL writeLCD	    
    MOVLW 'D'		    
    CALL writeLCD
    MOVLW 'Y'		    
    CALL writeLCD
    MOVLW '?'		    
    CALL writeLCD ; " READY? "
    MOVLW b'00100000'	    
    CALL writeLCD ; espacio
    MOVLW 'G'		    
    CALL writeLCD	    
    MOVLW 'O'		    
    CALL writeLCD	    
    MOVLW '!'		   
    CALL writeLCD ; " GO! "
    CALL delayLEDS ;
    CALL delayLEDS ;
    CALL delayLEDS ;
    ; Mensaje : " READY? GO! "
    NOP
    MOVLW b'00000001'	    ; Limpiamos LCD y movemos cursor al inicio
    CALL configLCD
;
; Ponemos el simbolo personalizado en cada carta boca-abajo
    CALL cartas_BOCAABAJO ;
    CALL ACTUALIZAR_PANTALLA ;
    CALL delayLEDS ;
    CLRF CONT_CASILLAS ; REINICIAMOS SU VALOR
;        
    MOVLW 0X80
    CALL configLCD ;
    MOVLW .0		    ; Movemos la posicion inicial a nustra variable posicion
    CALL guardar_POS	    ; Posicion = Posicion actual (inicial)
;
    CALL delayTurnos	    ; Iniciamos el delay de los turnos ( TMR0 -> 7 s ) <- Ya esta programado como interrupcion
    GOTO PLAYhabilitado	    ; Activamos los controles de la pantalla de juego 
;    
; Guardamos la posicion actual del pointer en una variable    
guardar_POS:
    MOVWF POSICION	    ; Variable de la posicion actualizada
    ;MOVLW b'10000000'	    ; Constante de posicion
    ;ADDWF POSICION, F, A    ; Sumamos la posicion a la constante
    RETURN
;
;
RANDOM1:
    MOVLW 0X32 ; 2 EN ASCII
    MOVWF POS_1 ;
    MOVWF POS_17 ;
    MOVLW 0X33 ; 3 EN ASCII
    MOVWF POS_2 ;
    MOVWF POS_18 ;
    MOVLW 0X34 ; 4 EN ASCII
    MOVWF POS_3 ;
    MOVWF POS_19 ;
    MOVLW 0X35 ; 5 EN ASCII
    MOVWF POS_4 ;
    MOVWF POS_20 ;
    MOVLW 0X36 ; 6 EN ASCII
    MOVWF POS_5 ;
    MOVWF POS_21 ;
    MOVLW 0X37 ; 7 EN ASCII
    MOVWF POS_6 ;
    MOVWF POS_22 ;
    MOVLW 0X38 ; 8 EN ASCII
    MOVWF POS_7 ;
    MOVWF POS_23 ;
    MOVLW 0X39 ; 9 EN ASCII
    MOVWF POS_8 ;
    MOVWF POS_24 ;
    MOVLW 0X41 ; A EN ASCII
    MOVWF POS_9 ;
    MOVWF POS_25 ;
    MOVLW 0X54 ; T EN ASCII
    MOVWF POS_10 ;
    MOVWF POS_26 ;
    MOVLW 0X4A ; J EN ASCII
    MOVWF POS_11 ;
    MOVWF POS_27 ;
    MOVLW 0X51 ; Q EN ASCII
    MOVWF POS_12 ;
    MOVWF POS_28 ;
    MOVLW 0X48 ; H EN ASCII
    MOVWF POS_13 ;
    MOVWF POS_29 ;
;    
    MOVLW 0X00 ; CARACTER PER. 1
    MOVWF POS_14 ;
    MOVWF POS_30 ;
    MOVLW 0X01 ; CARACTER PER. 2
    MOVWF POS_15 ;
    MOVWF POS_31 ;
    MOVLW 0X02 ; CARACTER PER. 3
    MOVWF POS_16 ;
    MOVWF POS_32 ;
;
    
    RETURN
;
;
RANDOM2:

    MOVLW 0X32 ; 2 EN ASCII
    MOVWF POS_2 ;
    MOVWF POS_8 ;
    MOVLW 0X33 ; 3 EN ASCII
    MOVWF POS_1 ;
    MOVWF POS_4 ;
    MOVLW 0X34 ; 4 EN ASCII
    MOVWF POS_3 ;
    MOVWF POS_7 ;
    MOVLW 0X35 ; 5 EN ASCII
    MOVWF POS_5 ;
    MOVWF POS_6 ;
    MOVLW 0X36 ; 6 EN ASCII
    MOVWF POS_9 ;
    MOVWF POS_20 ;
    MOVLW 0X37 ; 7 EN ASCII
    MOVWF POS_10 ;
    MOVWF POS_25 ;
    MOVLW 0X38 ; 8 EN ASCII
    MOVWF POS_11 ;
    MOVWF POS_21 ;
    MOVLW 0X39 ; 9 EN ASCII
    MOVWF POS_12 ;
    MOVWF POS_30 ;
    MOVLW 0X41 ; A EN ASCII
    MOVWF POS_13 ;
    MOVWF POS_31 ;
    MOVLW 0X54 ; T EN ASCII
    MOVWF POS_14 ;
    MOVWF POS_32 ;
    MOVLW 0X4A ; J EN ASCII
    MOVWF POS_15 ;
    MOVWF POS_22 ;
    MOVLW 0X51 ; Q EN ASCII
    MOVWF POS_16 ;
    MOVWF POS_23 ;
    MOVLW 0X48 ; H EN ASCII
    MOVWF POS_17 ;
    MOVWF POS_24 ;
;    
    MOVLW 0X00 ; CARACTER PER. 1
    MOVWF POS_18 ;
    MOVWF POS_26 ;
    MOVLW 0X01 ; CARACTER PER. 2
    MOVWF POS_19 ;
    MOVWF POS_27 ;
    MOVLW 0X02 ; CARACTER PER. 3
    MOVWF POS_28 ;
    MOVWF POS_29 ;
;
    RETURN
    
RANDOM3:

    MOVLW 0X32 ; 2 EN ASCII
    MOVWF POS_1 ;
    MOVWF POS_2 ;
    MOVLW 0X33 ; 3 EN ASCII
    MOVWF POS_3 ;
    MOVWF POS_4 ;
    MOVLW 0X34 ; 4 EN ASCII
    MOVWF POS_5 ;
    MOVWF POS_6 ;
    MOVLW 0X35 ; 5 EN ASCII
    MOVWF POS_7 ;
    MOVWF POS_8 ;
    MOVLW 0X36 ; 6 EN ASCII
    MOVWF POS_9 ;
    MOVWF POS_10 ;
    MOVLW 0X37 ; 7 EN ASCII
    MOVWF POS_11 ;
    MOVWF POS_12 ;
    MOVLW 0X38 ; 8 EN ASCII
    MOVWF POS_13 ;
    MOVWF POS_14 ;
    MOVLW 0X39 ; 9 EN ASCII
    MOVWF POS_15 ;
    MOVWF POS_16 ;
    MOVLW 0X41 ; A EN ASCII
    MOVWF POS_17 ;
    MOVWF POS_18 ;
    MOVLW 0X54 ; T EN ASCII
    MOVWF POS_19 ;
    MOVWF POS_20 ;
    MOVLW 0X4A ; J EN ASCII
    MOVWF POS_21 ;
    MOVWF POS_22 ;
    MOVLW 0X51 ; Q EN ASCII
    MOVWF POS_23 ;
    MOVWF POS_24 ;
    MOVLW 0X48 ; H EN ASCII
    MOVWF POS_25 ;
    MOVWF POS_26 ;
;    
    MOVLW 0X00 ; CARACTER PER. 1
    MOVWF POS_27 ;
    MOVWF POS_28 ;
    MOVLW 0X01 ; CARACTER PER. 2
    MOVWF POS_29 ;
    MOVWF POS_30 ;
    MOVLW 0X02 ; CARACTER PER. 3
    MOVWF POS_31 ;
    MOVWF POS_32 ;
;
    RETURN
;
    
RANDOM4:

    MOVLW 0X32 ; 2 EN ASCII
    MOVWF POS_1 ;
    MOVWF POS_3 ;
    MOVLW 0X33 ; 3 EN ASCII
    MOVWF POS_2 ;
    MOVWF POS_4 ;
    MOVLW 0X34 ; 4 EN ASCII
    MOVWF POS_32 ;
    MOVWF POS_5 ;
    MOVLW 0X35 ; 5 EN ASCII
    MOVWF POS_9 ;
    MOVWF POS_6 ;
    MOVLW 0X36 ; 6 EN ASCII
    MOVWF POS_7 ;
    MOVWF POS_10 ;
    MOVLW 0X37 ; 7 EN ASCII
    MOVWF POS_11 ;
    MOVWF POS_8 ;
    MOVLW 0X38 ; 8 EN ASCII
    MOVWF POS_12 ;
    MOVWF POS_15 ;
    MOVLW 0X39 ; 9 EN ASCII
    MOVWF POS_13 ;
    MOVWF POS_16 ;
    MOVLW 0X41 ; A EN ASCII
    MOVWF POS_14 ;
    MOVWF POS_17 ;
    MOVLW 0X54 ; T EN ASCII
    MOVWF POS_18 ;
    MOVWF POS_22 ;
    MOVLW 0X4A ; J EN ASCII
    MOVWF POS_19 ;
    MOVWF POS_23 ;
    MOVLW 0X51 ; Q EN ASCII
    MOVWF POS_20 ;
    MOVWF POS_24 ;
    MOVLW 0X48 ; H EN ASCII
    MOVWF POS_21 ;
    MOVWF POS_25 ;
;    
    MOVLW 0X00 ; CARACTER PER. 1
    MOVWF POS_26 ;
    MOVWF POS_29 ;
    MOVLW 0X01 ; CARACTER PER. 2
    MOVWF POS_30 ;
    MOVWF POS_27 ;
    MOVLW 0X02 ; CARACTER PER. 3
    MOVWF POS_28 ;
    MOVWF POS_31 ;
;
    RETURN
;
    
;
    
RANDOM5:

    MOVLW 0X32 ; 2 EN ASCII
    MOVWF POS_32 ;
    MOVWF POS_31 ;
    MOVLW 0X33 ; 3 EN ASCII
    MOVWF POS_30 ;
    MOVWF POS_29 ;
    MOVLW 0X34 ; 4 EN ASCII
    MOVWF POS_28 ;
    MOVWF POS_27 ;
    MOVLW 0X35 ; 5 EN ASCII
    MOVWF POS_26 ;
    MOVWF POS_25 ;
    MOVLW 0X36 ; 6 EN ASCII
    MOVWF POS_24 ;
    MOVWF POS_23 ;
    MOVLW 0X37 ; 7 EN ASCII
    MOVWF POS_22 ;
    MOVWF POS_21 ;
    MOVLW 0X38 ; 8 EN ASCII
    MOVWF POS_20 ;
    MOVWF POS_19 ;
    MOVLW 0X39 ; 9 EN ASCII
    MOVWF POS_18 ;
    MOVWF POS_17 ;
    MOVLW 0X41 ; A EN ASCII
    MOVWF POS_16 ;
    MOVWF POS_15 ;
    MOVLW 0X54 ; T EN ASCII
    MOVWF POS_14 ;
    MOVWF POS_13 ;
    MOVLW 0X4A ; J EN ASCII
    MOVWF POS_12 ;
    MOVWF POS_11 ;
    MOVLW 0X51 ; Q EN ASCII
    MOVWF POS_10 ;
    MOVWF POS_9 ;
    MOVLW 0X48 ; H EN ASCII
    MOVWF POS_8 ;
    MOVWF POS_7 ;
;    
    MOVLW 0X00 ; CARACTER PER. 1
    MOVWF POS_7 ;
    MOVWF POS_5 ;
    MOVLW 0X01 ; CARACTER PER. 2
    MOVWF POS_4 ;
    MOVWF POS_3 ;
    MOVLW 0X02 ; CARACTER PER. 3
    MOVWF POS_2 ;
    MOVWF POS_1 ;
;
    RETURN    
;
;
RANDOM6:

    MOVLW 0X32 ; 2 EN ASCII
    MOVWF POS_2 ;
    MOVWF POS_4 ;
    MOVLW 0X33 ; 3 EN ASCII
    MOVWF POS_6 ;
    MOVWF POS_8 ;
    MOVLW 0X34 ; 4 EN ASCII
    MOVWF POS_10 ;
    MOVWF POS_12 ;
    MOVLW 0X35 ; 5 EN ASCII
    MOVWF POS_14 ;
    MOVWF POS_16 ;
    MOVLW 0X36 ; 6 EN ASCII
    MOVWF POS_18 ;
    MOVWF POS_20 ;
    MOVLW 0X37 ; 7 EN ASCII
    MOVWF POS_22 ;
    MOVWF POS_24 ;
    MOVLW 0X38 ; 8 EN ASCII
    MOVWF POS_26 ;
    MOVWF POS_28 ;
    MOVLW 0X39 ; 9 EN ASCII
    MOVWF POS_30 ;
    MOVWF POS_32 ;
    MOVLW 0X41 ; A EN ASCII
    MOVWF POS_1 ;
    MOVWF POS_3 ;
    MOVLW 0X54 ; T EN ASCII
    MOVWF POS_5 ;
    MOVWF POS_7 ;
    MOVLW 0X4A ; J EN ASCII
    MOVWF POS_9 ;
    MOVWF POS_11 ;
    MOVLW 0X51 ; Q EN ASCII
    MOVWF POS_13 ;
    MOVWF POS_15 ;
    MOVLW 0X48 ; H EN ASCII
    MOVWF POS_17 ;
    MOVWF POS_19 ;
;    
    MOVLW 0X00 ; CARACTER PER. 1
    MOVWF POS_21 ;
    MOVWF POS_23 ;
    MOVLW 0X01 ; CARACTER PER. 2
    MOVWF POS_25 ;
    MOVWF POS_27 ;
    MOVLW 0X02 ; CARACTER PER. 3
    MOVWF POS_29 ;
    MOVWF POS_31 ;
;
    RETURN
    
;
;
RANDOM7:

    MOVLW 0X32 ; 2 EN ASCII
    MOVWF POS_5 ;
    MOVWF POS_10 ;
    MOVLW 0X33 ; 3 EN ASCII
    MOVWF POS_15 ;
    MOVWF POS_20 ;
    MOVLW 0X34 ; 4 EN ASCII
    MOVWF POS_25 ;
    MOVWF POS_30 ;
    MOVLW 0X35 ; 5 EN ASCII
    MOVWF POS_1 ;
    MOVWF POS_2 ;
    MOVLW 0X36 ; 6 EN ASCII
    MOVWF POS_3 ;
    MOVWF POS_4 ;
    MOVLW 0X37 ; 7 EN ASCII
    MOVWF POS_6 ;
    MOVWF POS_7 ;
    MOVLW 0X38 ; 8 EN ASCII
    MOVWF POS_8 ;
    MOVWF POS_9 ;
    MOVLW 0X39 ; 9 EN ASCII
    MOVWF POS_11 ;
    MOVWF POS_12 ;
    MOVLW 0X41 ; A EN ASCII
    MOVWF POS_13 ;
    MOVWF POS_14 ;
    MOVLW 0X54 ; T EN ASCII
    MOVWF POS_16 ;
    MOVWF POS_17 ;
    MOVLW 0X4A ; J EN ASCII
    MOVWF POS_18 ;
    MOVWF POS_19 ;
    MOVLW 0X51 ; Q EN ASCII
    MOVWF POS_21 ;
    MOVWF POS_22 ;
    MOVLW 0X48 ; H EN ASCII
    MOVWF POS_23 ;
    MOVWF POS_24 ;
;    
    MOVLW 0X00 ; CARACTER PER. 1
    MOVWF POS_26 ;
    MOVWF POS_27 ;
    MOVLW 0X01 ; CARACTER PER. 2
    MOVWF POS_28 ;
    MOVWF POS_29 ;
    MOVLW 0X02 ; CARACTER PER. 3
    MOVWF POS_31 ;
    MOVWF POS_32 ;
;
    RETURN
;   
;    
 
RANDOM8:

    MOVLW 0X32 ; 2 EN ASCII
    MOVWF POS_15 ;
    MOVWF POS_14 ;
    MOVLW 0X33 ; 3 EN ASCII
    MOVWF POS_13 ;
    MOVWF POS_12 ;
    MOVLW 0X34 ; 4 EN ASCII
    MOVWF POS_11 ;
    MOVWF POS_10 ;
    MOVLW 0X35 ; 5 EN ASCII
    MOVWF POS_9 ;
    MOVWF POS_8 ;
    MOVLW 0X36 ; 6 EN ASCII
    MOVWF POS_7 ;
    MOVWF POS_6 ;
    MOVLW 0X37 ; 7 EN ASCII
    MOVWF POS_5 ;
    MOVWF POS_4 ;
    MOVLW 0X38 ; 8 EN ASCII
    MOVWF POS_3 ;
    MOVWF POS_2 ;
    MOVLW 0X39 ; 9 EN ASCII
    MOVWF POS_1 ;
    MOVWF POS_32 ;
    MOVLW 0X41 ; A EN ASCII
    MOVWF POS_31 ;
    MOVWF POS_23 ;
    MOVLW 0X54 ; T EN ASCII
    MOVWF POS_30 ;
    MOVWF POS_22 ;
    MOVLW 0X4A ; J EN ASCII
    MOVWF POS_29 ;
    MOVWF POS_21 ;
    MOVLW 0X51 ; Q EN ASCII
    MOVWF POS_28 ;
    MOVWF POS_20 ;
    MOVLW 0X48 ; H EN ASCII
    MOVWF POS_27 ;
    MOVWF POS_19 ;
;    
    MOVLW 0X00 ; CARACTER PER. 1
    MOVWF POS_26 ;
    MOVWF POS_10 ;
    MOVLW 0X01 ; CARACTER PER. 2
    MOVWF POS_28 ;
    MOVWF POS_17 ;
    MOVLW 0X02 ; CARACTER PER. 3
    MOVWF POS_24 ;
    MOVWF POS_16 ;
;
    RETURN
    
;
;    
cartas_BOCAABAJO:
    MOVLW 0x03 ; Posicion del simbolo personalizado oculto
    MOVWF SIGUE_1 
    MOVWF SIGUE_2
    MOVWF SIGUE_3
    MOVWF SIGUE_4
    MOVLW 0x03 ; Posicion del simbolo personalizado oculto
    MOVWF SIGUE_5 
    MOVWF SIGUE_6
    MOVWF SIGUE_7
    MOVWF SIGUE_8
    MOVLW 0x03 ; Posicion del simbolo personalizado oculto
    MOVWF SIGUE_9 
    MOVWF SIGUE_10
    MOVWF SIGUE_11
    MOVWF SIGUE_12
    MOVLW 0x03 ; Posicion del simbolo personalizado oculto
    MOVWF SIGUE_13 
    MOVWF SIGUE_14
    MOVWF SIGUE_15
    MOVWF SIGUE_16
;
    MOVLW 0x03 ; Posicion del simbolo personalizado oculto
    MOVWF SIGUE_17 
    MOVWF SIGUE_18
    MOVWF SIGUE_19
    MOVWF SIGUE_20
    MOVLW 0x03 ; Posicion del simbolo personalizado oculto
    MOVWF SIGUE_21 
    MOVWF SIGUE_22
    MOVWF SIGUE_23
    MOVWF SIGUE_24
    MOVLW 0x03 ; Posicion del simbolo personalizado oculto
    MOVWF SIGUE_25 
    MOVWF SIGUE_26
    MOVWF SIGUE_27
    MOVWF SIGUE_28
    MOVLW 0x03 ; Posicion del simbolo personalizado oculto
    MOVWF SIGUE_29 
    MOVWF SIGUE_30
    MOVWF SIGUE_31
    MOVWF SIGUE_32
    RETURN
;
;
PLAYhabilitado:     ; HABILITAMOS LOS CONTROLES DE MODO JUEGO
;   
    CALL scanc1		    ;Buscamos pulsaciones Columna 1
    CALL scanc2		    ;Buscamos pulsaciones Columna 2
    CALL scanc3		    ;Buscamos pulsaciones Columna 3
    BTFSC ALERTAint,0,A	    ;VERIFICAMOS SI SE VIENE DE UNA INTERRUPCION
    GOTO ABORTaux	    ;Nos dirigimos a la rutina de AbortAuxiliar
    
    goto PLAYhabilitado	    ;Loop de lecturas  

PANTactualizada:	    ;PANTALLA PARA SIMULACION TODO ESTO YA NOOOOOOOO!!!!!!
    movlw b'00000001'	    ;Limpiamos LCD y movemos cursor al inicio
    call configLCD	    ;Configuramos
    movlw 'P'		    ;LETRA P
    call writeLCD	    ;ESCRIBIMOS
    movlw 'A'		    ;LETRA A
    call writeLCD	    ;ESCRIBIMOS
    movlw 'N'		    ;LETRA N
    call writeLCD	    ;ESCRIBIMOS
    movlw 'T'		    ;LETRA T
    call writeLCD	    ;ESCRIBIMOS
    movlw b'00100000'	    ;ESPACIO
    call writeLCD	    ;ESCRIBIMOS
    movlw 'J'		    ;LETRA J
    call writeLCD	    ;ESCRIBIMOS
    movlw 'U'		    
    call writeLCD	    
    movlw 'E'		   
    call writeLCD	    
    movlw 'G'		    
    call writeLCD	    
    movlw 'O'		    
    call writeLCD	
    return		    ;Regresamos HASTA AQUI YA NOOOO!!!!!!!
;
;    
;	    ------- SCAN DE LOS CONTROLES DE JUEGO Y MARCADOR --------
scanc1:
    MOVLW C1		    ; Movemos c1 a wreg
    MOVWF LATB, A	    ; Movemos el valor de la senal a los pines
    BTFSS PORTB, 1, A	    ; Verificamos si se presiona el 4
    CALL IZQUIERDA	    ; Nos movemos a la izquierda
    ; Solo verificamos el 4, ya que sera el encargado de desplazarnos a la izquierda
    RETURN
;
scanc2:
    MOVLW C2;
    MOVWF LATB, A
    BTFSS PORTB, 0, A	    ; Verificamos si se presiona el 2
    CALL ARRIBA		    ; Nos deplegamos hacia arriba
;
    BTFSS PORTB, 1, A	    ; El cinco estara encargado de la seleccion
    CALL ENTER	    	    ; Seleccionamos opcion
    BTFSS PORTB, 2, A	    ; El 8 Nos permitira movernos hacia abajo
    CALL ABAJO		    ; Nos movemos hacia abajo
    RETURN 
    
scanc3:
    MOVLW C3
    MOVWF LATB, A
    BTFSS PORTB, 1, A	    ;Verificamos si se presiona el 6
    CALL DERECHA	    ;Nos desplegamos a la derecha
    BTFSS PORTB, 3, A	    ;Verificamos si se presiona #@
    GOTO ABORT		    ;Abortamos / Terminamos juego
    RETURN
;
;
;	    -------- ACCIONES QUE SE REALIZAN AL SELECCIONAR TECLA ---------
IZQUIERDA:
    ;Nos movemos a la izquierda en la DDRAM
    ;Esperamos a que se suelte para avanzar
    btfss PORTB,1,A	    ;Verificamos que se suelte
	goto IZQUIERDA	    ;Si sigue pulsado, esperamos a que se suelte
    ;Verificamos si existe overflow en posicion
    
    DECFSZ CONTROLX,W,A	    ;DECREMENTA VARIABLE DE CONTROL, SI ES 0 SALTA
	goto IZQUIERDAejec  ;Al no haber overflow, realizamos movimiento
    ;SE GENERO OVERFLOW DE POSICION EN LA PANTALLA (CURSOR NO PUEDE IRSE MAS A LA IZQUIERDA)
    ;SOLO REGRESAMOS
    return    ;Regresamos a los controles 
    
IZQUIERDAejec:		    ;Ejecutamos Movimiento a la ziquierda
    DECF POSICION,F,A	    ;Decrementamos la posicion
    movf POSICION,W,A	    ;MOVEMOS A WREG
    decf CONTROLX,F,A	    ;Decrementamos la posicion de control
    ADDLW B'10000000'	    ;Movemos constante de instruccion
    call configLCD	    ;Nos dirigimos a la posicion
    return	    ;Regresamos a los controles 
    
DERECHA:
    ;Nos movemos a la derecha en la DDRAM
    btfss PORTB,1,A	    ;Verificamos que se suelte
	goto DERECHA	    ;Si sigue pulsado, esperamos a que se suelte
    ;Verificamos si existe overflow
    INCF POSICION,W,A	    ;AUMENTAMOS EL VALOR DE POSICION y guardamos en WREG
    btfss WREG,4,A	    ;Verificamos si se paso al 16 en binario, lo cual seria overflow a la derecha
	goto DERECHAejec    ;No existe overeflow, ejecutamos movimiento
    ;Debido a que existe overflow no hacemos nada
    return		    ;Regresamos a los controles
    
DERECHAejec:   
    incf POSICION,F,A	    ;Incrementamos posicion en LCD (Registro)
    incf CONTROLX,F,A	    ;Incrementamos posicion en variable de control
    movf POSICION,W,A	    ;Movemos la posicion al WREG
    addlw b'10000000'	    ;Literal para llenar la instruccion
    call configLCD	    ;Nos dirigimos a la posicion
    return
    
ARRIBA:
    btfss PORTB,0,A	    ;Verificamos que se suelte
	goto ARRIBA	    ;Si sigue pulsado, esperamos a que se suelte
    ;Avanzamos
    decfsz CONTROLY,W,A    ;Decrementa registro y salta si es = 0
	GOTO ARRIBAejec
    ;EXISTE OVERFLOW, POR LO QUE NO HACEMOS NADA
    return
    
ARRIBAejec:
    decf CONTROLY,F,A	    ;DECREMENTAMOS VARIABLE DE CONTROL
    ;Proceso para desplegarnos hacia arriba
    
    movlw 0x40		    ;Movemos un 40 hexadecimal al wreg
    SUBWF POSICION,F,A	    ;Restamos 0x40 y guardamos en posicion
    comf POSICION,A	    ;Obtenemos complemento a 2 y guardamos en posicion
    incf POSICION, A	    ;Sumamos 1 para sacar complemento a 2
    movf POSICION,W,A	    ;Movemos el registro al WREG
    addlw b'10000000'	    ;Literal para llenar la instruccion
    CALL configLCD	    ;Nos movemos a configurar la posicion
    return    
ABAJO:
    ;Nos movemos a la abajo en la DDRAM
    btfss PORTB,2,A	    ;Verificamos que se suelte
	goto ABAJO	    ;Si sigue pulsado, esperamos a que se suelte
	incf CONTROLY,W,A   ;Incrementamos registro y guardamos en WREG
	sublw .3	    ;Restamos 3 al WREG, si es 0, existe overflow
	btfss STATUS,2,A    ;Verificamos si el resultado es 0
	    goto ABAJOejec  ;No existe overflow hacia abajo, ejecutamos moovimiento
    ;EXISTE OVERFLOW HACIA ABAJO, NO HACEMOS NADA	
    return    
ABAJOejec:
    ;Avanzamos
    INCF CONTROLY,F,A	    ;INCREMENTAMOS VALOR DE VARIABLE DE CONTROL
    
    ;PROCESO PARA BAJAR EN LA LCD
    movlw 0x40		    ;Movemos un 40 hexadecimal al wreg
    ADDWF POSICION,F,A	    ;Sumamos 0x40 y guardamos en posicion
    movf POSICION,W,A	    ;Movemos la posicion al WREG
    addlw b'10000000'	    ;Literal para llenar la instruccion
    call configLCD	    ;Nos dirigimos a la posicion
    return

ABORT:
   ;Abortamos partida
    btfss PORTB,3,A	    ;Verificamos que se suelte
    goto ABORT		    ;Si sigue pulsado, esperamos a que se suelte
 
ABORTaux:    
    ;APAGAMOS TIMER0 Y LIMPIAMOS CUENTA
    CLRF TMR0H,A
    CLRF TMR0L,A
    CLRF T0CON,A    
    
    clrf STKPTR             ;Limpiamos STACK
    CLRF ALERTAint,A	    ;Regresamos a 0, nuestra variable de control

ABORTint:		    ;ABORT por interrupcion
    
    ;REINICIAMOS VARIABLE DE CONTROL Y POSICIONES
    ;REINICIAMOS variables
    movlw .0
    movwf TURNOS,A	    ;Iniciamos control de turnos en 0
    movlw .41
    movwf TURNOSres,A	    ;Reiniciamos en 41
    movlw .1
    movwf CONTROLX,A	    ;Iniciamos nuestro control X en 1
    movwf CONTROLY,A	    ;Iniciamos nuestro control Y en 1
    btfss flagABORT,0,A	    ;Si la bandera Abort esta activa , llamamos a la pantalla de abort
    call PantallaAbort	    ;Realizamos ejecucion de la pantalla ABORT
    ;EN CASO DE SER LLAMADO POR LA INTERRUPCION REALIZAMOS SU RETURN, si fue por falta de turnos hacemos el goto
    btfsc ALERTAint,0,A	    ;Si la variable esta en 0, salta ya que no fue causado por interrupcion
	return		    ;Regresamos a la rutina de interrupcion
    clrf flagABORT,A	    ;Apagamos la bandera de ABORT
    GOTO INICIO		    ;Volvemos al menu
;
;
ENTER:
    CALL resetTurnoTime	    ; Reseteamos el valor del timer del delay 
    BTFSS PORTB,1,A	    ; Esperamos a que se suelte el boton
    GOTO ENTER		    
; Si turno != 0 entonces aun hay
    movlw .41		;Constante de turnos maximos
    CPFSEQ TURNOS,A	;En caso de que los turnos = 41, alcance el limite saltamos a abort
    GOTO EjecTurno	; Rutina para ejecutar el turno 
    ; MENSAJE DE NO HAY TURNOS Y CALCULAMOS PUNTUACION
    CALL mNOTURNS
    CALL ABORTaux
    RETURN		; Podemos quitarlo, lo dejaremos en caso de error
;
;
;	    -------- ACCIONES QUE SE REALIZAN AL SELECCIONAR TECLA --------
;	    ------------- PANTALLA DE JUEGO== --------------
;	    ----------- EJECUCION DE UN TURNO PULSAR 'ENTER' -----------
;
EjecTurno:
; Primero mostramos los turnos restantes    
    CALL comparamos5	; Verificamos si quedan menos de 5 turnos
    NOP
    MOVLW b'00000001'	    ; Limpiamos LCD y movemos cursor al inicio
    CALL configLCD
; Luego ponemos cartas boca abajo
    CALL ACTUALIZAR_PANTALLA ; Ponemos las cartas boca abajo
    CALL delayLEDS ;
    CALL delayLEDS ;
    TSTFSZ CUAL_CARTA ; Salta si CUAL_CARTA = 0
    CALL VOLTEA_2 ; Volteamos la carta 2
    BTFSS CUAL_CARTA, 0 ; Salta si vale 0x01
    CALL VOLTEA_1 ; Volteamos la carta 1
    BTG CUAL_CARTA, 0 ; Cambiamos entre 0 y 1 el valor de CUAL_CARTA
;
    RETURN		; REGRESAMOS A CHECAR EL TECLADO
;
;
ACTUALIZAR_PANTALLA:
; Actualizamos las cartas de la primera fila
    MOVF SIGUE_1, W, A ; Actualizamos el valor de la carta1 en la pantalla
    CALL writeLCD ;
    MOVF SIGUE_2, W, A ; Actualizamos el valor de la carta2 en la pantalla
    CALL writeLCD ;
    MOVF SIGUE_3, W, A ; Actualizamos el valor de la carta3 en la pantalla
    CALL writeLCD ;
    MOVF SIGUE_4, W, A ; Actualizamos el valor de la carta4 en la pantalla
    CALL writeLCD ;
    MOVF SIGUE_5, W, A ; Actualizamos el valor de la carta5 en la pantalla
    CALL writeLCD ;
    MOVF SIGUE_6, W, A ; Actualizamos el valor de la carta6 en la pantalla
    CALL writeLCD ;
    MOVF SIGUE_7, W, A ; Actualizamos el valor de la carta7 en la pantalla
    CALL writeLCD ;
    MOVF SIGUE_8, W, A ; Actualizamos el valor de la carta8 en la pantalla
    CALL writeLCD ;
    MOVF SIGUE_9, W, A ; Actualizamos el valor de la carta9 en la pantalla
    CALL writeLCD ;
    MOVF SIGUE_10, W, A ; Actualizamos el valor de la carta10 en la pantalla
    CALL writeLCD ;
    MOVF SIGUE_11, W, A ; Actualizamos el valor de la carta11 en la pantalla
    CALL writeLCD ;
    MOVF SIGUE_12, W, A ; Actualizamos el valor de la carta12 en la pantalla
    CALL writeLCD ;
    MOVF SIGUE_13, W, A ; Actualizamos el valor de la carta13 en la pantalla
    CALL writeLCD ;
    MOVF SIGUE_14, W, A ; Actualizamos el valor de la carta14 en la pantalla
    CALL writeLCD ;
    MOVF SIGUE_15, W, A ; Actualizamos el valor de la carta15 en la pantalla
    CALL writeLCD ;
    MOVF SIGUE_16, W, A ; Actualizamos el valor de la carta16 en la pantalla
    CALL writeLCD ;
;
    MOVLW 0XC0
    CALL configLCD ;
; Actualizamos las cartas de la segunda fila
    MOVF SIGUE_17, W, A ; Actualizamos el valor de la carta17 en la pantalla
    CALL writeLCD ;
    MOVF SIGUE_18, W, A ; Actualizamos el valor de la carta18 en la pantalla
    CALL writeLCD ;
    MOVF SIGUE_19, W, A ; Actualizamos el valor de la carta19 en la pantalla
    CALL writeLCD ;
    MOVF SIGUE_20, W, A ; Actualizamos el valor de la carta20 en la pantalla
    CALL writeLCD ;
    MOVF SIGUE_21, W, A ; Actualizamos el valor de la carta21 en la pantalla
    CALL writeLCD ;
    MOVF SIGUE_22, W, A ; Actualizamos el valor de la carta22 en la pantalla
    CALL writeLCD ;
    MOVF SIGUE_23, W, A ; Actualizamos el valor de la carta23 en la pantalla
    CALL writeLCD ;
    MOVF SIGUE_24, W, A ; Actualizamos el valor de la carta24 en la pantalla
    CALL writeLCD ;
    MOVF SIGUE_25, W, A ; Actualizamos el valor de la carta25 en la pantalla
    CALL writeLCD ;
    MOVF SIGUE_26, W, A ; Actualizamos el valor de la carta26 en la pantalla
    CALL writeLCD ;
    MOVF SIGUE_27, W, A ; Actualizamos el valor de la carta27 en la pantalla
    CALL writeLCD ;
    MOVF SIGUE_28, W, A ; Actualizamos el valor de la carta28 en la pantalla
    CALL writeLCD ;
    MOVF SIGUE_29, W, A ; Actualizamos el valor de la carta29 en la pantalla
    CALL writeLCD ;
    MOVF SIGUE_30, W, A ; Actualizamos el valor de la carta30 en la pantalla
    CALL writeLCD ;
    MOVF SIGUE_31, W, A ; Actualizamos el valor de la carta31 en la pantalla
    CALL writeLCD ;
    MOVF SIGUE_32, W, A ; Actualizamos el valor de la carta32 en la pantalla
    CALL writeLCD ;
    RETURN
;
;    
VOLTEA_1:
    MOVF POSICION, W, A ; WREG = POSICION
    ADDLW 0X80 ; WREG + MSB EN 1
    CALL configLCD ;
;
    ;MOVLW 0X80
    MOVFF POSICION, POSICION1 ; CARTA1 = POSICION
    ;BTFSC POSICION1, 7 ; Checamos si esta apagado el MSB
    ;SUBWF POSICION1, F ; CARTA1 -= '1000 0000'
    MOVF POSICION1, W, A ;
    CALL ASIGNA_VALOR ; Nos va a regresar el valor en ASCII del simbolo en esa posicion de la LCD
    MOVFF CARTA_VALOR, CARTA1 ;
    MOVF CARTA_VALOR, W, A ; WREG = CARTA_VALOR
    CALL writeLCD ;
    NOP
    MOVF POSICION, W, A ;
    ADDLW 0X80 ;
    CALL configLCD ;
    CALL delayLEDS ;
    CALL delayLEDS ;
    CALL delayLEDS ;
    NOP
    CALL resetTurnoTime ;
    RETURN
;
;
VOLTEA_2:
    DECF TURNOSres, F, A ;
    incf TURNOS,F,A    ; Incrementamos el registro de turnos
    MOVF POSICION, W, A ; WREG = POSICION
    ADDLW 0X80 ;
    CALL configLCD ;
;
    ;MOVLW 0X80
    MOVFF POSICION, POSICION2 ; POSICION2 = POSICION
    ;BTFSC POSICION2, 7 ; Checamos si esta apagado el MSB
    ;SUBWF POSICION2, F ; CARTA1 -= '1000 0000'
    MOVF POSICION2, W, A ;
    CALL ASIGNA_VALOR ; Nos va a regresar el valor en ASCII del simbolo en esa posicion de la LCD
    MOVFF CARTA_VALOR, CARTA2 ;
    MOVF CARTA_VALOR, W, A ; WREG = CARTA_vALOR
    CALL writeLCD ;
    MOVF POSICION, W, A ;
    ADDLW 0x80 
    CALL configLCD ;
    CALL delayLEDS
    call delayLEDS
    call delayLEDS
    NOP
    CALL resetTurnoTime ;
    MOVF CARTA1, W, A ;
    SUBWF CARTA2, W, A ;
    BTFSC STATUS, 2, A ; SI LA RESTA DA 0, ENTONCES TIENES EL MISMO VALOR
    GOTO QUITAR_PAREJA ; SE QUITAN LAS PAREJAS DE LA PANTALLA
    CALL TAPAR_DENUEVO ; SE TAPAN DE NUEVO LAS 2 CARTAS
    call PARPADEOred
    RETURN    
;
;
QUITAR_PAREJA:
    MOVLW 0X80
    ADDWF POSICION1, W ;
    CALL configLCD ;
    MOVLW 0X20 ; UN ESPACIO
    CALL writeLCD ;
    MOVLW 0X80
    ADDWF POSICION2, W ;
    CALL configLCD ;
    MOVLW 0X20 ; UN ESPACIO
    CALL writeLCD ; 
    MOVF POSICION2, W, A ;
    ADDLW 0X80
    CALL configLCD ;
;
; Actualizar valores para funcion ACTUALIZAR_PANTALLA
    MOVF POSICION1, W, A ;
    CALL FANTASMAS ;
    MOVF POSICION2, W, A ;
    CALL FANTASMAS ;
    call PARPADEOgreen
    incf CONT_PAREJAS,F,A	      ;Aumentamos el valor del contador
    CALL resetTurnoTime ;
    btfsc CONT_PAREJAS,4,A    ;Verificamos si llegamos a 16 parejas encontradas
	goto winRoutine	      ;Vamos a la rutina de WIN
    RETURN		      
;
;
FANTASMAS:
    MOVWF PIVOTE ; PIVOTE = WREG ( CONTIENE LA POSICION DE LA CARTA)
    SUBLW 0X4F ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF ESPACIO, SIGUE_32 ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X4E ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF ESPACIO, SIGUE_31 ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X4D ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF ESPACIO, SIGUE_30 ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X4C ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF ESPACIO, SIGUE_29 ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X4B ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF ESPACIO, SIGUE_28 ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X4A ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF ESPACIO, SIGUE_27 ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X49 ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF ESPACIO, SIGUE_26 ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X48 ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF ESPACIO, SIGUE_25 ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X47 ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF ESPACIO, SIGUE_24 ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X46 ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF ESPACIO, SIGUE_23 ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X45 ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF ESPACIO, SIGUE_22 ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X44 ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF ESPACIO, SIGUE_21 ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X43 ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF ESPACIO, SIGUE_20 ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X42 ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF ESPACIO, SIGUE_19 ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X41 ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF ESPACIO, SIGUE_18 ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X40 ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF ESPACIO, SIGUE_17 ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
;
    SUBLW 0X0F ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF ESPACIO, SIGUE_16 ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X0E ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF ESPACIO, SIGUE_15 ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X0D ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF ESPACIO, SIGUE_14 ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X0C ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF ESPACIO, SIGUE_13 ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X0B ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF ESPACIO, SIGUE_12 ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X0A ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF ESPACIO, SIGUE_11 ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X09 ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF ESPACIO, SIGUE_10 ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X08 ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF ESPACIO, SIGUE_9 ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X07 ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF ESPACIO, SIGUE_8 ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X06 ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF ESPACIO, SIGUE_7 ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X05 ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF ESPACIO, SIGUE_6 ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X04 ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF ESPACIO, SIGUE_5 ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X03 ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF ESPACIO, SIGUE_4 ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X02 ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF ESPACIO, SIGUE_3 ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X01 ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF ESPACIO, SIGUE_2 ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X00 ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF ESPACIO, SIGUE_1 ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    call resetTurnoTime ;
    RETURN
;
;
TAPAR_DENUEVO:
    MOVLW 0X80
    ADDWF POSICION1, W ;
    CALL configLCD ;
    MOVLW 0X03 ; VOLTEAMOS DE NUEVO LA CARTA1
    CALL writeLCD ;
    MOVLW 0X80
    ADDWF POSICION2, W ;
    CALL configLCD ;
    MOVLW 0X03 ; VOLTEAMOS DE NUEVO LA CARTA2
    CALL writeLCD ;
    NOP
    MOVF POSICION2, W , A ;
    ADDLW 0X80
    CALL configLCD ; Nos devolvemos a la posicion actual
    call resetTurnoTime ;
    RETURN
;    
;        
ASIGNA_VALOR:
    MOVWF PIVOTE ; PIVOTE = WREG ( CONTIENE LA POSICION DE LA CARTA)
    SUBLW 0X4F ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF POS_32, CARTA_VALOR ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X4E ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF POS_31, CARTA_VALOR ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X4D ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF POS_30, CARTA_VALOR ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X4C ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF POS_29, CARTA_VALOR ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X4B ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF POS_28, CARTA_VALOR ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X4A ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF POS_27, CARTA_VALOR ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X49 ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF POS_26, CARTA_VALOR ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X48 ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF POS_25, CARTA_VALOR ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X47 ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF POS_24, CARTA_VALOR ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X46 ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF POS_23, CARTA_VALOR ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X45 ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF POS_22, CARTA_VALOR ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X44 ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF POS_21, CARTA_VALOR ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X43 ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF POS_20, CARTA_VALOR ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X42 ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF POS_19, CARTA_VALOR ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X41 ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF POS_18, CARTA_VALOR ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X40 ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF POS_17, CARTA_VALOR ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
;
    SUBLW 0X0F ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF POS_16, CARTA_VALOR ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X0E ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF POS_15, CARTA_VALOR ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X0D ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF POS_14, CARTA_VALOR ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X0C ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF POS_13, CARTA_VALOR ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X0B ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF POS_12, CARTA_VALOR ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X0A ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF POS_11, CARTA_VALOR ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X09 ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF POS_10, CARTA_VALOR ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X08 ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF POS_9, CARTA_VALOR ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X07 ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF POS_8, CARTA_VALOR ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X06 ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF POS_7, CARTA_VALOR ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X05 ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF POS_6, CARTA_VALOR ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X04 ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF POS_5, CARTA_VALOR ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X03 ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF POS_4, CARTA_VALOR ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X02 ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF POS_3, CARTA_VALOR ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X01 ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF POS_2, CARTA_VALOR ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    SUBLW 0X00 ; WREG -= CONSTANTE
    BTFSC STATUS, 2, A ; 
    MOVFF POS_1, CARTA_VALOR ;
    MOVF PIVOTE, W, A ; Le devolvemos el valor de la posicion a WREG
;
    RETURN
;
;
comparamos5:
    movlw .5		    ; Movemos un 5 al WREG
    subwf TURNOSres,W,A	    ; Restamos un 5 y guardamos resultado en el WREG
    btfsc STATUS,2,A	    ; Si es 0 es el turno 5
	call quedan5
    movlw .4		    ; Movemos un 4 al WREG
    subwf TURNOSres,W,A	    ; Restamos un 4 y guardamos resultado en el WREG
    btfsc STATUS,2,A	    ; Si es 0 es el turno 4
	call quedan5	    
    movlw .3		    ; Movemos un 3 al WREG
    subwf TURNOSres,W,A	    ; Restamos un 3 y guardamos resultado en el WREG
    btfsc STATUS,2,A	    ; Si es 0 es el turno 3
	call quedan5
    movlw .2		    ; Movemos un 2 al WREG
    subwf TURNOSres,W,A	    ; Restamos un 2 y guardamos resultado en el WREG
    btfsc STATUS,2,A	    ; Si es 0 es el turno 2
	call quedan5
    movlw .1		    ; Movemos un 1 al WREG
    subwf TURNOSres,W,A	    ; Restamos un 1 y guardamos resultado en el WREG
    btfsc STATUS,2,A	    ; Si es 0 es el turno 1
	call quedan5
    return
    
quedan5:  
    movlw b'00000001'	    ;Limpiamos LCD y movemos cursor al inicio
    call configLCD	    ;Configuramos
    movlw 'T'		    ;LETRA T
    call writeLCD	    ;ESCRIBIMOS
    movlw 'U'		    ;LETRA U
    call writeLCD	    ;ESCRIBIMOS
    movlw 'R'		    ;LETRA R
    call writeLCD	    ;ESCRIBIMOS
    movlw 'N'		    ;LETRA N
    call writeLCD	    ;ESCRIBIMOS
    movlw 'O'	    ;ESPACIO
    call writeLCD	    ;ESCRIBIMOS
    movlw 'S'		    
    call writeLCD	    
    movlw '='		   
    call writeLCD	    
    movlw 0x30		    ;Movemos un0x30 para convertir de decimal a ASCII
    addwf TURNOS,W,A	    ;Sumamos 30 + Turnos y guardamos en WREG
    call writeLCD	    ;Escribimos los turnos restantes
    ;Delay 3 seg para ver los turnos restantes
    CALL delayLEDS	    ;Ejecutamos delay para ver turnos
    CALL delayLEDS	    ;Ejecutamos delay para ver turnos
    CALL delayLEDS	    ;Ejecutamos delay para ver turnos
    CALL delayLEDS	    ;Ejecutamos delay para ver turnos
    CALL delayLEDS	    ;Ejecutamos delay para ver turnos
    return
;---------------EJECUCION DE UN TURNO PULSAR 'ENTER'----------------------------
    

;-------------PANTALLA MARCADORES-----------------------------------------------
MARCADORES: ;RUTINA AL SELECCIONAR MARCADORES
    
    btfss PORTB,0,A	    ;Verificamos que se suelte
    goto MARCADORES	    ;Si sigue pulsado, esperamos a que se suelte
    ;Avanzamos
    ;Encendemos Bandera De abort, para evitar mensaje de calculo de puntuacion
    bsf flagABORT,0,A	    ;Encendemos su bandera
    call PARPADEOred	    ;Encendemos LEDS Rojos
    call PantallaMarcadores ;Desplegamos pantalla de marcadores
    GOTO MRCADOREShabilitados

MRCADOREShabilitados: ;Rutina Marcadores con controles activados
    
    goto PLAYhabilitado	;SON LOS MISMOS CONTROLES, los reutilizamos
    
PantallaMarcadores:      ;CARGAMOS INFORMACION EN LA PANTALLA

    movlw b'00000001'	    ;Limpiamos LCD y movemos cursor al inicio
    call configLCD	    ;Configuramos
    movlw 'M'		    ;LETRA G
    call writeLCD	    ;ESCRIBIMOS
    movlw 'A'		    ;LETRA A
    call writeLCD	    ;ESCRIBIMOS
    movlw 'R'		    ;LETRA M
    call writeLCD	    ;ESCRIBIMOS
    movlw 'C'	    ;ESPACIO
    call writeLCD	    ;ESCRIBIMOS
    movlw 'A'		    ;LETRA E
    call writeLCD	    ;ESCRIBIMOS
    movlw 'D'		    
    call writeLCD	    
    movlw 'O'		   
    call writeLCD	    
    movlw 'R'		    
    call writeLCD	    
    movlw 'E'		    
    call writeLCD
    movlw 'S'		    
    call writeLCD
    ;Siguiente Linea

    MOVLW b'11000000'	    
    CALL configLCD	; Saltamos al segundo renglon
    call LecturaEEPROM	; Leemos si se actualizo la EEPROM para despues desplegarla
    
    ;Escribimos primer puntaje
    movlw '1'
    call writeLCD
    movlw '-'
    call writeLCD
    call Display_v1	; Desplegamos el primer valor de la EEPROM
    MOVLW b'00100000'		   
    CALL writeLCD ; espacio ( 32 decimal en ASCII )
    
    ;Escribimos segundo puntaje
    movlw '2'
    call writeLCD
    movlw '-'
    call writeLCD
    call Display_v2	; Desplegamos el segundo valor de la EEPROM
    MOVLW b'00100000'		   
    CALL writeLCD ; espacio ( 32 decimal en ASCII )
    
    ;Escribimos tercer puntaje
    movlw '3'
    call writeLCD
    movlw '-'
    call writeLCD
    call Display_v3	; Desplegamos el tercer valor de la EEPROM

    ;Ponemos el cursor en la primera posicion
    movlw .0		    ;Movemos la posicion inicial a nustra variable posicion
    movwf POSICION	    ;Variable posicion Actualizada
    movlw b'10000000'	    ;Constante de posicion
    addwf POSICION,W,A	    ;Sumamos la posicion a la constante y guardamos en WREG
    call configLCD	    ;Configuramos
    RETURN		    ;REGRESAMOS 
;-------------PANTALLA MARCADORES-----------------------------------------------

    
;	    ---------- ESCRIBIMOS PANTALLA INICIAL - MENU PRINCIPAL ------------
MAIN_MENU:
; Escribimos los mensajes del menu principal 
    MOVLW b'00000001'	
    CALL configLCD ; Limpiamos LCD y movemos cursor al inicio
    MOVLW 'M'		   
    CALL writeLCD	    
    MOVLW 'E'		    
    CALL writeLCD	    
    MOVLW 'N'		    
    CALL writeLCD	    
    MOVLW 'U'		    
    CALL writeLCD ; Mensaje "MENU" en el primer renglon del LCD	    
;
    MOVLW b'11000000'	    
    CALL configLCD ; Saltamos al segundo renglon
    MOVLW '1'		    
    CALL writeLCD	    
    MOVLW '*'		   
    CALL writeLCD	    
    MOVLW 'P'		    
    CALL writeLCD	    
    MOVLW 'L'		    
    CALL writeLCD
    MOVLW 'A'
    CALL writeLCD
    MOVLW 'Y'		    
    CALL writeLCD ; " 1*PLAY "   
;
    MOVLW b'00100000'		   
    CALL writeLCD ; espacio ( 32 decimal en ASCII )
;
    MOVLW '2'		    
    CALL writeLCD	    
    MOVLW '*'		    
    CALL writeLCD
    MOVLW 'S'	
    CALL writeLCD
    MOVLW 'C'		    
    CALL writeLCD	    
    MOVLW 'O'		   
    CALL writeLCD	    
    MOVLW 'R'		    
    CALL writeLCD	    
    MOVLW 'E'		    
    CALL writeLCD
    MOVLW 'S'	
    CALL writeLCD ; " 2*SCORES "
;   Mensaje desplegado : " 1*PLAY 2*SCORES "
;
    GOTO SCAN_MENU		    ; Habilitamos las opciones menu principal
;
;
mNOTURNS:
    movlw b'00000001'	    ;Limpiamos LCD y movemos cursor al inicio
    call configLCD	    ;Configuramos
    movlw 'G'		    ;LETRA G
    call writeLCD	    ;ESCRIBIMOS
    movlw 'A'		    ;LETRA A
    call writeLCD	    ;ESCRIBIMOS
    movlw 'M'		    ;LETRA M
    call writeLCD	    ;ESCRIBIMOS
    movlw 'E'		    ;LETRA E
    call writeLCD	    ;ESCRIBIMOS
    movlw b'00100000'	    ;ESPACIO
    call writeLCD	    ;ESCRIBIMOS
    movlw 'O'		    
    call writeLCD	    
    movlw 'V'		   
    call writeLCD	    
    movlw 'E'		    
    call writeLCD	    
    movlw 'R'		    
    call writeLCD	    
    ;Saltamos a la segunda linea
    MOVLW b'11000000'	    ; Saltamos a la segunda linea
    call configLCD
    movlw 'N'		    
    call writeLCD	    
    movlw 'O'		    
    call writeLCD
    movlw b'00100000'	    ;ESPACIO
    call writeLCD	    ;ESCRIBIMOS
    movlw 'T'		    
    call writeLCD
    movlw 'U'		    
    call writeLCD
    movlw 'R'		    
    call writeLCD
    movlw 'N'		    
    call writeLCD
    movlw 'S'		    
    call writeLCD
        ;TIEMPO LECTURA
    CALL delayLEDS
    CALL delayLEDS
    CALL delayLEDS
    CALL delayLEDS
    CALL delayLEDS
    CALL delayLEDS
    movlw b'00000001'	    ;Limpiamos LCD y movemos cursor al inicio
    call configLCD	    ;Configuramos
    movlw 'S'	
    call writeLCD
    movlw 'C'		    
    call writeLCD	    
    movlw 'O'		   
    call writeLCD	    
    movlw 'R'		    
    call writeLCD	    
    movlw 'E'		    
    call writeLCD
    movlw '='	
    call writeLCD
    MOVLW '0'
    call writeLCD
    CALL delayLEDS
    CALL delayLEDS
    CALL delayLEDS
    CALL delayLEDS
    CALL delayLEDS
    CALL delayLEDS
    RETURN		    ;Regresamos
;-------------ESCRIBIMOS PANTALLA INICIAL-------------------------------------
;
;
;	    ------------ RUTINAS DE ESCRITURA/CONFIGURACION LCD -------------
writeLCD:
   BSF RS		    ; RS = 1 
   BCF RW		    ; RW = 0
   BSF E		    ; Enable  = 1
   MOVWF dataLCD	    ; LATD = WREG
   NOP			    ; Aseguramos tiempos en LCD
   BCF E		    ; Enable = 0
   CALL esperaLCD	    ; Esperamos a la LCD
   RETURN		 
;
configLCD:
   BCF RS		    ; RS = 0 
   BCF RW		    ; RW = 0
   BSF E		    ; Enable  = 1
   MOVWF dataLCD	    ; LATD = WREG
   NOP			    ; Aseguramos tiempos en LCD
   BCF E		    ; Enable = 0
   CALL esperaLCD	    ; Esperamos a la LCD
   RETURN		    ; Regresamos
;
;
;	    -------------- RUTINAS LEDS --------------
PARPADEOgreen:		; Rutina para parpadear los LEDS verdes
    MOVLW b'01000100'
    MOVWF LATC, A	; Encendemos los LEDs conectados
    CALL delayLEDS
    CLRF LATC		; Los apagamos
    CALL delayLEDS	 
    MOVLW b'01000100'
    MOVWF LATC, A	; Encendemos nuevamente
    CALL delayLEDS
    clrf LATC,A		; Los apagamos
    return
;
PARPADEOred:		; Rutina para parpadear los LEDs rojos
    movlw b'00000011'
    MOVWF LATC, A	; Encendemos los LEDs conectados
    CALL delayLEDS
    CLRF LATC		; Los apagamos
    CALL delayLEDS	 
    MOVLW b'00000011'
    MOVWF LATC, A	; Encendemos nuevamente
    CALL delayLEDS
    clrf LATC,A		; Los apagamos
    return
;
;	    ---------- RUTINAS TIMERS ------------    
delayTurnos: ; Utilizamos TMR0 ( Delay de 7 s aprox. )
;
    MOVLW b'00000111'
    MOVWF T0CON,A ; Preescalador 1:256, 16 bits, Internal clock
;
    MOVLW b'10010101'
    MOVWF TMR0H,A
    MOVLW b'00110000'
    MOVWF TMR0L,A ; Valor inicial = 27,344
;
    BSF T0CON,7,A ; Activar el TMR0
    RETURN ; Regresamos con el Timer  habilitado    
;
;
delayLEDS: ; Utilizamos TMR1 ( Delay de 500 ms aprox. )
    MOVLW b'00110011'
    MOVWF T1CON, A ; Instruction clock, Preescalador 1:8, 16 bits, Timer1 ON
    BCF T1GCON, 7 ; Temporizador normal
;
    MOVLW b'01011110'	; CARGAMOS VALOR MAS SIGNIFICATIVO
    MOVWF TMR1H, A   
    MOVLW b'11100000'	; CARGAMOS VALOR MAS SIGNIFICATIVO
    MOVWF TMR1L, A	; VALOR INICIAL = 24, 288
;
    GOTO DelayTMR1
;
;    
esperaLCD:	; Utilizamos TMR2 ( delay de 2ms aprox. )
    MOVLW .7
    MOVWF PR2, A ; PR2 <- Registro que contiene el valor maximo para contar; despues de ello, se desborda bandera de TMR2
    MOVLW b'01111110'
    MOVWF T2CON, A ; <- Posescalador 1:16 , Preescalador 1:16 , TMR2 ON .
    GOTO DelayTMR2
;
;ejecutamosDelayTMR0:
;   BTFSS INTCON,2,A	;VERIFICAMOS BANDERA DE DESBORDAMIENTO
;	GOTO ejecutamosDelayTMR0	;loop de espera
;	BCF INTCON,2,A	;APAGAMOS BANDERA DE DESBORDAMIENTO
;	CLRF T0CON,A	;DETENEMOS TIMER Y BORRAMOS CONFIGURACION
;	CLRF TMR0L,A	;ELIMINAMOS CUENTA 
;	CLRF TMR0H,A	;ELIMINAMOS CUENTA 
;    return
;      
DelayTMR1:
    BTFSS PIR1, 0, A	; Checamos bandera de desbordamiento
    GOTO DelayTMR1   
    BCF PIR1, 0, A	; Limpiamos bandera
    CLRF TMR1H,A	; ( NECESARIO ??? )
    CLRF TMR1L,A	; ( NECESARIO ??? )
    BCF T1CON, 0	; Apagamos el TMR1
    RETURN
; 
DelayTMR2:
    BTFSS PIR1, 1, A	; Checamos si se prende bandera de desbordamiento
    GOTO DelayTMR2
    BCF PIR1, 1, A	; Limpiamos bandera
    BCF T2CON, 2 ; Apagamos el TMR2 ( DUDA ??? )
    RETURN    
    
resetTurnoTime:
    ;Reiniciamos la cuenta de nuestras selecciones, para evitar bandera de desbordamiento
    CLRF T0CON,A    ;DETENEMOS TIMER
    CLRF TMR0H,A    ;ELIMINAMOS CUENTA
    CLRF TMR0L,A    ;ELIMINAMOS CUENTA
    
    CALL delayTurnos;REACTIVAMOS TIMER
    
    return
    ;-------------RUTINAS TIMERS ---------------------------------------------------
;----------------------MENSAJES DE ERROR-------------------------------------------
mNOTIME:
    movlw b'00000001'	    ;Limpiamos LCD y movemos cursor al inicio
    call configLCD	    ;Configuramos
    movlw 'G'		    ;LETRA G
    call writeLCD	    ;ESCRIBIMOS
    movlw 'A'		    ;LETRA A
    call writeLCD	    ;ESCRIBIMOS
    movlw 'M'		    ;LETRA M
    call writeLCD	    ;ESCRIBIMOS
    movlw 'E'		    ;LETRA E
    call writeLCD	    ;ESCRIBIMOS
    movlw b'00100000'	    ;ESPACIO
    call writeLCD	    ;ESCRIBIMOS
    movlw 'O'		    
    call writeLCD	    
    movlw 'V'		   
    call writeLCD	    
    movlw 'E'		    
    call writeLCD	    
    movlw 'R'		    
    call writeLCD	    
    ;Saltamos a la segunda linea
    MOVLW b'11000000'	    ; Saltamos a la segunda linea
    call configLCD
    movlw 'N'		    
    call writeLCD	    
    movlw 'O'		    
    call writeLCD
    movlw b'00100000'	    ;ESPACIO
    call writeLCD	    ;ESCRIBIMOS
    movlw 'T'		    
    call writeLCD
    movlw 'I'		    
    call writeLCD
    movlw 'M'		    
    call writeLCD
    movlw 'E'		    		    
    call writeLCD
    ;TIEMPO LECTURA
    CALL delayLEDS
    CALL delayLEDS
    CALL delayLEDS
    CALL delayLEDS
    CALL delayLEDS
    CALL delayLEDS
    movlw b'00000001'	    ;Limpiamos LCD y movemos cursor al inicio
    call configLCD	    ;Configuramos
    movlw 'S'	
    call writeLCD
    movlw 'C'		    
    call writeLCD	    
    movlw 'O'		   
    call writeLCD	    
    movlw 'R'		    
    call writeLCD	    
    movlw 'E'		    
    call writeLCD
    movlw '='	
    call writeLCD
    MOVLW '0'
    call writeLCD
    CALL delayLEDS
    CALL delayLEDS
    CALL delayLEDS
    CALL delayLEDS
    CALL delayLEDS
    CALL delayLEDS
    RETURN		    ;Regresamos
;--------------------------- Rutina Creacion de CHARs personalizados--------
creacionCHAR:
    ;CARACTER 1
    movlw b'01000000'	    ;Nos colocamos en CGRAM 0x00
    call configLCD	    ;Configuramos
    movlw b'11111'	    
    call writeLCD	    ;Escribimos en la CGRAM
    movlw b'10000'	    
    call writeLCD	    ;Escribimos en la CGRAM
    movlw b'10111'	    
    call writeLCD	    ;Escribimos en la CGRAM
    movlw b'10101'	    
    call writeLCD	    ;Escribimos en la CGRAM
    movlw b'10101'	    
    call writeLCD	    ;Escribimos en la CGRAM
    movlw b'10101'	    
    call writeLCD	    ;Escribimos en la CGRAM
    movlw b'10001'	    
    call writeLCD	    ;Escribimos en la CGRAM
    movlw b'11111'	    
    call writeLCD	    ;Escribimos en la CGRAM
    
    ;CARACTER 2
    movlw b'11100'	    
    call writeLCD	    ;Escribimos en la CGRAM
    movlw b'10001'	    
    call writeLCD	    ;Escribimos en la CGRAM
    movlw b'10101'	    
    call writeLCD	    ;Escribimos en la CGRAM
    movlw b'10000'	    
    call writeLCD	    ;Escribimos en la CGRAM
    movlw b'00000'	    
    call writeLCD	    ;Escribimos en la CGRAM
    movlw b'00111'	    
    call writeLCD	    ;Escribimos en la CGRAM
    movlw b'00000'	    
    call writeLCD	    ;Escribimos en la CGRAM
    movlw b'11011'	    
    call writeLCD	    ;Escribimos en la CGRAM
    
    ;CARACTER 3
    movlw b'00011111'	    
    call writeLCD	    ;Escribimos en la CGRAM
    movlw b'00010001'	    
    call writeLCD	    ;Escribimos en la CGRAM
    movlw b'00001010'	    
    call writeLCD	    ;Escribimos en la CGRAM
    movlw b'00000000'	    
    call writeLCD	    ;Escribimos en la CGRAM
    movlw b'00010001'	    
    call writeLCD	    ;Escribimos en la CGRAM
    movlw b'00011011'	    
    call writeLCD	    ;Escribimos en la CGRAM
    movlw b'00000100'	    
    call writeLCD	    ;Escribimos en la CGRAM
    movlw b'00011111'	    
    call writeLCD	    ;Escribimos en la CGRAM
    ;CARACTER 4 (OCULTO)
    movlw b'00001110'	    
    call writeLCD	    ;Escribimos en la CGRAM
    movlw b'00011111'	    
    call writeLCD	    ;Escribimos en la CGRAM
    movlw b'00011111'	    
    call writeLCD	    ;Escribimos en la CGRAM
    movlw b'00011111'	    
    call writeLCD	    ;Escribimos en la CGRAM
    movlw b'00011111'	    
    call writeLCD	    ;Escribimos en la CGRAM
    movlw b'00011111'	    
    call writeLCD	    ;Escribimos en la CGRAM
    movlw b'00001110'	    
    call writeLCD	    ;Escribimos en la CGRAM
    movlw b'00001110'	    
    call writeLCD	    ;Escribimos en la CGRAM
    return		    ;Regresamos a la rutina principal

    
    ;--------------------RUTINAS PARA CUANDO SE GANE----------------------------
winRoutine:
    
winMensaaje:
    movlw b'00000001'	    ;Limpiamos LCD y movemos cursor al inicio
    call configLCD	    ;Configuramos
    movlw 'Y'		    ;LETRA Y
    call writeLCD	    ;ESCRIBIMOS
    movlw 'O'		    ;LETRA O
    call writeLCD	    ;ESCRIBIMOS
    movlw 'U'		    ;LETRA MU
    call writeLCD	    ;ESCRIBIMOS
    
    movlw b'00100000'	    ;ESPACIO
    call writeLCD	    ;ESCRIBIMOS

    movlw 'W'		    
    call writeLCD	    
    movlw 'I'		   
    call writeLCD	    
    movlw 'N'		    
    call writeLCD	    
    movlw '!'		    
    call writeLCD	    
    ;Saltamos a la segunda linea
    MOVLW b'11000000'	    ; Saltamos a la segunda linea
    call configLCD
    movlw 'S'		    
    call writeLCD	    
    movlw 'C'		    
    call writeLCD
    movlw 'O'		    
    call writeLCD
    movlw 'R'		    
    call writeLCD
    movlw 'E'		    
    call writeLCD
    movlw '='		    		    
    call writeLCD
    movlw .0		    ;ponemos en 0 el auxiliar
    call calcScore	    ;Calculamos puntaje
    ;Tiempo de lectura
    CALL delayLEDS
    CALL delayLEDS
    ;TIEMPO LECTURA
    CALL delayLEDS
    CALL delayLEDS
    CALL delayLEDS
    CALL delayLEDS
    CALL delayLEDS
    CALL delayLEDS
   
    
    GOTO INICIO		    ;REGRESAMOS AL INICIO DEL PROGRAMA
    
calcScore:
    movlw .16	; WREG = 16
    subwf TURNOS,F,A ;TURNOS = TURNOS - 16
    ;Debido a que solo usamos 8 bits, para representar el maximo resultado

    movlw .4		;WREG = 4
    mulwf TURNOS,A	;Multiplicamos el WREG*(TURNOS - 16)
    ;El resultado se guarda en el registro PRODL
    MOVF PRODL,W,A	;Movemos el resultado al WREG
    ;EJECUTAMOS RESTA
    ;prodl =  Resultado
    sublw .100		;Restamos K - WREG, ES DECIR 100 - RESULTADO  de WREG*(TURNOS - 16)
    ;El resultado es almacenado en WREG
    movwf SCORE,A	;Movemos el resultado almacenado en WREG al registro SCORE  
    call chekIfHighScores   ;modificamos la posicion en la EEPROM y verificamos si es nuevo high score
    call convert	    ;Desplegamos Puntuacion, convirtiendo el binario a ASCII
    return		;Regresamos a winRoutine
    
chekIfHighScores:
    ;Desactivamos las interrupciones, ya que se acabo el juego
    BCF INTCON,7,A	;Desactivamos interrupciones globales
    call LecturaEEPROM
    
    ;Hacemos comparacion
    MOVF VALOReprom1,W,A	;Movemos nuestro primer valor al WREG (mas alto)
    CPFSLT SCORE,A	;Salta si Score < WREG
	goto Acomodo1	;Acomodamos la puntuacion
    MOVF VALOReprom2,W,A	;Movemos nuestro segundo valor al WREG (2do mas alto)
    CPFSLT SCORE,A	;Salta si Score < WREG
	goto Acomodo2
    MOVF VALOReprom3,W,A	;Movemos nuestro segundo valor al WREG (3ro mas alto)
    CPFSLT SCORE,A	;Salta si Score < WREG
	goto Acomodo3
    
    ;No fue mas alto que ninguno del record, por lo que no se necesita reorganizar el 
    ;EEPROM, solo desplegamos la puntuacion
    return		;De donde la llamamos al acabar el juego
    
Acomodo1:
    ;Movemos SCORE a la cima de puntajes
    
    ;SCORE ES EL NUEVO HIGHSCHORE
    movlw .0		;Direccion en la que escribiremos
    movwf EEADR,A	;Movemos la direccion a nuestro registro
    movff SCORE,EEDATA	;Movemos nuestro SCORE al registro de datos lecura/escritura
    call EscrituraEEPROM;Escribimos en la EEPROM
    
    ;Recorremos los puntajes
    movlw .1		;Direccion en la que escribiremos
    movwf EEADR,A	;Movemos la direccion a nuestro registro
    movff VALOReprom1,EEDATA	;Movemos nuestro SCORE al registro de datos lecura/escritura
    call EscrituraEEPROM
    
    ;Recorremos los puntajes
    movlw .2		;Direccion en la que escribiremos
    movwf EEADR,A	;Movemos la direccion a nuestro registro
    movff VALOReprom2,EEDATA	;Movemos nuestro SCORE al registro de datos lecura/escritura
    call EscrituraEEPROM
    
    call newHighScore	;Llamamos a la funcion de escritura 'Nuevo High Score'
    
    return		;Regresamos de donde llamaron a chekIfHighScores
    
    
Acomodo2:
    ;Colocamos como segundo puntaje mas alto
    
    ;Mantenemos el primer puntaje en su lugar
    
    ;Colocamos SCORE, como segundo puesto
    movlw .1		;Direccion en la que escribiremos
    movff SCORE,EEDATA	;Movemos nuestro SCORE al registro de datos lecura/escritura
    call EscrituraEEPROM
    
    ;Recorremos los puntajes
    movlw .2		;Direccion en la que escribiremos
    movff VALOReprom2,EEDATA	;Movemos nuestro SCORE al registro de datos lecura/escritura
    call EscrituraEEPROM
    
    return		;Regresamos de donde llamaron a chekIfHighScores
    
Acomodo3:
    ;Colocamos como tercer puntaje mas alto
    
    ;Mantenemos el primer puntaje en su lugar
    
    ;Mantenemos el segundo puntaje en su lugar
    
    ;colocamos como tercer mejor puntaje
    movlw .2		;Direccion en la que escribiremos
    movff SCORE,EEDATA	;Movemos nuestro SCORE al registro de datos lecura/escritura
    call EscrituraEEPROM
   
    return		;Regresamos de donde llamaron a chekIfHighScores
    
    
EscrituraEEPROM:	;Rutina para escribir en la EEPROM   
    
    
    ;Activiamos escritura
    MOVLW B'00000100'	;PERMITE ESCRIBIR EN EEPROM WREN
    MOVWF EECON1,A	
    
    ;'CONTRASENA'
    movlw 0x55		;Cargamos contante a EECON2
    MOVWF EECON2,A
    MOVLW 0x0AA		;Cargamos a EECON2
    MOVWF EECON2,A
    
    
    bsf EECON1,WR,A	;Activamos modo de escritura (START)
    ;verificamos si termino de escribir
    
checkWriteFlag:
    
    btfsc EECON1,WR,A	;Verificamos si trermino de escribir
	goto checkWriteFlag;Loop de verificacion
	bcf EECON1,2,A	;Desactivamos el WREN
	CLRF EECON1,A	;ELIMINAMOS CONFIGURACION REALIZADA ANTERIORMENTE
	bcf EECON1,WR,A	;Nos aseguramos de que este apagado el modo escritura
	
	return		;Regresamos a realizar mas escrituras
        

    
LecturaEEPROM:		;Lee los primeros 3 valores de la EEPROM para despliegue u reacomodo   
    
    ;Leemos las 3 primeras posiciones de la EEPROM
    ;Guardamos en primer variable 
    movlw .0	    
    movwf EEADR,A	;Movemos la posicion que deseamos leer
    bcf EECON1,7,A	;clear a b7
    bcf EECON1,6,A	;clear a b6
    bsf EECON1,0,A	;Activa la lectura
    movff EEDATA,VALOReprom1	;Mueve el datgo leido a la variable de lectura 1
    bcf EECON1,0,A	;Desactiva lectura
    
    
    ;Guardamos en segunda variable 
    movlw .1	    
    movwf EEADR,A	;Movemos la posicion que deseamos leer
    bsf EECON1,0,A	;Activa la lectura
    movff EEDATA,VALOReprom2	;Mueve el datgo leido a la variable de lectura 1
    bcf EECON1,0,A	;Desactiva lectura

    ;Guardamos en tercera variable
    
    movlw .2	    
    movwf EEADR,A	;Movemos la posicion que deseamos leer
    bsf EECON1,0,A	;Activa la lectura
    movff EEDATA,VALOReprom3	;Mueve el datgo leido a la variable de lectura 1
    bcf EECON1,0,A	;Desactiva lectura
    return

newHighScore:
    
    movlw b'00000001'	    ;Limpiamos LCD y movemos cursor al inicio
    call configLCD	    ;Configuramos
    movlw 'N'		    ;LETRA Y
    call writeLCD	    ;ESCRIBIMOS
    movlw 'E'		    ;LETRA O
    call writeLCD	    ;ESCRIBIMOS
    movlw 'W'		    ;LETRA MU
    call writeLCD	    ;ESCRIBIMOS
    
    movlw b'00100000'	    ;ESPACIO
    call writeLCD	    ;ESCRIBIMOS

    movlw 'H'		    
    call writeLCD	    
    movlw 'I'		   
    call writeLCD	    
    movlw 'G'		    
    call writeLCD	    
    movlw 'H'		    
    call writeLCD	    
    ;Saltamos a la segunda linea
    MOVLW b'11000000'	    ; Saltamos a la segunda linea
    call configLCD
    movlw 'S'		    
    call writeLCD	    
    movlw 'C'		    
    call writeLCD
    movlw 'O'		    
    call writeLCD
    movlw 'R'		    
    call writeLCD
    movlw 'E'		    
    call writeLCD
    movlw '!'		    		    
    call writeLCD
    movlw '='		    		    
    call writeLCD
    return
    
convert:
    ;Limpiamos variables de calculo
    clrf DECENAS,A
    clrf UNIDADES,A
    movlw .100		;Movemos 100 al WREG
    cpfseq SCORE, A	;Verificamos si la puntuacion es igual a 100
	goto Unidades_Decenas;Si no es 100, vamos a verificar decenas y centenas
    
    ;Aparecemos un 100 en pantalla
    movlw '1'		;Movemos un 1
    CALL writeLCD	;Escribimos en pantalla
    movlw '0'		;Movemos un 0
    call writeLCD	;Escribimos en pantalla
    movlw '0'
    CALL writeLCD
    return
    
Unidades_Decenas:	;Separamos nuestros digitos 
    movlw .10
    cpfslt SCORE, A	;verificamos si el valor del registro es menor al de WREG
    goto DEC10		;ES MAYOR, por lo que restamos 10
    goto UNIDAD		;ES MENOR, por lo que calculamos unidades
DEC10:
    subwf SCORE, F, A	;Restamos el SCORE del WREG y guardamos en registro
    incf DECENAS, F, A	;Incrementamos registro de decenas
    goto Unidades_Decenas    
UNIDAD:
    ;Resto Decenas a mi SCORE
    movf DECENAS,W,A	;Movemos nuestras Decenas al WREG
    ADDLW 0x30		;Sumamos constante al WREG, para convertir a ASCII
    call writeLCD	;Escribimos en la LCD
    movf DECENAS,W,A	;Movemos nuestras Decenas al WREG  90-9*10 = 0 = 30
    CLRF PRODL,A
    CLRF PRODH,A
    MULWF DIEZ,A	;MULTIPLICAMOS X 10
    MOVF PRODL,W,A	;La parte menos significativa la mandamos a WREG
    subwf SCORE,W,A	;Restamos las decenas del score y nos quedamos con las unidades
    MOVF SCORE,W,A	;Movemos lo que queda del SCORE al wreg
    ADDLW 0x30		;Sumamos constante al WREG, para convertir a ASCII
    call writeLCD	;Escribimos unidades
    return

PantallaAbort:
    CALL PARPADEOred
    movlw b'00000001'	    ;Limpiamos LCD y movemos cursor al inicio
    call configLCD	    ;Configuramos
    movlw 'A'		    ;LETRA Y
    call writeLCD	    ;ESCRIBIMOS
    movlw 'B'		    ;LETRA O
    call writeLCD	    ;ESCRIBIMOS
    movlw 'O'		    ;LETRA MU
    call writeLCD	    ;ESCRIBIMOS
    movlw 'R'		    
    call writeLCD	    
    movlw 'T'		   
    call writeLCD	    
    movlw '!'		    
    call writeLCD	    
    
    ;Saltamos a la segunda linea
    MOVLW b'11000000'	    ; Saltamos a la segunda linea
    call configLCD
    movlw 'S'		    
    call writeLCD	    
    movlw 'C'		    
    call writeLCD
    movlw 'O'		    
    call writeLCD
    movlw 'R'		    
    call writeLCD
    movlw 'E'		    
    call writeLCD
    movlw '!'		    		    
    call writeLCD
    movlw '='		    
    call writeLCD
    movlw '0'		    		    
    call writeLCD
    ;TIEMPO LECTURA
    CALL delayLEDS
    CALL delayLEDS
    CALL delayLEDS
    CALL delayLEDS
    CALL delayLEDS
    CALL delayLEDS
    CALL PARPADEOred

    return
 
Display_v1:
    
    ;Limpiamos variables de calculo
    clrf DECENAS,A
    clrf UNIDADES,A
    movlw .100		;Movemos 100 al WREG
    cpfseq VALOReprom1, A	;Verificamos si la puntuacion es igual a 100
	goto Unidades_Decenas_v1;Si no es 100, vamos a verificar decenas y centenas
    
    ;Aparecemos un 100 en pantalla
    movlw '1'		;Movemos un 1
    CALL writeLCD	;Escribimos en pantalla
    movlw '0'		;Movemos un 0
    call writeLCD	;Escribimos en pantalla
    movlw '0'
    CALL writeLCD
    return
    
Unidades_Decenas_v1:	;Separamos nuestros digitos 
    movlw .10
    cpfslt VALOReprom1, A	;verificamos si el valor del registro es menor al de WREG
    goto DEC10_v1		;ES MAYOR, por lo que restamos 10
    goto UNIDAD_v1		;ES MENOR, por lo que calculamos unidades
DEC10_v1:
    subwf VALOReprom1, F, A	;Restamos el SCORE del WREG y guardamos en registro
    incf DECENAS, F, A	;Incrementamos registro de decenas
    goto Unidades_Decenas_v1    
UNIDAD_v1:
    ;Resto Decenas a mi SCORE
    movf DECENAS,W,A	;Movemos nuestras Decenas al WREG
    ADDLW 0x30		;Sumamos constante al WREG, para convertir a ASCII
    call writeLCD	;Escribimos en la LCD
    movf DECENAS,W,A	;Movemos nuestras Decenas al WREG  90-9*10 = 0 = 30
    CLRF PRODL,A
    CLRF PRODH,A
    MULWF DIEZ,A	;MULTIPLICAMOS X 10
    MOVF PRODL,W,A	;La parte menos significativa la mandamos a WREG
    subwf VALOReprom1,W,A	;Restamos las decenas del score y nos quedamos con las unidades
    MOVF VALOReprom1,W,A	;Movemos lo que queda del SCORE al wreg
    ADDLW 0x30		;Sumamos constante al WREG, para convertir a ASCII
    call writeLCD	;Escribimos unidades
    return

    
    
    
    
Display_v2:
    
    ;Limpiamos variables de calculo
    clrf DECENAS,A
    clrf UNIDADES,A
    movlw .100		;Movemos 100 al WREG
    cpfseq VALOReprom2, A	;Verificamos si la puntuacion es igual a 100
	goto Unidades_Decenas_v2;Si no es 100, vamos a verificar decenas y centenas
    
    ;Aparecemos un 100 en pantalla
    movlw '1'		;Movemos un 1
    CALL writeLCD	;Escribimos en pantalla
    movlw '0'		;Movemos un 0
    call writeLCD	;Escribimos en pantalla
    movlw '0'
    CALL writeLCD
    return
    
Unidades_Decenas_v2:	;Separamos nuestros digitos 
    movlw .10
    cpfslt VALOReprom2, A	;verificamos si el valor del registro es menor al de WREG
    goto DEC10_v2		;ES MAYOR, por lo que restamos 10
    goto UNIDAD_v2		;ES MENOR, por lo que calculamos unidades
DEC10_v2:
    subwf VALOReprom2, F, A	;Restamos el SCORE del WREG y guardamos en registro
    incf DECENAS, F, A	;Incrementamos registro de decenas
    goto Unidades_Decenas_v2    
UNIDAD_v2:
    ;Resto Decenas a mi SCORE
    movf DECENAS,W,A	;Movemos nuestras Decenas al WREG
    ADDLW 0x30		;Sumamos constante al WREG, para convertir a ASCII
    call writeLCD	;Escribimos en la LCD
    movf DECENAS,W,A	;Movemos nuestras Decenas al WREG  90-9*10 = 0 = 30
    CLRF PRODL,A
    CLRF PRODH,A
    MULWF DIEZ,A	;MULTIPLICAMOS X 10
    MOVF PRODL,W,A	;La parte menos significativa la mandamos a WREG
    subwf VALOReprom2,W,A	;Restamos las decenas del score y nos quedamos con las unidades
    MOVF VALOReprom2,W,A	;Movemos lo que queda del SCORE al wreg
    ADDLW 0x30		;Sumamos constante al WREG, para convertir a ASCII
    call writeLCD	;Escribimos unidades
    return

    
    
Display_v3:
    
    ;Limpiamos variables de calculo
    clrf DECENAS,A
    clrf UNIDADES,A
    movlw .100		;Movemos 100 al WREG
    cpfseq VALOReprom3, A	;Verificamos si la puntuacion es igual a 100
	goto Unidades_Decenas_v3;Si no es 100, vamos a verificar decenas y centenas
    
    ;Aparecemos un 100 en pantalla
    movlw '1'		;Movemos un 1
    CALL writeLCD	;Escribimos en pantalla
    movlw '0'		;Movemos un 0
    call writeLCD	;Escribimos en pantalla
    movlw '0'
    CALL writeLCD
    return
    
Unidades_Decenas_v3:	;Separamos nuestros digitos 
    movlw .10
    cpfslt VALOReprom3, A	;verificamos si el valor del registro es menor al de WREG
    goto DEC10_v3		;ES MAYOR, por lo que restamos 10
    goto UNIDAD_v3		;ES MENOR, por lo que calculamos unidades
DEC10_v3:
    subwf VALOReprom3, F, A	;Restamos el SCORE del WREG y guardamos en registro
    incf DECENAS, F, A	;Incrementamos registro de decenas
    goto Unidades_Decenas_v3    
UNIDAD_v3:
    ;Resto Decenas a mi SCORE
    movf DECENAS,W,A	;Movemos nuestras Decenas al WREG
    ADDLW 0x30		;Sumamos constante al WREG, para convertir a ASCII
    call writeLCD	;Escribimos en la LCD
    movf DECENAS,W,A	;Movemos nuestras Decenas al WREG  90-9*10 = 0 = 30
    CLRF PRODL,A
    CLRF PRODH,A
    MULWF DIEZ,A	;MULTIPLICAMOS X 10
    MOVF PRODL,W,A	;La parte menos significativa la mandamos a WREG
    subwf VALOReprom3,W,A	;Restamos las decenas del score y nos quedamos con las unidades
    MOVF VALOReprom3,W,A	;Movemos lo que queda del SCORE al wreg
    ADDLW 0x30		;Sumamos constante al WREG, para convertir a ASCII
    call writeLCD	;Escribimos unidades
    return

    END