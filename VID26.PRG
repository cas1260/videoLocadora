**********************************
*			 CADASTRO DE JOGOS		*
**********************************
SAVE SCREEN TO VTELA_JOGO
DO WHILE .T.
	@ 18,20 CLEAR TO 21,52
	@ 18,20 TO 21,52 DOUBLE
*	CENTRA(18,20,50,"[ F2 - PESQUISA ]")
	VJOGONOME = SPACE(20)
	VJOGOCOD  = SPACE(4)
	VNOMEJOGO = SPACE(20)
	@ 19,21 SAY "Codigo"
	@ 19,30 SAY "Descricao"
	@ 20,30 GET VJOGONOME
	CLEAR GETS
	@ 20,22 GET VJOGOCOD PICT "9999"
	READ
	IF LASTKEY() = 27
		EXIT
	ENDIF
	IF VJOGOCOD = SPACE(04)
		VJOGOCOD = MOSTRAJOGO()
		IF LASTKEY() = 27
			EXIT
		ENDIF
	ENDIF
	USE CJOGO INDEX CJOGOA
	VJOGOCOD = STRZERO(VAL(VJOGOCOD),4)
	SEEK VJOGOCOD
	VGRAVA = .T.
	IF !EOF()
		VGRAVA = .F.
		VNOMEJOGO = NOMEJOGO
	ENDIF
	@ 18,21 TO 18,50 DOUBLE
	@ 20,22 SAY VJOGOCOD
	@ 20,30 GET VNOMEJOGO PICT "@!"
	READ
	IF LASTKEY() = 27
		LOOP
	ENDIF
	IF VGRAVA = .T.
		APPEND BLANK
	ENDIF
	REPLACE CODJOGO WITH VJOGOCOD
	REPLACE NOMEJOGO WITH VNOMEJOGO
ENDDO
RESTORE SCREEN FROM VTELA_JOGO
RETURN