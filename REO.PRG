*******************************************************
* REOGANIZA€ÇO DE ARQUIVOS PROGRAMA FEITO EM SUNNER87 *
*******************************************************
PARAMETERS V_V
IF V_V = "1"  .OR. V_V = "T"
	USE CLIENTE
	INDEX ON NOME TO CLIENTEB
	INDEX ON CODCLI TO CLIENTEA
ENDIF
