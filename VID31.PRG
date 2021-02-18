*******************************
* LOC34 - PESQUISA POR CLASSE *
*******************************
PRIVATE VTELA,VCAMPOS[5],VCAB[5],VCOND,VCOND1,VCOND2
SAVE SCREEN TO VTELA
DO WHILE .T.
	@ 05,03 CLEAR TO 23,77
	VCHAVE=SPACE(40)
	@ 10,10 SAY "Informe Cliente: " GET VCHAVE PICTURE "@!" 
	READ
	IF LASTKEY() = 27
		EXIT
	ENDIF
	IF LASTKEY()#27 .AND. VCHAVE<>SPACE(40)
	   VCOND = "(NOME = ALLTRIM(VCHAVE) .OR. (' '+ALLTRIM(VCHAVE)+' ')$(' '+ALLTRIM(NOME)+' '))"
      VCOND1 = "(DEP1 = ALLTRIM(VCHAVE) .OR. (' '+ALLTRIM(VCHAVE)+' ')$(' '+ALLTRIM(DEP1)+' '))"		
      VCOND2 = "(DEP2 = ALLTRIM(VCHAVE) .OR. (' '+ALLTRIM(VCHAVE)+' ')$(' '+ALLTRIM(DEP2)+' '))"				
		BOX("Aguarde um Momento, Por Favor")	
		USE CLIENTE INDEX CLIENTEB INDEX CLIENTEA
		GO TOP
		COPY TO VIDTEMP FOR &VCOND .OR. &VCOND1 .OR. &VCOND2
		USE VIDTEMP
		IF EOF()
			MSGBOX("Cliente nao encontrado")
		ELSE
			VCAMPOS[1] = "NOME"
			VCAMPOS[2] = "CODCLI"
			VCAMPOS[3] = "DEP1"
			VCAMPOS[4] = "DEP2"
	
			VCAB[1] = "Nome"
			VCAB[2] = "Codigo" 
			VCAB[3] = "Dependente 1"
			VCAB[4] = "Dependente 2"	
			@ 05,03 to 19,76 DOUBLE
			VTOTALCLIENTE = LASTREC()
			CENTRA(19,4,75,"[ Total de Cliente " + STRZERO(VTOTALCLIENTE) + " ] ")
			DBEDIT(6,4,18,75,VCAMPOS,0,0,VCAB)
			IF LASTKEY() = 27
				EXIT
			ENDIF
			IF SIMNAO(18,30,"Deseja Imprimir ?",.F.) = 1
				GO TOP
				DO T_PRINT
				IF LASTKEY()#27
					SET DEVICE TO PRINT
*					SET PRINTER TO VIDEO
					X = 4
					CENTRA(00,00,60,VCABE1)
					CENTRA(01,00,60,VCABE2)
					CENTRA(02,00,60,VCABE3)
					DO WHILE !EOF()
						@ X,00 SAY NOME + " " + CODCLI  PICT "@!"
						X = X + 1
						@ X,00 SAY DEP1
						X = X + 1
						@ X,00 SAY DEP2
						X = X + 1
						@ X,00 SAY REPLICATE("=",60)
						X = X + 1
						SKIP
					ENDDO
					X = X + 1 
					CENTRA(X,00,60,VRODA1)
					X = X + 1
					CENTRA(X,00,60,VRODA2)
					X = X + 1
					CENTRA(X,00,60,VRODA3)
					@ X+33,00 SAY ""
				ENDIF
				SET DEVICE TO SCREEN 
			ENDIF
		ENDIF	
	ENDIF
ENDDO

RESTORE SCREEN FROM VTELA

CLOSE DATABASES

RETURN