.ORG 0000H
          CORRECT:MOV P3,#0FFH
                  MOV 20H,#0FFH
                  MOV 21H,#0FFH
                  MOV 22H,#0FFH
                  MOV 23H,#0FFH
                  MOV 24H,#0FFH
                  MOV 25H,#0FFH
                  MOV 26H,#0FFH
                  MOV 27H,#0FFH
                  MOV 28H,#0FFH
                  MOV 29H,#0FFH
                  MOV 2AH,#0FFH
                  MOV 2BH,#0FFH
                  MOV 2CH,#0FFH
                  MOV 2DH,#0FFH
                  MOV 2EH,#0FFH
                  MOV 2FH,#0FFH
                  MOV R0,#20H
                  MOV A,#0FFH
                  
                  MOV A,#38H 
	            LCALL COMMAND
	            LCALL DELAY
	            MOV A,#01H
	            LCALL COMMAND
	            LCALL DELAY
	            MOV A,0EH
	            LCALL COMMAND
	            LCALL DELAY
	            MOV A,80H
	            LCALL COMMAND
           
           SWITCH:LCALL DELAY
                  MOV P1,#0
                  MOV P2,#0FFH
                  MOV A,P2
                  ANL A,#00001111B
                  CJNE A,#00001111B,SWITCH
                  MOV P3,#0FFH
             
                  OVER01:JB P3.6,K1   ;ENTER SWITCH
                  LJMP RCOMP
               
                  K1:CJNE R0,#32H,GO_TO
                  LCALL PASSWORD_EXCEED
                  LJMP LOOP0
            
            GO_TO:MOV A,P2
                  ANL A,#00001111B
                  CJNE A,#00001111B,OVER02
                  SJMP OVER01
       
           OVER02:LCALL KEY_BOARD
                  SJMP SWITCH
            
            RCOMP:MOV A,20H
                  CJNE A,#0EEH,WARNING        
                  MOV A,21H
                  CJNE A,#0EDH,WARNING
                  MOV A,22H 
                  CJNE A,#0EBH,WARNING
                  MOV A,23H
                  CJNE A,#0E7H,WARNING
                  MOV A,24H
                  CJNE A,#0FFH,WARNING
                  SJMP NEXT_STEP
          
          WARNING:CLR P3.4;RED LIGHT
            
            LOOP0:JB P3.5,LOOP0         
                  LJMP CORRECT
        
                            NEXT_STEP:LCALL SET_THE_PASSWORD
                                      LCALL DELAY
                                      LCALL DELAY
                                      LCALL DELAY
                                      LCALL DELAY
                                      MOV 50H,#0FFH
                                      MOV 51H,#0FFH
                                      MOV 52H,#0FFH
                                      MOV 53H,#0FFH
                                      MOV 54H,#0FFH
                                      MOV 55H,#0FFH
                                      MOV 56H,#0FFH
                                      MOV 57H,#0FFH
                                      MOV 58H,#0FFH
                                      MOV 59H,#0FFH
                                      MOV 5AH,#0FFH
                                      MOV 5BH,#0FFH
                                      MOV 5CH,#0FFH
                                      MOV 5DH,#0FFH
                                      MOV 5EH,#0FFH
                                      MOV 5FH,#0FFH        
                                      MOV P3,#0FFH
                                      MOV R0,#50H
                                      MOV A,#38H 
	                                LCALL COMMAND
	                                LCALL DELAY
	                                MOV A,#01H
	                                LCALL COMMAND
	                                LCALL DELAY
	                                MOV A,0EH
	                                LCALL COMMAND
	                                LCALL DELAY
	                                MOV A,80H
	                                LCALL COMMAND


                          SET_PASSWORD:LCALL DELAY
                                      MOV P1,#0
                                      MOV P2,#0FFH
                                      MOV A,P2
                                      ANL A,#00001111B
                                      CJNE A,#00001111B,SET_PASSWORD
                                      MOV P3,#0FFH
    
                               OVER11:JB P3.6,K11
                                      LJMP START
      
                                  K11:CJNE R0,#5FH,GO_TO1
                                      SJMP MESSAGE
   
                               GO_TO1:MOV A,P2
                                      ANL A,#00001111B
                                      CJNE A,#00001111B,OVER12
                                      SJMP OVER11
                
                               OVER12:LCALL KEY_BOARD
                                      SJMP SET_PASSWORD
                          
                              MESSAGE:CLR P3.2
                                      LCALL PASSWORD_EXCEED
                                      LCALL DELAY
                                      LCALL DELAY
                                      LCALL DELAY
                                      LCALL DELAY
                                      LJMP NEXT_STEP

   
                  START:MOV R4,#04H
                        MOV P3,#0FFH
    
                   HERE:JB P3.3,HERE1  ;ON SWITCH
                        SJMP AGAIN
                  HERE1:JB P3.1,HERE   ;RESET PASSWORD SWITCH
                        LJMP CORRECT                                            
                  AGAIN:MOV 20H,#0FFH
                        MOV 21H,#0FFH
                        MOV 22H,#0FFH
                        MOV 23H,#0FFH
                        MOV 24H,#0FFH
                        MOV 25H,#0FFH
                        MOV 26H,#0FFH
                        MOV 27H,#0FFH
                        MOV 28H,#0FFH
                        MOV 29H,#0FFH
                        MOV 2AH,#0FFH
                        MOV 2BH,#0FFH
                        MOV 2CH,#0FFH
                        MOV 2DH,#0FFH
                        MOV 2EH,#0FFH
                        MOV 2FH,#0FFH
                        MOV R0,#20H
                        MOV A,#0FFH
                        MOV A,#38H 
	                  LCALL COMMAND
	                  LCALL DELAY
	                  MOV A,#01H
	                  LCALL COMMAND
	                  LCALL DELAY
	                  MOV A,0EH
	                  LCALL COMMAND
	                  LCALL DELAY
	                  MOV A,80H
	                  LCALL COMMAND

               SWITCH11:LCALL DELAY
                        MOV P1,#0
                        MOV P2,#0FFH
                        MOV A,P2
                        ANL A,#00001111B
                        CJNE A,#00001111B,SWITCH11
                        MOV P3,#0FFH
    
                 OVER21:JB P3.6,K111
                        LJMP COMP
      
                   K111:CJNE R0,#32H,GO_TO11
                        LCALL PASSWORD_EXCEED
                        LJMP LOOP
  
                GO_TO11:MOV A,P2
                        ANL A,#00001111B
                        CJNE A,#00001111B,OVER22
                        SJMP OVER21
      
                 OVER22:LCALL KEY_BOARD
                        SJMP SWITCH11


                   COMP:MOV A,20H
                        CJNE A,50H,WARN
                        MOV A,21H
                        CJNE A,51H,WARN
                        MOV A,22H
                        CJNE A,52H,WARN                 
                        MOV A,23H
                        CJNE A,53H,WARN
                        MOV A,24H
                        CJNE A,54H,WARN
                        MOV A,25H
                        CJNE A,55H,WARN
                        MOV A,26H
                        CJNE A,56H,WARN
                        MOV A,27H
                        CJNE A,57H,WARN
                        MOV A,28H
                        CJNE A,58H,WARN
                        MOV A,29H
                        CJNE A,59H,WARN
                        MOV A,2AH
                        CJNE A,5AH,WARN
                        MOV A,2BH
                        CJNE A,5BH,WARN
                        MOV A,2CH
                        CJNE A,5CH,WARN
                        MOV A,2DH
                        CJNE A,5DH,WARN
                        MOV A,2EH
                        CJNE A,5EH,WARN
                        MOV A,2FH
                        CJNE A,5FH,WARN
         
                        CLR P3.0  ;GREEN LIGHT
                        LCALL WELCOME
                        LCALL DELAY
                        LCALL DELAY
                        LCALL DELAY
                        LCALL DELAY
                        LCALL DELAY
                        LCALL DELAY
                        LCALL DELAY
                        LJMP START
                   
                   WARN:DJNZ R4,YELLOW
                        SJMP LOOP   
  
                 YELLOW:CLR P3.2;YELLOW LIGHT
                        LCALL SHOW_WARNING
                        LCALL DELAY
                        LCALL DELAY
                        LCALL DELAY
                        LCALL DELAY
                        LCALL DELAY
                        LCALL DELAY
                        LCALL DELAY
        
                        SETB P3.2
                        LJMP AGAIN
   
                  LOOP1:JB P3.5,LOOP1
                        LJMP START       
  
                   LOOP:CLR P3.4
                        LCALL PROHIBITED
                        SJMP LOOP1



              KEY_BOARD:LCALL STAR
                        MOV P1,#11111110B
                        MOV A,P2
                        ANL A,#00001111B
                        CJNE A,#00001111B,ROW_0
                        MOV P1,#11111101B
                        MOV A,P2 
                        ANL A,#00001111B
                        CJNE A,#00001111B,ROW_1
                        MOV P1,#11111011B
                        MOV A,P2
                        ANL A,#00001111B
                        CJNE A,#00001111B,ROW_2
                        MOV P1,#11110111B
                        MOV A,P2
                        ANL A,#00001111B
                        CJNE A,#00001111B,ROW_3
                        RET 
        
  
                  ROW_0:ORL A,#11100000B
                        MOV @R0,A
                        INC R0
                        RET         
             
                  ROW_1:ORL A,#11010000B
                        MOV @R0,A
                        INC R0
                        RET         

                  ROW_2:ORL A,#10110000B
                        MOV @R0,A
                        INC R0
                        RET         
   
                  ROW_3:ORL A,#01110000B
                        MOV @R0,A
                        INC R0
                        RET
          
                   STAR:MOV A,#'*'  
	                LCALL DATA
                   	RET


       SET_THE_PASSWORD:MOV A,#38H
                   	LCALL COMMAND
	                  LCALL DELAY
	                  MOV A,#01H
	                  LCALL COMMAND
	                  LCALL DELAY
	                  MOV A,0EH 
	                  LCALL COMMAND
                     	LCALL DELAY
	                  MOV A,80H
	                  LCALL COMMAND
	                  LCALL DELAY
                        MOV A,#'S'
                   	LCALL DATA
	                  LCALL DELAY
                        MOV A,#'E'
	                  LCALL DATA
	                  LCALL DELAY
                        MOV A,#'T'
	                  LCALL DATA
	                  LCALL DELAY
                        MOV A,#' '
	                  LCALL DATA
	                  LCALL DELAY
	                  MOV A,#'P'
	                  LCALL DATA
	                  LCALL DELAY
	                  MOV A,#'A'
	                  LCALL DATA
	                  LCALL DELAY
	                  MOV A,#'S'
	                  LCALL DATA
	                  LCALL DELAY
	                  MOV A,#'S'
                     	LCALL DATA
	                  LCALL DELAY 
	                  MOV A,#'W'
                  	LCALL DATA
                      	LCALL DELAY
	                  MOV A,#'O'
	                  LCALL DATA 
                   	LCALL DELAY
                     	MOV A,#'R'

        PASSWORD_EXCEED:MOV A,#38H
	                  LCALL COMMAND
	                  LCALL DELAY
                   	MOV A,#01H
	                  LCALL COMMAND
	                  LCALL DELAY
	                  MOV A,#0EH
	                  LCALL COMMAND
	                  LCALL DELAY
	                  MOV A,#80H
	                  LCALL COMMAND
                     	LCALL DELAY
	                  MOV A,#'P'
                    	LCALL DATA
                    	LCALL DELAY
                     	MOV A,#'A'
                    	LCALL DATA
	                  LCALL DELAY
	                  MOV A,#'S' 
	                  LCALL DATA
	                  LCALL DELAY
	                  MOV A,#'S'
                    	LCALL DATA
	                  LCALL DELAY
	                  MOV A,#'W'
	                  LCALL DATA 
	                  LCALL DELAY
	                  MOV A,#'O'
	                  LCALL DATA
                   	LCALL DELAY
	                  MOV A,#'R'
	                  LCALL DATA 
	                  LCALL DELAY
	                  MOV A,#'D'
                    	LCALL DATA
	                  LCALL DELAY
                     	MOV A,#' '
	                  LCALL DATA
	                  LCALL DELAY
	                  MOV A,#'L'
	                  LCALL DATA
	                  LCALL DELAY
                      	MOV A,#'I'
	                  LCALL DATA
	                  LCALL DELAY
	                  MOV A,#'M'
	                  LCALL DATA
                    	LCALL DELAY
	                  MOV A,#'I'
	                  LCALL DATA
	                  LCALL DELAY
	                  MOV A,#'T'
                    	LCALL DATA
	                  LCALL DELAY
	                  MOV A,#' '
	                  LCALL DATA
	                  LCALL DELAY
	                  MOV A,#'E'
                  	LCALL DATA
                    	LCALL DELAY
	                  MOV A,#'X'
                     	LCALL DATA
	                  LCALL DELAY
                   	MOV A,#'C'
                   	LCALL DATA
	                  LCALL DELAY
                    	MOV A,#'E'
	                  LCALL DATA
                   	LCALL DELAY
                  	MOV A,#'E'	     
	                  LCALL DATA
                    	LCALL DELAY
                  	MOV A,#'D' 
	                  RET
	
                WELCOME:MOV A,#38H
	                  LCALL COMMAND
	                  LCALL DELAY
	                  MOV A,#01H
	                  LCALL COMMAND
                    	LCALL DELAY
	                  MOV A,#0EH
	                  LCALL COMMAND
	                  LCALL DELAY
	                  MOV A,#06H
	                  LCALL COMMAND
	                  LCALL DELAY
	                  MOV A,#80H
	                  LCALL DATA
	                  LCALL DELAY
                       	MOV A,#'W'
	                  LCALL DATA
                  	LCALL DELAY
                    	MOV A,#'E'
                      	LCALL DATA  
	                  LCALL DELAY
                    	MOV A,#'L'
                   	LCALL DATA
                   	LCALL DELAY
	                  MOV A,#'C'
                   	LCALL DATA
                   	LCALL DELAY
	                  MOV A,#'O'
                   	LCALL DATA
	                  LCALL DELAY
                     	MOV A,#'M'
	                  LCALL DATA
                   	LCALL DELAY
                     	MOV A,#'E'
                     	LCALL DATA
                   	LCALL DELAY
                      	MOV A,#01H
                	      LCALL COMMAND
                    	LCALL DELAY
                       	RET

           SHOW_WARNING:MOV A,#38H 
                        LCALL COMMAND
                        LCALL DELAY
                        MOV A,#01H
                        LCALL COMMAND
                        LCALL DELAY
                        MOV A,#0EH
                        LCALL COMMAND
                        LCALL DELAY
                        MOV A,#06H
                        LCALL COMMAND
                        LCALL DELAY
                        MOV A,#80H
                        LCALL COMMAND
                        LCALL DELAY
                        MOV A,#'W'
                        LCALL DATA
                        LCALL DELAY
                        MOV A,#'A'
                        LCALL DATA
                        LCALL DELAY
                        MOV A,#'R'
                        LCALL DATA
                        LCALL DELAY
                        MOV A,#'N'
                        LCALL DATA
                        LCALL DELAY
                        MOV A,#'I'
                        LCALL DATA
                        LCALL DELAY
                        MOV A,#'N' 
                        LCALL DATA
                        LCALL DELAY
                        MOV A,#'G'
                        LCALL DATA
                        LCALL DELAY
                        MOV A,#01H
                        LCALL COMMAND
                        LCALL DELAY
                        RET

             PROHIBITED:MOV A,#38H
                        LCALL COMMAND
                        LCALL DELAY
                        MOV A,#01H
                        LCALL COMMAND 
                        LCALL DELAY
                        MOV A,#0EH
                        LCALL COMMAND
                        LCALL DELAY
                        MOV A,#06H
                        LCALL COMMAND
                        LCALL DELAY
                        MOV A,#80H
                        LCALL COMMAND
                        LCALL DELAY
                        MOV A,#'P'
                        LCALL DATA
                        LCALL DELAY
                        MOV A,#'R'
                        LCALL DATA
                        LCALL DELAY
                        MOV A,#'O'
                        LCALL DATA
                        LCALL DELAY
                        MOV A,#'H'
                        LCALL DATA
                        LCALL DELAY
                        MOV A,#'I'
                        LCALL DATA
                        LCALL DELAY
                        MOV A,#'B'
                        LCALL DATA
                        LCALL DELAY
                        MOV A,#'I'
                        LCALL DATA
                        LCALL DELAY
                        MOV A,#'T'
                        LCALL DATA
                        LCALL DELAY
                        MOV A,#'E'
                        LCALL DATA
                        LCALL DELAY
                        MOV A,#'D'
                        LCALL DATA
                        LCALL DELAY
                        MOV A,#01H
                        LCALL COMMAND
                        LCALL DELAY
                        RET


                COMMAND:MOV P1,A
	                  CLR P2.4;RS
	                  CLR P2.5;RW
	                  SETB P2.6;CE
                   	CLR P2.6;CE
                    	RET


                   DATA:MOV P1,A
	                  SETB P2.4;RS HIGH
	                  CLR P2.5;RW LOW
	                  SETB P2.6; ENABLE HIGH
	                  CLR P2.6; ENABLE LOW
                       	RET

                  DELAY:MOV R7,#01H         
                    LX3:MOV R6,#05H         
                    LX2:MOV R5,#0AH         
                    LX1:DJNZ R5,LX1
                        DJNZ R6,LX2
                        DJNZ R7,LX3
                        RET         
                       .END

