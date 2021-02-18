******************************************************
* VID17.PRG VISUALIZAÄ«O DE CONTAS A PAGAR E RECEBER *
******************************************************
SAVE SCREEN TO V_CONTAS
PRIVATE VCAMPOS[7],VCAB[7],VCOND
IF !FILE("DBF.DBF")
	COPY FILE("PAGAR.DBF") TO DBF.DBF
ENDIF
DO WHILE .T.
	IF VCONT_CONT_V = "N"
		NAO()
		EXIT
	ENDIF
	USE DBF
	ZAP
	@ 05,01 CLEAR TO 23,73
	VCAMPOS[1] = "NOME"
	VCAMPOS[2] = "COD"
	VCAMPOS[3] = "VALOR"
	VCAMPOS[4] = "TIPODOC"
	VCAMPOS[5] = "DATAE"
	VCAMPOS[6] = "DATA" 
	VCAMPOS[7] = "SIMNAO" 

	VCAB[1] = ""
	VCAB[2] = ""
	VCAB[3] = ""
	VCAB[4] = ""
	VCAB[5] = ""
	VCAB[6] = ""
	VCAB[7] = ""

*	@ 06,10 CLEAR TO 16,75
	@ 08,00 TO 24,78 DOUBLE
	@ 08,00 SAY "Ã"
	@ 08,78 SAY "π"
	KEYBOARD CHR(13)
	DBEDIT(10,01,23,77,VCAMPOS,0,0,VCAB)
	VDATA1 = DATE()
	VDATA2 = DATE()
	@ 06,05 SAY "Data Inicial " GET VDATA1
	@ 07,05 SAY "Data Final   " GET VDATA2
	@ 06,35 SAY "( ) A Pagar"
	@ 07,35 SAY "( ) A Receber"	
	READ
	IF LASTKEY() = 27
		EXIT
	ENDIF
	VOPCAOPESQ = MENU_O(06,2,36,CHR(7),0)
	IF LASTKEY() # 27
		CLOSE ALL
		VCOND = "VDATA1<=DATA .AND. VDATA2>=DATA"
		IF VOPCAOPESQ = 1
			USE PAGAR INDEX PAGAR1
			VTEXTO = "A Pagar"
		ELSEIF VOPCAOPESQ = 2
			USE RECEBER INDEX RECEBER1
			VTEXTO = "A Receber"
		ENDIF
		COPY TO DBF FOR &VCOND 
		USE DBF
		IF LASTREC()=0
			MSGBOX("N∆o a Contas " + VTEXTO)
			LOOP
		ELSE
			USE DBF
			VCAMPOS[1] = "NOME"
			VCAMPOS[2] = "COD"
			VCAMPOS[3] = "VALOR"
			VCAMPOS[4] = "TIPODOC"
			VCAMPOS[5] = "DATAE"
			VCAMPOS[6] = "DATA" 
			VCAMPOS[7] = "SIMNAO"
			IF VOPCAOPESQ = 1
				VCAB[1] = "Pagar para:"
			ELSEIF VOPCAOPESQ = 2
				VCAB[1] = "Receber de :"
			ENDIF		
			VCAB[2] = "Codigo"
			VCAB[3] = "Valor"
			VCAB[4] = "Motivo"
			VCAB[5] = "Data de Emis∆o"
			IF VOPCAOPESQ = 1
				VCAB[6] = "Data do Pagamento"
				VCAB[7] = "Pagou"
			ELSEIF VOPCAOPESQ = 2
				VCAB[6] = "Data de Receber"
				VCAB[7] = "Recebeu"
			ENDIF
			DO WHILE LASTKEY()#27
				USE DBF
				GO TOP
				VP_SIM = 0
				VR_SIM = 0
				DO WHILE !EOF()
					IF PAGAR = .T.
						VP_SIM = VP_SIM + VALOR
					ELSE
						VR_SIM = VR_SIM + VALOR
					ENDIF
					SKIP
				ENDDO
				GO TOP
				@ 24,01 TO 24,77 DOUBLE
				IF VOPCAOPESQ = 1
					CENTRA(24,02,76,"[ A Pagar " + STR(VR_SIM) + "    Pago    " + STR(VP_SIM) + " Total " + STR(VR_SIM + VP_SIM) + " ]")
				ELSEIF VOPCAOPESQ = 2
					CENTRA(24,02,76,"[ A Receber " + STR(VR_SIM) + "   Recebido    " + STR(VP_SIM) + " Total " + STR(VR_SIM + VP_SIM) + " ]")
				ENDIF
				DBEDIT(9,01,23,77,VCAMPOS,0,0,VCAB)
				IF LASTKEY() = 27
					LOOP
				ENDIF
				IF PAGAR = .T.
					MSGBOX("Esta Contas J† foi Paga")
				ELSE
					IF VOPCAOPESQ = 1
						VSIMNAO = SIMNAO(20,35,"Vocà J† Pagou ?",.F.) 
					ELSEIF VOPCAOPESQ = 2
						VSIMNAO = SIMNAO(20,35,"Vocà J† Recebeu ?",.F.) 
					ENDIF
					IF LASTKEY() = 27
						LOOP
					ENDIF
					IF VSIMNAO = 1
						VCOD = COD
						REPLACE PAGAR WITH .T.
						REPLACE SIMNAO WITH "SIM"
						IF VOPCAOPESQ = 1
							USE PAGAR INDEX PAGAR1
						ELSEIF VOPCAOPESQ = 2
							USE RECEBER INDEX RECEBER1
						ENDIF				
						SEEK VCOD
						IF EOF()
							MSGBOX("Esta Contas e Imposivel " + RIGHT(VTEXTO,LEN(VTEXTO)-2))
						ELSE
							REPLACE PAGAR WITH .T.
							REPLACE SIMNAO WITH "SIM"
						ENDIF
					ENDIF
				ENDIF
			ENDDO
		ENDIF
	ENDIF
ENDDO
RESTORE SCREEN FROM V_CONTAS
RETURN