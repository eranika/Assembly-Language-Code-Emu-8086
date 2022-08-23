
.MODEL SMALL
.STACK 100H
.DATA 
A DB 0AH,0DH, 'ENTER THREE INITIALS: $'

   .CODE
   MAIN PROC  
    
    MOV AX, @DATA
    MOV DS, AX
    
    LEA DX, A
    MOV AH,9
    INT 21H
    
    MOV DL,0DH
    MOV AH,2
    INT 21H
    
    MOV DL, 0AH
    MOV AH, 2
    INT 21H
     
    ;CHAR 1
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    ADD BL,20H
    
    MOV AH,2
    MOV DL,BL
    INT 21H
     
    MOV DL,0DH
    MOV AH,2
    INT 21H
    
    MOV DL, 0AH
    MOV AH, 2
    INT 21H
     
    ;CHAR 2          
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    ADD BL,20H
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    MOV DL,0DH
    MOV AH,2
    INT 21H
    
    MOV DL, 0AH
    MOV AH, 2
    INT 21H
     
    ;CHAR 3
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    ADD BL,20H
    
    MOV AH,2
    MOV DL,BL
    INT 21H  
    
    
    MOV DL,0DH
    MOV AH,2
    INT 21H
    
    MOV DL, 0AH
    MOV AH, 2
    INT 21H
    

    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN




