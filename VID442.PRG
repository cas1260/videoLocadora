***************************
* VID26.PRG TAXA DE JUROS *
*-*-*-*-*-*-*-*-*-*-*-*-*-*
SAVE SCREEN TO VTELA_JUROS
DO WHILE .T.
	USE CONFIG
	VJUROS = JUROS
	@ 15,35 CLEAR TO 20,70
	@ 15,35 TO 20,70 DOUBLE
	@ 16,36 SAY "( ) Juros do Sistema"
	@ 17,36 SAY "( ) Juros Personalizando"
	IF VSISTEMA = .T.
		VSIS = 1
	ELSE
		VSIS = 2
	ENDIF
	VJUROSA = JUROS
	@ 18,36 SAY "Taxa de Juros ao Dia " GET VJUROSA PICT "999"
	CLEAR GETS
	VMENU = MENU_O(15,2,37,CHR(7),VSIS)
	IF VMENU = 1
		VSISTEMA = .T.
	ELSEIF VMENU = 2
		VSISTEMA = .F.
		VJUROSA = JUROS
		@ 18,36 SAY "Taxa de Juros ao Dia " GET VJUROSA PICT "999"
		READ
		IF LASTKEY() = 27
			EXIT
		ENDIF
		VJUROS = VJUROSA
	ELSE
		EXIT
	ENDIF
	USE CONFIG 
	REPLACE SISTEMA WITH VSISTEMA
	REPLACE JUROS WITH VJUROS
	EXIT
ENDDO
RESTORE SCREEN FROM VTELA_JUROS
RETURN



