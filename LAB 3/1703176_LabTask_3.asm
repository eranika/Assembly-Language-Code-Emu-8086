
.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB 0AH,0DH, 'Enter three numbers: $'
MSG2 DB 0AH,0DH, 'The largest number: $'

.CODE   
MAIN PROC
    
    ;INITIALIZING PROMPT USER
    
    MOV AX, @DATA
    MOV DS, AX    
    
    ; FIRST PROMPT USER MSG
    
    LEA DX, MSG1
    MOV AH,9
    INT 21H
    
    ;INPUT
    
    MOV AH, 1
    INT 21H
    MOV BL, AL
    
    MOV DL, ' '
    MOV AH, 2
    INT 21H
    
    MOV AH, 1
    INT 21H
    MOV BH, AL
    
    MOV DL, ' '
    MOV AH, 2
    INT 21H
           
    MOV AH, 1       
    INT 21H
    MOV CL, AL
    
    CMP BL, BH
    JGE A
    
    B:
    CMP BH, CL
    JGE C
        
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
        
    MOV AH, 2
    MOV DL, CL
    INT 21H
    JMP EXIT
    
    C:     
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
    
    MOV AH, 2
    MOV DL, BH
    INT 21H
    JMP EXIT
    
    A:
    CMP BL, CL
    JGE D
           
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
           
    MOV AH, 2
    MOV DL, CL
    INT 21H
    JMP EXIT
    
    D:     
    
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
    
    MOV AH, 2
    MOV DL, BL
    INT 21H
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
    