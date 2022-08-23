
  ;LAB WORK 5 
  ;Write a program to enter a character and count the number of 1 bits in the corresponding ASCII code.

  ;ROLL 1703176

.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB 0AH, 0DH, 'Enter the number: $'
MSG2 DB 0AH, 0DH, 'In ASCII: $'
MSG3 DB 0AH, 0DH, 'Number of 1 bits presence: $'


.CODE
MAIN PROC     
    
    ;INITIALIZING PROMPT USER
    
    MOV AX, @DATA
    MOV DS, AX
    
    ;FIRST PROMPT USER MSG
    
    LEA DX, MSG1
    MOV AH, 9
    INT 21H
    
    ;INPUT NUMBER
    
    MOV AH, 1
    INT 21H
    
    XOR BX, BX
    MOV BL, AL    
    
    ;LINE FEED                
                    
    MOV DL,0AH
    MOV AH,2
    INT 21H
              
    ;CARRIAGE RETURN          
              
    MOV DL,0DH
    MOV AH,2
    INT 21H
    
    ;SECOND PROMPT USER MSG
    
    LEA DX, MSG2
    MOV AH, 9
    INT 21H
    
    XOR BH, BH
    MOV CX, 8 
    MOV AH, 2
    
    
    
    OUTPUT: 
            SHL BL, 1
            
            
            JNC ZERO  ; WHEN 0 JUMP TO ZERO
            INC BH    ; ELSE INCREMENT BH
            MOV DL, 31H ; SAVING 1 IN DL TO PRINT
            JMP DISPLAY ; JUMP TO DISPLAY
            
            ZERO:
            MOV DL, 30H ; SAVING 0 IN DL TO PRINT
            
            DISPLAY:
            INT 21H    ; DISPLAY DL ONE BY ONE
            
            
    LOOP OUTPUT  
    
            
    ;LINE FEED                
                    
    MOV DL,0AH
    MOV AH,2
    INT 21H
              
    ;CARRIAGE RETURN          
              
    MOV DL,0DH
    MOV AH,2
    INT 21H
    
    ;THIRD PROMPT USER MSG
    
    LEA DX, MSG3
    MOV AH, 9
    INT 21H
    
    OR BH, 30H
    
    MOV AH, 2
    MOV DL, BH
    INT 21H
    
    
    ;DOS RETURN
      
    MOV AH, 4CH
    INT 21H
    
    MAIN ENDP
END MAIN
                
        




