****************************************
*		BACK-UP DO SYSTEMA VID42.PRG		*
****************************************
SAVE SCREEN TO VTELA_BACK_UP
DO WHILE .T.
	@ 11,25 CLEAR TO 17,50
	@ 11,25 TO 17,50 DOUBLE
	CENTRA(11,25,50,"[ Back-Up ]")
	@ 12,26 SAY "( ) Salvar"
	@ 13,26 say "( ) Restaurar"
	@ 15,27 SAY "   OK   "
	@ 15,38 SAY "Cancelar"
	VB = MENU_O(12,2,27,CHR(7),0)
	IF LASTKEY() = 27
		EXIT
	ENDIF
	@ 11 + VB,27 SAY CHR(7)
	@ 15,27 PROMPT "   OK   "
	@ 15,38 PROMPT "Cancelar"
	MENU TO VB1
	IF VB1 = 1
		IF VB = 1
			VRUN = "ARJ A -VVA A:\TOP *.* /Y"
		ELSEIF VB = 2
			VRUN = "ARJ E -VVA A:\TOP *.* /Y"
		ENDIF
		SAVE SCREEN TO VTELA_B
		IF FILE("ARJ.EXE")
			VCOLOR = SETCOLOR()
			SET COLOR TO 
				CLOSE ALL
				CLEAR
				IF VB = 1
					SWPRUNCMD("DEL *.NTX",0,0)
				ENDIF
				ERASE("A:\TOP.ARJ")

				SWPRUNCMD(VRUN,0,"","")				
				IF VB = 1
					COPY FILE("ARJ.EXE") TO A:\ARJ.EXE
					INDEX_BANCO("T")
				ENDIF
			SET COLOR TO &VCOLOR
		ELSE
			MSGBOX("Impossivel Criar a Copia,")
		ENDIF
	ENDIF
	EXIT
ENDDO
RESTORE SCREEN FROM VTELA_BACK_UP
RETURN