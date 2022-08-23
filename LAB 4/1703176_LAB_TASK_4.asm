
;LAB WORK 4
;ROLL 1703176
                             
.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB 0AH,0DH, 'Enter a hex digit: $'
MSG2 DB 0AH,0DH, 'In decimal it is: $'  
MSG3 DB ' is an odd number $'
MSG4 DB ' is an even number $'
MSG5 DB ' is an illegal character $'



.CODE   
MAIN PROC   
    
    AGAIN:
    
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
    
    CMP BL, 57D  ; COMPARING BL WITH ASCII OF 9
    JLE DIG      ; LESS OR EQUAL
    JG  IS       ; GREATER
    
    ;INVALID CHECK
    
      ;IS HEX?
    
      IS:
    
      CMP BL, 70D ; CHECK IF INPUT > F
      JG INV
      JLE HEX
     
     
      INV:
                
      ;LINE FEED                
                    
      MOV DL,0AH
      MOV AH,2
      INT 21H
              
      ;CARRIAGE RETURN          
              
      MOV DL,0DH
      MOV AH,2
      INT 21H
    
      
    
      ;PRINT    
    
      
      MOV DL, 0AH    
      INT 21H        
      MOV DL ,0DH    
      INT 21H
        
       
      MOV DL, BL
      MOV AH,2 
      INT 21H 
                
                
        
      MOV AX, @DATA
      MOV DS, AX
      MOV AH, 9
      LEA DX, MSG5
      INT 21H
      MOV AH, 2
            
      MOV DL, 0AH    
      INT 21H        
      MOV DL ,0DH    
      INT 21H  
      JMP AGAIN
    
    HEX:
    SUB BL,17D ;CONVERTING THE HEX CHARACTER IN DECIMAL
                    
    ;LINE FEED                
                    
    MOV DL,0AH
    MOV AH,2
    INT 21H
              
    ;CARRIAGE RETURN          
              
    MOV DL,0DH
    MOV AH,2
    INT 21H
    
    ;SECOND PROMPT USER MSG2
    
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
    
    ;LINE FEED                
                    
    MOV DL,0AH
    MOV AH,2
    INT 21H
              
    ;CARRIAGE RETURN   
    
         
    MOV DL,0DH
    MOV AH,2
    INT 21H
    
    MOV DL, 0AH    
    INT 21H        
    MOV DL ,0DH    
    INT 21H
    
    MOV DL,49D ;PRINTING "1" BEFORE BL
    MOV AH,2
    INT 21H  
    
    MOV DL, BL
    MOV AH,2 
    INT 21H 
      
    
    ;EVEN ODD
        
    TEST BL, 1   ;A CHECK TO EVEN ODD
    JNE ODDD
    
    MOV AX, @DATA
    MOV DS, AX
    MOV AH, 9
    LEA DX, MSG4
    INT 21H 
    JMP EXIT
        
    ODDD:
   
    MOV AX, @DATA
    MOV DS, AX
    MOV AH, 9
    LEA DX, MSG3
    INT 21H
    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    JMP AGAIN 
            
      
    
    DIG:            
    SUB BL, 0D
                    
    ;LINE FEED                
                    
    MOV DL,0AH
    MOV AH,2
    INT 21H
              
    ;CARRIAGE RETURN          
              
    MOV DL,0DH
    MOV AH,2
    INT 21H
    
    ;SECOND PROMPT USER MSG2
    
    LEA DX, MSG2
    MOV AH,9
    INT 21H
    
   ;PRINTS THE CONVERTED NUMBER
        
    MOV AH, 2
    MOV DL, BL
    INT 21H    
    
    ;LINE FEED                
                    
    MOV DL,0AH
    MOV AH,2
    INT 21H
              
    ;CARRIAGE RETURN   
    
           
    MOV DL,0DH
    MOV AH,2
    INT 21H  
    
    MOV DL, 0AH    
    INT 21H        
    MOV DL ,0DH    
    INT 21H
    
      
    MOV DL, BL
    MOV AH,2 
    INT 21H 
      
    
    ;EVEN ODD
        
    TEST BL, 1   ;A CHECK TO EVEN ODD
    JNE ODD
    
    MOV AX, @DATA
    MOV DS, AX
    MOV AH, 9
    LEA DX, MSG4
    INT 21H 
    JMP EXIT
        
    ODD:
   
    MOV AX, @DATA
    MOV DS, AX
    MOV AH, 9
    LEA DX, MSG3
    INT 21H
    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    JMP AGAIN 
            
      
    
    
  
    
    
     
    
  
    EXIT:  
    ;DOS RETURN
      
    MOV AH, 4CH
    INT 21H
    
    MAIN ENDP
END MAIN
    




