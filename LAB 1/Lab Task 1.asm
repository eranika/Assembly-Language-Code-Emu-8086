
.MODEL SMALL
.STACK 100H  
.DATA

.CODE
MAIN PROC  
      
    MOV AH, 2
    MOV DL, '?'
    INT 21H
    
    ;CR/LF PRINT
    
    MOV DL, 0DH 
    MOV AH, 2
    INT 21H
    
    MOV DL, 0AH
    INT 21H
    
    MOV DL, BL
    INT 21H
    
    ;PRINT 'VALUE 1: '
    
    MOV AH,1
    INT 21H
    SUB AL,48
    MOV BL,AL
    
    MOV DL,0DH
    MOV AH,2
    INT 21H
    
    MOV DL, 0AH
    MOV AH, 2
    INT 21H
    
    ;PRINT 'VALUE 2: '
    
     MOV AH,1
    INT 21H  
    
    SUB AL,48
    
    ADD BL,AL ;BL=BL+AL
    ADD BL,48
    
    MOV DL,0DH
    MOV AH,2
    INT 21H
    
    MOV DL, 0AH
    MOV AH, 2
    INT 21H
    
    ;PRINT 'SUM: '
    
    MOV DL,BL
    
    MOV AH,2
    INT 21H
    
    
    
    
    ;DOS RETURN
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
    
    