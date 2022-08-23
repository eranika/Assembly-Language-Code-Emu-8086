
  ; LAB WORK 8
  ; Write a program to take a 8 digit binary number as input 
  ; and output the corresponding Hexadecimal number.

  
  ; ROLL 1703176
  
  
  

.MODEL SMALL
.STACK 100H  

    .DATA
MSG1 DB 0AH, 0DH, 'Insert 8 digit binary value:  $'
MSG2 DB 0AH, 0DH, 'Corresponding HEX digit: $'


  .CODE
MAIN PROC 
    
   ;INITIALIZING PROMPT USER
 
    MOV AX,@DATA
    MOV DS,AX
                 
   ;FIRST PROMPT USER MSG 
    
     LEA DX, MSG1           
     MOV AH, 9
     INT 21H
     
     
     MOV BX, 0
     MOV CL, 1
 
    TOP: 
    
       MOV AH, 1            ; SET INPUT FUNCTION
       INT 21H              ; READ CHARACTER
       
       CMP AL, 0DH          ; CHECK IF AL = CR 
       JE ENDSS
     
       CMP AL, 30H          ; COMPARE IF AL = 0
       JNE ONE              ; IF NOT 0 GO TO ONE

    ZERO:
    
        SUB AL, 30H         ; SUBTRACT 30H
                           
        SHL BX, CL          ; LEFT SHIFT BX ONCE AS CL IS SET 1
        OR BL, AL            

      JMP TOP
        
    ONE:  
    
        CMP AL, 31H         ; COMPARE AL CONTAIN 1 OR NOT
        JNE MSG
                    
      JMP ZERO
                    
    ENDSS:  
 
        MOV AH, 2               
        MOV DL, 0AH             
        INT 21H                
        MOV DL, 0DH             
        INT 21H
     
        MOV CL, 1
        MOV CH, 0       
        
        
        
    ;SECOND PROMPT USER MSG
                
     LEA DX, MSG2             
     MOV AH, 9
     INT 21H
    
    OUTPUT:
    
        CMP CH, 4 
                   
        JE DONE           ; JUMP TO DONE IF CH = 4
        INC CH           
       
        MOV DL, BH        
        SHR DL, 4         ; RIGHT SHIFT DL 4 TIMES
       
        CMP DL, 0AH       ; CHECK IF DL < 10
        JL DIGIT          ; GO TO DIGIT
       
        ADD DL, 37H       ; ADD DL + 37H
        MOV AH, 2         
        INT 21H           ; PRINT DL 
        
        SHL BX, 4         ; SHIFT BX LEFT 4 TIMES
        JMP OUTPUT        
       
    DIGIT:
        ADD DL, 30H       ; ADD DL + 30H
        MOV AH, 2
        INT 21H           ; PRINT DL
        SHL BX, 4         ; SHIFT BX LEFT 4 TIMES
        JMP OUTPUT 
                        
    
    MSG:  
    
        JMP DONE                
         
    DONE:
    
    ; DOS RETURN 
     
    MOV AH, 4CH
    INT 21H
  MAIN ENDP
END MAIN




