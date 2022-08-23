
 ; LAB WORK 7
 ; Write a program that lets the user type some text, consisting of words separated by blanks, ending with a carriage return, and displays the text in the same word order as entered, but with the letters in each word reversed. For example, "this is a test" becomes "siht si a tset".

 
 ; ROLL 1703176
 


.MODEL SMALL
.STACK 100H

 .DATA
MSG1  DB 0AH, 0DH,  'Enter your words : $'
MSG2  DB 0AH,0DH, 'Reverse order : $'

COUNT DW  0

 .CODE
MAIN PROC
    
    ;INITIALIZING PROMPT USER
    
     MOV AX, @DATA              
     MOV DS, AX  
     
    ;FIRST PROMPT USER MSG
    
     LEA DX, MSG1           
     MOV AH, 9
     INT 21H

     XOR CX, CX                   ; CLEARING CX
     
     ;INPUT                    

     INPUT:
     
        MOV AH, 1                 ; SET INPUT FUNCION
        INT 21H                   ; READ CHARACTER

        CMP AL, 0DH                 ; COMPARE IF AL = CARRIAGE RETURN
        JE ENDSS                    ; JUMP TO ENDSS

        PUSH AX                     ; PUSH AX TO SACK
        INC CX                     
        JMP INPUT                   
        
        
     ENDSS:                        ; (FOR UNDERSTANDING)

        MOV BX, 42H                 ; BX = 42H, SP = F2 

        XCHG BX, SP                 ; BX = F2, SP = 42H (THIS IS AN SP ADDRESS NOW, 4F) 

        PUSH 0020H                  ; SP = 42H = 20H (SPACE)

        XCHG BX, SP                 ; SP = F2, (GOT BACK THE PREVIOUS ADDRESS), BX = 4F 
                                  
        INC COUNT                   
    
     LOOP_1:
                          
        POP DX                      ; DX = VALUE OF F2 (S, I.E.)

        XCHG BX, SP                 ; DX = S, BX = F4, SP = 4F (AS F2 POPPED)
        
        PUSH DX                     ; DX = S, BX = F4, SP = 4F

        XCHG BX, SP                 ; DX = S, BX = 4F, SP = F4 
                                  ; (THIS WAY THE REST CHARACTERS WILL BE STORED IN NEW ADDRESS AND WE WILL DO POP DX, SWAP BX AND SP)
                     
        INC COUNT
                       
     LOOP LOOP_1                 
                
                
     ;SECOND PROMPT USER MSG
                
     LEA DX, MSG2             
     MOV AH, 9
     INT 21H

     MOV CX, COUNT                
     MOV COUNT, 0                 
 
     PUSH 0020H                   ; PUSH 0020H IN STACK
     INC COUNT                    

     OUTPUT:
                          
        XCHG BX, SP                 ; BX = FE, SP = 2A (EXAMPLE)

        POP DX                      ; DX  54H. BX = FE, SP = 2C (AS POPPED)

        XCHG BX, SP                 ; SP = FE, BX = 2C, DX = 54H

        CMP DL, 20H                 ; 20H = SPACE , THEN THE REST
                       
        JNE SKIP_PRINT         

        MOV AH, 2                 

     LOOP_2:
                         
        POP DX                    
        INT 21H                 

        DEC COUNT
                         
        JNZ LOOP_2                

        MOV DX, 0020H          

     SKIP_PRINT:         

        PUSH DX                    
        INC COUNT
                       
        LOOP OUTPUT                
        
        
     ;DOS RETURN
        
     MOV AH, 4CH                  
     INT 21H
   MAIN ENDP
 END MAIN







