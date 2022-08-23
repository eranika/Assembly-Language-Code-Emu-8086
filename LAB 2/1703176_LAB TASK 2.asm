
.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB 0AH,0DH, 'Enter a hex digit: $'
MSG2 DB 0AH,0DH, 'In decimal it is: $'

.CODE   
MAIN PROC   
    
    ;INITIALIZING PROMPT USER
    
    MOV AX, @DATA
    MOV DS, AX    
    
    ; FIRST PROMPT USER MSG
    
    LEA DX, MSG1
    MOV AH,9
    INT 21H
    
    ;INPUT HEX DIGIT
    
    MOV AH, 1
    INT 21H
    MOV BL,AL
    SUB BL,17D ;CONVERTING THE HEX CHARACTER IN DECIMAL
                    
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
    MOV AH,9
    INT 21H
    
    MOV DL,49D ;PRINTING "1" BEFORE BL
    MOV AH,2
    INT 21H
      
    ; PRINT THE CONVERTED VALUE THAT IS STORED IN BL  
      
    MOV DL,BL
    MOV AH,2
    INT 21H
      
    ;DOS RETURN
      
    MOV AH, 4CH
    INT 21H
    
    MAIN ENDP
END MAIN
    




