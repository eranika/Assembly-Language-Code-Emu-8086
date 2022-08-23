
  ;LAB WORK 6
  ;Write a program to enter a character and print the corresponding ASCII code in Hexadecimal
 
 
  ;ROLL 1703176



.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB  0AH, 0DH, 'Enter the character : $'
MSG2 DB  0AH, 0DH, 'Corresponding ASCII code in HEX is : $'


.CODE
MAIN PROC
    
    ;INITIALIZING PROMPT USER
    
    MOV AX, @DATA
    MOV DS, AX
    
    ;FIRST PROMPT USER MSG
    
    LEA DX, MSG1
    MOV AH, 9
    INT 21H
    
    ;INPUT CHARACTER
    
    MOV AH, 1
    INT 21H   
    
    ;MOVING INPUT TO BL

    MOV BL, AL                 
     
    ;CHECKING IF NTER IS HIT
     
    CMP BL, 0DH                
    JE END                   
                
    ;ECOND PROMPT USER MSG
                
    LEA DX, MSG2           
    MOV AH, 9
    INT 21H
            
    ;CLEARING DX & LOOP OP1 START
    
    XOR DX, DX                 
    MOV CX, 4    
    
    LOOP1:
        SHL BL, 1       ; IF INPUT IS A; 0000 0000 0100 0001, AND AFTER THIS LOOP WE GET 0000 0100 0001 0000
        RCL DL, 1       ; CF = 1; DL IS 0000 0100
    LOOP LOOP1
             
    ;LOOP OP2 START
             
    MOV CX, 4
    
    LOOP2:
        SHL BL, 1       ; HERE WE GET 0100 0001 0000 0000 = BX
        RCL DH, 1       ; CF = 1, HERE WE GET 0000 0100
    LOOP LOOP2
    
    MOV BX, DX          ; MOV DX TO BX
    MOV CX, 2
    
    LOOP3:
        CMP CX, 1
        JE SECOND_DIGIT     ;BX = BH + BL.
        MOV DL, BL
        JMP NEXT
    
        SECOND_DIGIT:
        MOV DL, BH
    
        NEXT:
    
        MOV AH, 2
    
        CMP DL, 9           ; 39H
        JBE NUMERIC_DIGIT   ;IF DL<=9, GO NUMERIC_DIGIT
        SUB DL, 9           ;39H, CONV TO NUMBER
        OR DL, 40H          ;CONV TO LETTER
        JMP DISPLAY
    
        NUMERIC_DIGIT:
        OR DL, 30H          ;CONV DECIMAL TO ASCII
    
        DISPLAY:
        INT 21H
    LOOP LOOP3
      
    ;DOS RETURN  
    
    END:
    MOV AH, 4CH
    INT 21H
    
    MAIN ENDP
END MAIN
   
 