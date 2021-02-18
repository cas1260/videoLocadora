*********************************************************************
* VID5.PRG FEITO EM CLIPPER 5.3 ATENCAO NAO CLIILA EM CLIPPER SUNNER *
**********************************************************************
SAVE SCREEN TO VTELA_VID1
PRIVATE VN[5],VMSG[5]

VN[1] = "1 - Empresa"
VN[2] = "2 - Taxa de Juros"
VN[3] = "3 - Data & Hora "
VN[4] = "4 - Sistema Operacional"
VN[5] = "5 - Tempo do Jogo"

VMSG[1] = "Configura‡Æo da Empresa"
VMSG[2] = "Configure as Taxa de Juros"
VMSG[3] = "Ajusta a Data e a Hora"
VMSG[4] = "Configura‡äes do Sistema"
VMSG[5] = "Atualiza os Pre‡o dos tempo dos Jogos"

DO WHILE .T.
	VOPCAO = BOXMENU(5,VN,VMSG,12,50,25)
	DO CASE
		CASE VOPCAO = 0
			EXIT
		CASE VOPCAO = 1
			DO VID441
		CASE VOPCAO = 2
			DO VID442	
		CASE VOPCAO = 3
			DO VID443
		CASE VOPCAO = 4
			DO VID444
		CASE VOPCAO = 5
			DO VID445
	ENDCASE
ENDDO

RESTORE SCREEN FROM VTELA_VID1
RETURN