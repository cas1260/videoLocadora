*****************************************************************
* VIDEO.PRG SISTEMA DE VIDEO LOCADORA FEITO EM CLIPPER SUNNER87 *
*****************************************************************
? "Visual Top Time 1.0"
? "Todos os Direito de Copia Esta reservado A:"
? "(c) CLEBER DE ALMIEDA SOARES"
? ""
SWPRUNCMD("DEMO 8",0,0)
*SWPRUNCMD
INKEY(0.5)
PUBLIC CODIGOT,VRET,VDATA_DEV,VCODTIPO,VCODCLAS
PUBLIC VEMPRESA,VJUROS,VSISTEMA,VRODA1,VRODA2,VRODA3,VCABE1,VCABE2
PUBLIC VCABE3,VEND,VBAIRRO,VCIDADE,VSYS
PUBLIC VCLIENTE,VPRODUTO,VCAIXA,VUSUARIO,VTIPO,VCLASSE,VNOME_U,VLOCACAO,V_DEV
PUBLIC VRELATORIO,VPESQUISA,VDATA_FINAL,VSAI,VINSTIME
PUBLIC VT1,VT2,VT3,VT4,VT5,PCOLOR,VCONT_CONT_V,CONT_CONT_C,PCOLOR1
VINSTIME = 200
USE CONFIG
PCOLOR1 = PAPEL1
VT1 = V1
VT2 = V2
VT3 = V3
VT4 = V4
VT5 = V5
PCOLOR = PAPEL
VEMPRESA=ALLTRIM(EMPRESA)
VJUROS=JUROS
VSISTEMA=SISTEMA
VRODA1=ALLTRIM(RODA1)
VRODA2=ALLTRIM(RODA2)
VRODA3=ALLTRIM(RODA3)
VCABE1=ALLTRIM(CABE1)
VCABE2=ALLTRIM(CABE2)
VCABE3=ALLTRIM(CABE3)
VEND=ALLTRIM(END)
VBAIRRO=ALLTRIM(BAIRRO)
VCIDADE=ALLTRIM(CIDADE)
VSYS = SYS
IF FIM = .F.
	SET COLOR TO
	CLEAR
	@ 10,20 TO 20,60 DOUBLE
	SET COLOR TO W*/N
	CENTRA(11,20,60,"Aten��o")
	SET COLOR TO W/N
	CENTRA(12,20,60,"O Programa n�o foi desligado")
	CENTRA(13,20,60,"Correntamente")
	CENTRA(14,20,60,"Este Procedumento Verrificarar Se")
	CENTRA(15,20,60,"Vo�e Perdeu Dados ")
	@ 17,22 PROMPT "Continuar a Carregar o Programa       "
	@ 18,22 PROMPT "Verrificar se Ouve Erro               "
	MENU TO VOPCAO
	DO CASE 
		CASE VOPCAO = 0
			CLEAR
			USE CONFIG
			REPLACE FIM WITH .T.
			CANCEL
		CASE VOPCAO = 2
			@ 21,20 TO 24,60 DOUBLE
			X = 38/ 15000
			P = 0
			CENTRA(22,20,60,"Corrigindo...")
			@ 23,21 SAY REPLICATE("�",39)
			DO WHILE P < 38
				@ 23,21 + P SAY "�"
				P = P + X
			ENDDO
			@ 23,21 SAY REPLICATE("�",39)
			CENTRA(22,20,60,"Erros Corrigindo")
	ENDCASE
ENDIF
SET CONFIRM ON
SET SCORE OFF
SET CENTURY ON
SET DATE BRITISH
SET DELETED ON
SET DEVICE TO SCREEN
SET ESCAPE ON
SET WRAP ON
SET MESSAGE TO 23 CENTER
DO PROG000
DO PROG001
*SET VIDEOMODE TO 18
SET CURSOR ON
DO VER

IF !FILE("CLIENTEA.NTX")
	BOX("AGUARDE, Carregando Arquivos de Cliente 1/2")
	USE CLIENTE
	INDEX ON CODCLI TO CLIENTEA
	BOX("AGUARDE, Carregando Arquivos de Cliente 2/2")
	INDEX ON NOME TO CLIENTEB
	CLOSE ALL
ENDIF
IF !FILE("PRODUTOA.NTX")
	BOX("AGUARDE, Carregando Arquivos de Produto 1/2")
	USE PRODUTO
	INDEX ON CODPROD TO PRODUTOA
	BOX("AGUARDE, Carregando Arquivos de Produto 2/2")
	INDEX ON DESCRICAO TO PRODUTOB
	CLOSE ALL
ENDIF
IF !FILE("TIPOA.NTX")
	BOX("AGUARDE, Carregando Arquivos de Tipo")
	USE TIPO
	INDEX ON CODTIPO TO TIPOA
ENDIF	
IF !FILE("CLASSEA.NTX")
	BOX("AGUARDE, Carregando Arquivos de Tipo")
	USE CLASSE
	INDEX ON CODCLAS TO CLASSEA
ENDIF
IF !FILE("USUARIOA.NTX")
	BOX("AGUARDE, Carregando Arquivos de Usuario")
	USE USUARIO
	INDEX ON COD_U TO USUARIOA
ENDIF
IF !FILE("LOCACAOA.NTX")
	BOX("AGUARDE, Carregando Arquivos de LOCACOES")
	USE LOCACAO
	INDEX ON CODCLI TO LOCACAOA
	INDEX ON LANCA TO LOCACAOB
	INDEX ON NOME TO LOCACAOD
	USE LOCACAO2
	INDEX ON PRODUTO TO LOCACAOC
ENDIF
IF !FILE("JOGOFIM.NTX")
	USE JOGOFIM 
	INDEX ON INICIO TO JOGOFIM
ENDIF
IF !FILE("CJOGOA.NTX")
	USE CJOGO
	INDEX ON CODJOGO TO CJOGOA
ENDIF

IF !FILE("PAGAR1.NTX")
	USE PAGAR
	INDEX ON COD TO PAGAR1
ENDIF
IF !FILE("RECEBER1.NTX")
	USE RECEBER
	INDEX ON COD TO RECEBER1
ENDIF
USE CONFIG
REPLACE FIM WITH .F.
CLOSE ALL
XY = 0
IF ISCOLOR()
	VCORES_CORESC = PCOLOR
ELSE
	VCORES_CORESC = "W+/G,N/W"
ENDIF
SET COLOR TO &VCORES_CORESC
DO WHILE .T.
	IF XY = 3
		SET COLOR TO 
		CLEAR
		? "Opera��o Canelada"
		CLOSE ALL	
		SWPRUNCMD("MODE CO80",0,0)
		USE CONFIG
		REPLACE FIM WITH .T.
		CANCEL
	ENDIF
	CLEAR
	@ 00,00 TO 03,38 DOUBLE
	@ 00,39 TO 03,78 DOUBLE
	@ 04,00 TO 24,78 DOUBLE
	CENTRA(02,01,38,"Sistema de Video locadora")
	@ 05,01 CLEAR TO 19,77
	@ 07,10 TO 09,68 DOUBLE
	CENTRA(01,01,38,VEMPRESA)
	CENTRA(04,01,78,"[ Visual Top Time 1.0 ]")
	CENTRA(01,42,78,"Usuario []")
	CENTRA(02,41,78,DIASEM(DATE())+"  -   "+DTOC(DATE()))
	VCOD = SPACE(02)
	VSENHA = SPACE(20)
	@ 08,12 SAY " TRABALHO "
	@ 08,27 SAY " CADASTRO "
	@ 08,42 SAY " PESQUISA "
	@ 08,57 SAY "   APOIO  "
	@ 12,10 SAY "Senha do Usuario:  " GET VSENHA
	CLEAR GETS
	@ 10,10 SAY "Codigo do Usuario: " GET VCOD PICT "99"
	READ
	IF VCOD = SPACE(02)
		IF LASTKEY() = 27
			SET COLOR TO
			CLEAR
			SWPRUNCMD("MODE CO80",0,0)
			USE CONFIG
			REPLACE FIM WITH .T.
			CANCEL
		ENDIF
		VCOD = M_USUARIO()
	ENDIF
	VCOD = STRZERO(VAL(VCOD),2)
	@ 10,10 SAY "Codigo do Usuario:  " + VCOD 
	VSENHA = PAS(12,30,20)
	IF LASTKEY ()  = 27
		SET COLOR TO 
		CLEAR
		SWPRUNCMD("MODE CO80",0,0)
		USE CONFIG
		REPLACE FIM WITH .T.
		CANCEL
	ENDIF
	IF VCOD = "99" .AND. VSENHA = "CLEBER(SETUP)"
		CONFIG()
		LOOP
	ENDIF
	USE USUARIO INDEX USUARIOA
	SEEK VCOD
	IF EOF()
		MSGBOX("Usuario n�o Encotrado!")
	ELSE
		IF ALLTRIM(VSENHA) <> ALLTRIM(SENHA)
			MSGBOX("Senha Invalida!")
		ELSE
			VCLIENTE     = CLIENTE 
			VPRODUTO     = PRODUTO 
			VCAIXA       = CAIXA 
			VUSUARIO     = USUARIO
			VTIPO        = TIPO
			VCLASSE      = CLASSE
			VNOME_U      = ALLTRIM(UPPER(NOME_U))
			VLOCACAO	    = LOCACAO	
			V_DEV        = DEVOLUCAO
			VRELATORIO   = RELATORIO 
			VPESQUISA    = PESQUISA
			VCONT_CONT_V   = CONT_CONT
			CONT_CONT_C  = CONT_CONT

			EXIT
		ENDIF
	ENDIF
XY = XY + 1
ENDDO


X = 30 / 750
PRA = 0
PRA_A =  100 / 750
XYZ = X
SET CURSO OFF
@ 16,20 CLEAR TO 19,52
@ 16,20 TO 19,52 DOUBLE
CENTRA(17,20,52,"[ Aguade Carregando ]")
@ 18,21 SAY REPLICATE("�",32)
ZP = 0
DO WHILE ZP < 52
	@ 18,21+X SAY "�"
	CENTRA(19,20,52,"[ " + ALLTRIM(STR(PRA)) + " % ]")
	PRA = PRA + PRA_A 
	X = X + XYZ
	ZP = 21 + X
ENDDO(0)
@ 18,21 SAY REPLICATE("�",32)
SET CURSO ON

SET KEY -4 TO CALENDARIO
SET KEY -6 TO HORA
SET KEY -5 TO A_CAL
DO WHILE .T.
	SET COLOR TO &VCORES_CORES
*	SET COLOR TO  W/N,N/W
	CLEAR
	@ 00,00 TO 03,38 DOUBLE
	@ 00,39 TO 03,78 DOUBLE
	@ 04,00 TO 24,78 DOUBLE
	CENTRA(02,01,38,"Sistema de Video locadora")
	@ 05,01 CLEAR TO 19,77
	@ 07,10 TO 09,68 DOUBLE
	CENTRA(01,01,38,VEMPRESA)
	CENTRA(04,01,78,"[ Visual Top Time 1.0 ]")
	CENTRA(01,42,78,"Usuario [ "+ VNOME_U +" ]")
	CENTRA(02,41,78,DIASEM(DATE())+"  -   "+DTOC(DATE()))
*	@ 02,62 SAY TIME()
	VOPCAO = 1
	CENTRA(24,00,80,"[ F5 E F6  CALENDARIO F7 - HORA ]")
	@ 08,12 PROMPT " TRABALHO "
	@ 08,27 PROMPT " CADASTRO "
	@ 08,42 PROMPT " PESQUISA "
	@ 08,57 PROMPT "   APOIO  "
	IF LASTKEY() = 4
		IF VOPCAOP = 4
			VOPCAOP = 1
		ELSE
			VOPCAOP = VOPCAOP + 1
		ENDIF
		KEYBOARD CHR(13)
	ENDIF
	IF LASTKEY() = 19
		IF VOPCAOP = 1
			VOPCAOP = 5
		ELSE
			VOPCAOP = VOPCAOP -1
		ENDIF
		KEYBOARD CHR(13)
	ENDIF
	MENU TO VOPCAOP

	SET COLOR TO &VCORES_CORESC
	DO CASE
		CASE VOPCAOP = 0
			DO SAIR		
		CASE VOPCAOP = 1
			DO VID1
		CASE VOPCAOP = 2
			DO VID2
		CASE VOPCAOP = 3
			DO VID3
		CASE VOPCAOP = 4
			DO VID4
		ENDCASE
ENDDO