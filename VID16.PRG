*****************************************
*                                       *
* LOC14.PRG - FINALIZA JOGO             *
*                                       *
*****************************************
SAVE SCREEN TO VTELA 

SELE 2
USE JOGOFIM INDEX JOGOFIM ALIAS JOGOFIM

SELE 1
USE JOGO ALIAS JOGO
VMOSTRA=.F.
Y=0

SET CURSOR ON

DO WHILE LASTKEY()#27

	SAI=.F.
	GO TOP

	@ 05,05 CLEAR TO 19,77	

	IF VMOSTRA=.F. .AND. LASTKEY()#27
		VMOSTRA=.T.
		@ 10,05 SAY "MAQUINA  INICIO     FIM       OPCAO   TEMPO          VALOR     Pago" 
		@ 11,05 SAY "様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�"
		LINHA=13
		VOPCAO=OPCAO
*		VTEMPO=TEMPO(VOPCAO)			
		DO WHILE .NOT. EOF()  .AND. LASTKEY()#27
			@ LINHA,05 SAY MAQUINA
			@ LINHA,15 SAY INICIO
			@ LINHA,25 SAY TEMPOINV(OPCAO,INICIO)
         @ LINHA,36 SAY OPCAO
			@ LINHA,42 SAY VTEMPO1(OPCAO)
			@ LINHA,55 SAY VALOR
			@ LINHA,68 SAY NV
			SKIP
			LINHA=LINHA+2
		ENDDO
			
	ENDIF

	SELE 1
	GO TOP

	DO WHILE LASTKEY()#27

		SET CURSOR OFF

		IF INKEY()=27
			EXIT
		ENDIF
   	
	   @ 06,10 TO 08,40 DOUBLE
		@ 07,15 SAY "HORA CERTA..: " 
		@ 07,29 SAY TIME()

		VINICIO=TEMPO(INICIO)
		VFIM=TEMPO(TIME())
		VOPCAO=OPCAO
		VDATA=DATA
		VV = VALOR	
		IF LASTKEY()#27
	
		DO CASE
			CASE VOPCAO="1" .AND. ((VFIM-VINICIO)>=3600) .AND. LASTKEY()#27
				VSAI=.T.
				VTEMPO="1 HORA"
			CASE VOPCAO="2" .AND. ((VFIM-VINICIO)>=1800) .AND. VDATA=DATE() .AND. LASTKEY()#27
				VSAI=.T.
				VTEMPO="MEIA HORA"
			CASE VOPCAO="3" .AND. ((VFIM-VINICIO)>=1200) .AND. VDATA=DATE() .AND. LASTKEY()#27
				VSAI=.T.
				VTEMPO="20 MINUTOS"
			CASE VOPCAO="4" .AND. ((VFIM-VINICIO)>=900) .AND. VDATA=DATE() .AND. LASTKEY()#27
				VSAI=.T.				
				VTEMPO="15 MINUTOS"
			CASE VOPCAO="5" .AND. ((VFIM-VINICIO)>=600) .AND. VDATA=DATE() .AND. LASTKEY()#27
				VSAI=.T.
				VTEMPO="10 MINUTOS"
			CASE VOPCAO="6" .AND. ((VFIM-VINICIO)>=5400) .AND. VDATA=DATE() .AND. LASTKEY()#27
				VSAI=.T.
				VTEMPO="1 HORA E MEIA"				
		ENDCASE

		ENDIF

		IF VSAI
			EXIT
		ENDIF
		
		SKIP
	
		IF EOF()
			GO TOP
		ENDIF				

	ENDDO
	
	IF LASTKEY()#27 .AND. VSAI

		VMAQ=MAQUINA
		VINICIO=INICIO
		VOPCAO=OPCAO

		XX=55

		@ 05,03 CLEAR TO 20,77
		VCOR = SETCOLOR()
		VCORES = "W+*/" + PCOLOR1
		SET COLOR TO  &VCORES
		@ 05,07 SAY "栩栩栩�    栩  栩�       栩�      栩栩�   栩栩�    栩栩桀    栩栩� "
		@ 06,07 SAY "栩         栩  栩栩     栩栩         栩  栩   栩  栩        栩   栩"
		@ 07,07 SAY "栩         栩  栩 栩   栩 栩         栩  栩   栩  栩        栩   栩"
		@ 08,07 SAY "栩栩栩�    栩  栩  栩栩�  栩         栩  栩   栩  栩 栩桀   栩   栩"
		@ 09,07 SAY "栩         栩  栩   栩�   栩         栩  栩   栩  栩   栩   栩   栩"
		@ 10,07 SAY "栩         栩  栩         栩   栩   栩   栩   栩  栩   栩   栩   栩"
		@ 11,07 SAY "栩         栩  栩         栩     栩栩�    栩栩�    栩栩�     栩栩"
		
		@ 13,07 SAY "栩�       栩�      栩       栩栩�"
		@ 14,07 SAY "栩栩     栩栩     栩栩     栩   栩"
		@ 15,07 SAY "栩 栩   栩 栩    栩  栩    栩   栩"
		@ 16,07 SAY "栩  栩 栩  栩    栩  栩    栩   栩"
		@ 17,07 SAY "栩   栩�   栩   栩栩栩栩   栩 � 栩"
		@ 18,07 SAY "栩         栩  栩      栩  栩 栩栩 栩�"
		@ 19,07 SAY "栩         栩  栩      栩   栩栩�  栩�"



		DO CASE
			CASE VMAQ="1" 
				 @ 14,XX SAY " 樂"
				 @ 15,XX SAY "栩�"
				 @ 16,XX SAY " 栩"
				 @ 17,XX SAY " 栩"
				 @ 18,XX SAY " 栩"
				 @ 19,XX SAY "栩栩"
	
			CASE VMAQ="2"
			    @ 14,XX SAY "樂栩桀"
				 @ 15,XX SAY "栩   �"
				 @ 16,XX SAY "    栩"
				 @ 17,XX SAY "   栩"
				 @ 18,XX SAY " 樂�"
             @ 19,XX SAY "栩栩栩" 
			CASE VMAQ="3" 
			    @ 14,XX SAY "栩栩桀"
				 @ 15,XX SAY "    栩" 				 
				 @ 16,XX SAY " 栩栩"
				 @ 17,XX SAY "    栩"
				 @ 18,XX SAY "    栩"
				 @ 19,XX SAY "栩栩�"
			CASE VMAQ="4"
				 @ 14,XX SAY "   栩栩"
				 @ 15,XX SAY "  栩 栩"				  
				 @ 16,XX SAY " 樂  栩"
				 @ 17,XX SAY "栩栩栩�:"
				 @ 18,XX SAY "     栩"
				 @ 19,XX SAY "     栩"
				 
		ENDCASE
		SET COLOR TO &VCOR
		INKEY(0)

		DO WHILE INKEY()#0
			TONE(800,11)
			TONE(900,15)
			TONE(700,10)			
		ENDDO

	ENDIF

	IF VSAI

		VSAI=.F.
				  
		@ 05,03 CLEAR TO 19,77
	
		VMAQ=MAQUINA
		VJOGO=JOGO
		VINICIO=INICIO
		VOPCAO=OPCAO
		VFIM=SPACE(1)
		VPAGO=PAGO
	
		@ 07,50 SAY "OPCOES DE JOGO" 
		@ 08,50 SAY "==============" 
		@ 10,50 SAY "1 = 1 hora    " 
		@ 11,50 SAY "2 = meia hora "  
		@ 12,50 SAY "3 = 20 minutos"
		@ 13,50 SAY "4 = 15 minutos"
		@ 14,50 SAY "5 = 10 minutos"
		@ 15,50 SAY "6 = 1 hora e meia"
*		@ 16,50 SAY "7 = 2 horas"
*		@ 17,50 SAY "8 = 40 minutos"					
*		@ 18,50 SAY "9 = 50 minutos"						
	
		SET CURSOR ON
	
		@ 09,10 SAY "MAQUINA: "+VMAQ
		@ 11,10 SAY "INICIO.: "+VINICIO
		@ 13,10 SAY "OPCAO..: "+VOPCAO
		@ 15,10 SAY "JOGO...: "+VJOGO
		IF VPAGO = "S"
			@ 17,10 SAY "PAGO...:   SIM"
		ELSE
			@ 17,10 SAY "PAGO...: " GET VPAGO PICTURE "!" VALID VPAGO$"SN"
		ENDIF
		@ 19,10 SAY "FIM....: " GET VFIM PICTURE "!"  VALID VFIM$"SN"
		READ
	
		IF LASTKEY()#27 .AND. VFIM = "S"
			SELE 2
			APPE BLANK

			REPLACE JOGO WITH VJOGO 
			REPLACE MAQUINA WITH VMAQ
			REPLACE INICIO WITH VINICIO
			REPLACE OPCAO WITH VOPCAO 
			REPLACE DATA WITH DATE() 
			REPLACE FIM WITH VFIM 
			REPLACE PAGO WITH VPAGO
			REPLACE VALOR WITH VV
		   SAVE SCREEN
			MSGBOX("Fim de jogo")
*			DO ESPERA 
			RESTORE SCREEN
			SELE 1
			DELE
			PACK
			VMOSTRA=.F.
		ENDIF

	ENDIF

	SELE 1
	IF EOF()
		EXIT
	ENDIF
	
ENDDO

CLOSE DATABASES

RESTORE SCREEN FROM VTELA

SET CURSOR ON

RETURN
	
