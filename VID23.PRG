*******************************************
*		 CADASTRO DE USUARIO VID23.PRG 		*
*******************************************
SAVE SCREEN TO VTELA_USU
DO WHILE .T.
	IF VUSUARIO = "N"
		NAO()
		EXIT
	ENDIF
	USE USUARIO INDEX USUARIOA
	VCLI = "N"
	VUSU = "N"
	VCLA = "N"
	VTIP = "N"
	VPRO = "N"
	VLOC = "N"
	VDEV = "N"
	VCOD = SPACE(2)
	VNOM = SPACE(15)
	VPES = "N"
	VREL = "N"
	VAPO = "N"
	VCAI = "N"
	VSEN = SPACE(8)
	VCON = "N"
	VCO1 = "N"

	@ 05,15 CLEAR TO 22,75
	@ 05,15 TO 15,75 DOUBLE
	CENTRA(05,15,75,"[ F2 - PESQUISA ]")

	@ 07,16 SAY "Nome   " GET VNOM PICT "@!"
	@ 07,45 SAY "Senha " GET VSEN
	@ 08,16 TO 08,74 DOUBLE
	CENTRA(08,16,74,"[ Acesso a: ]")
	@ 09,16 SAY "Cliente    : " GET VCLI PICT "@!" VALID VCLI$"SN"
	@ 09,36 SAY "Produto    : " GET VPRO PICT "@!" VALID VPRO$"SN"
	@ 10,16 SAY "Usuario    : " GET VUSU PICT "@!" VALID VUSU$"SN"
	@ 10,36 SAY "Tipo       : " GET VTIP PICT "@!" VALID VTIP$"SN"
	@ 11,16 SAY "Classe     : " GET VCLA PICT "@!" VALID VCLA$"SN"
	@ 11,36 SAY "Locacao    : " GET VLOC PICT "@!" VALID VLOC$"SN"
	@ 12,16 SAY "Devolu��o  : " GET VDEV PICT "@!" VALID VDEV$"SN"
*	@ 12,36 SAY "Pesquisa   : " GET VPES PICT "@!" VALID VPES$"SN"
	@ 12,36 SAY "Pesquisa   : " GET VREL PICT "@!" VALID VREL$"SN"
	@ 13,16 SAY "Caixa      : " GET VCAI PICT "@!" VALID VCAI$"SN"
	@ 13,36 SAY "Contas     : " GET VCO1 PICT "@!" VALID VCO1$"SN"
	@ 14,16 SAY "Vis. Contas: " GET VCON PICT "@!" VALID VCON$"SN"
	CLEAR GETS
	SET KEY -1 TO MOSTRAUSUARIO
	@ 06,16 SAY "Codigo " GET VCOD PICT "99"
	READ
	SET KEY -1 TO
	IF LASTKEY() = 27
		EXIT
	ENDIF
	USE USUARIO INDEX USUARIOA
	VCOD = STRZERO(VAL(VCOD),2)
	SEEK VCOD
	IF EOF()
		VCLI = "N"
		VUSU = "N"
		VCLA = "N"
		VTIP = "N"
		VPRO = "N"
		VLOC = "N"
		VDEV = "N"
*		VCOD = COD_U
		VNOM = NOME_U
		VPES = "N"
		VREL = "N"
		VAPO = "N"
		VCAI = "N"
		VCON = "N"
		VCO1 = "N"
		VGRAVA = .T.
	ELSE
		VCON = VCONT_CONT
		VCO1 = CONT_CONT
		VCLI = CLIENTE
		VUSU = USUARIO
		VCLA = CLASSE
		VTIP = TIPO
		VPRO = PRODUTO
		VLOC = LOCACAO
		VDEV = DEVOLUCAO
		VCOD = COD_U
		VNOM = NOME_U
		VPES = PESQUISA
		VREL = RELATORIO
		VCAI = CAIXA
		VNOM = NOME_U
		VSEN = SENHA
		VGRAVA = .F.
		@ 09,16 CLEAR TO 12,74
		@ 09,16 TO 11,74 DOUBLE
		@ 07,16 SAY "Nome   " GET VNOM PICT "@!"
		CLEAR GETS
		CENTRA(09,17,74,"[ Senha de Libera��o ]")
		VSENHA = PAS(10,17,57)
		KEYBOARD CHR(1)
		IF ALLTRIM(VSENHA) <> ALLTRIM(SENHA)
			MSGBOX("Senha do Usuario Invalida!")
			LOOP
		ENDIF
	ENDIF
	@ 05,15 CLEAR TO 22,75
	@ 05,15 TO 15,75 DOUBLE
*	@ 07,45 SAY "Senha " GET VSEN
	@ 08,16 TO 08,74 DOUBLE
	CENTRA(08,16,74,"[ Acesso a: ]")
	@ 06,16 SAY "Codigo  " + VCOD
	@ 07,16 SAY "Nome   " GET VNOM PICT "@!"
	@ 07,45 SAY "Senha " GET VSEN PICT "@!"

	@ 09,16 SAY "Cliente    : " GET VCLI PICT "@!" VALID VCLI$"SN"
	@ 09,36 SAY "Produto    : " GET VPRO PICT "@!" VALID VPRO$"SN"
	@ 10,16 SAY "Usuario    : " GET VUSU PICT "@!" VALID VUSU$"SN"
	@ 10,36 SAY "Tipo       : " GET VTIP PICT "@!" VALID VTIP$"SN"
	@ 11,16 SAY "Classe     : " GET VCLA PICT "@!" VALID VCLA$"SN"
	@ 11,36 SAY "Locacao    : " GET VLOC PICT "@!" VALID VLOC$"SN"
	@ 12,16 SAY "Devolu��o  : " GET VDEV PICT "@!" VALID VDEV$"SN"
*	@ 12,36 SAY "Pesquisa   : " GET VPES PICT "@!" VALID VPES$"SN"
	@ 12,36 SAY "Pesquisa   : " GET VREL PICT "@!" VALID VREL$"SN"
	@ 13,16 SAY "Caixa      : " GET VCAI PICT "@!" VALID VCAI$"SN"
	@ 13,36 SAY "Contas     : " GET VCO1 PICT "@!" VALID VCO1$"SN"
	@ 14,16 SAY "Vis. Contas: " GET VCON PICT "@!" VALID VCON$"SN"
	READ
	IF LASTKEY() # 27
		IF VGRAVA = .T.
			APPEND BLANK
		ENDIF
		REPLACE CLIENTE WITH VCLI
		REPLACE PRODUTO WITH VPRO
		REPLACE USUARIO WITH VUSU
		REPLACE CLASSE WITH VCLA
		REPLACE TIPO WITH VTIP
		REPLACE PRODUTO WITH VPRO
		REPLACE LOCACAO WITH VLOC
		REPLACE DEVOLUCAO WITH VDEV
		REPLACE COD_U WITH VCOD
		REPLACE NOME_U WITH VNOM
		REPLACE PESQUISA WITH VPES
		REPLACE RELATORIO WITH VREL
		REPLACE CAIXA WITH VCAI
		REPLACE NOME_U WITH VNOM
		REPLACE SENHA WITH VSEN
		REPLACE COD_U WITH VCOD
		REPLACE VCONT_CONT WITH VCON
		REPLACE CONT_CONT WITH VCO1 
	ENDIF
ENDDO
RESTORE SCREEN FROM VTELA_USU
RETURN