***********************************
* VID3A.PRG - CLIENTES EM ATRASO  *
************************************
PRIVATE VTELA,VCAMPOS[7],VCAB[7],VCOND
SAVE SCREEN TO VTELA

DO WHILE LASTKEY()#27

	@ 05,03 CLEAR TO 23,77
	
	VCHAVE=DATE()
	
	@ 10,10 SAY "Informe data: " GET VCHAVE PICTURE "@!" 
	READ
	
	IF LASTKEY()#27
	
      VCOND = "DEVOLUCAO<VCHAVE"
		
		BOX("Agaurde um Momento !")
		
		IF .NOT. EMPTY(VCHAVE)
			USE LOCACAO INDEX LOCACAOD
			COPY TO LOCTEMP FOR &VCOND 
			USE LOCTEMP
			IF EOF()
				MSGBOX("Nenhum cliente em atraso")
				USE
				EXIT
			ENDIF
				
		ENDIF	

		VCAMPOS[1] = "NOME"
		VCAMPOS[2] = "CODIGO"
		VCAMPOS[3] = "VALOR"
		VCAMPOS[4] = "DTLOC"
		VCAMPOS[5] = "DEVOLUCAO"		
		VCAMPOS[6] = "ALLTRIM(STR(VCHAVE-DEVOLUCAO))+' DIAS'"
		VCAMPOS[7] = "LANCA"
		
		VCAB[1] = "Nome"
		VCAB[2] = "Codigo" 
		VCAB[3] = "Valor"
		VCAB[4] = "Dt.locacao"	
		VCAB[5] = "Dt.devolucao"
		VCAB[6] = "dias atraso"
		VCAB[7] = "lancamento"			
		
		@ 05,03 TO 23,76 DOUBLE
		CENTRA(23,03,75,"[ " + STRZERO(LASTREC(),7) +" ]")
		DBEDIT(06,4,22,75,VCAMPOS,0,0,VCAB)
		IF LASTKEY() = 27
			LOOP
		ENDIF
		IF SIMNAO(19,37,"Deseeja Imprimir?",.F.) = 1
			T_PRINT()			
			IF LASTKEY()#27
				BOX("Imprimido...")
				R = LASTREC()
				PRIVATE VCODCLI[R],VDIAS[R],VVALOR[R],	VDTLOC[R],VLANCA[R],VD[R]		
				GO TOP
				Z=1
				DO WHILE !EOF()
					VCODCLI[Z] = CODIGO
					VDIAS[Z] = ALLTRIM(STR(VCHAVE-DEVOLUCAO))+" DIAS"
					VVALOR[Z] = VALOR
					VDTLOC[Z] = DTLOC
					VLANCA[Z] = LANCA
					VD[Z] = DEVOLUCAO
					Z=Z+1
					SKIP
				ENDDO
				SET DEVICE TO PRINT
*				SET PRINTER TO VIDEO
				T=Z
				Z=1
				CENTRA(00,00,60,VCABE1)
				CENTRA(01,00,60,VCABE2)
				CENTRA(02,00,60,VCABE3)
				@ 04,00 SAY REPLICATE("=",60)
				@ 05,02 SAY "Relatorio de Cliente em Atrso:"
				@ 06,00 SAY REPLICATE("=",60)
				VLINHA = 08
				DO WHILE Z<>T
					USE CLIENTE INDEX CLIENTEA INDEX CLIENTEB
					SEEK VCODCLI[Z]
					@ VLINHA,02 SAY CODCLI
					@ VLINHA,10 SAY NOME
					VLINHA = VLINHA + 1
					@ VLINHA ,02 SAY ALLTRIM(ENDERECO) + "  " + TELEFONE
					VLINHA = VLINHA + 1 
					@ VLINHA,02 SAY "Data de Loca‡Æo " + DTOC(VDTLOC[Z]) + "   Data de Devolu‡Æo " + DTOC(VD[Z])
					VLINHA = VLINHA +1
					IF VSISTEMA = .T.
						VTA = VVALOR[Z] + VVALOR[Z]
					ELSE
						IF VJUROS > 0
							VT = VVALOR[Z] / 100 * VJUROS
						ELSE
							VT = 0
						ENDIF
						VTA=VVALOR[Z] + VT
					ENDIF
					@ VLINHA ,02 SAY "Valor " +STR(VVALOR[Z]) +"  Valor com juros " + STR(VTA)
					VLINHA = VLINHA +1
					@ VLINHA, 02 SAY VDIAS[Z] + " de Atrso"
					VLINHA = VLINHA + 1
					@ VLINHA,00 SAY REPLICATE("=",60)
					VLINHA = VLINHA + 1
					Z = Z + 1
				ENDDO
				USE LOCTEMP	
				@ VLINHA,02 SAY "Total de Cliente em Atrso [" + STRZERO(LASTREC(),10) + " ]"
				VLINHA = VLINHA + 2
				CENTRA(VLINHA,00,60,VRODA1)
				VLINHA = VLINHA + 1
				CENTRA(VLINHA,00,60,VRODA2)
				VLINHA = VLINHA + 1
				CENTRA(VLINHA,00,60,VRODA2)
				VLINHA = VLINHA + 1
				@ VLINHA+33,00 SAY ""
				SET DEVICE TO SCREEN
			ENDIF
		ENDIF
	ENDIF
ENDDO

RESTORE SCREEN FROM VTELA

CLOSE DATABASES

RETURN