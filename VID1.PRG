*********************************************************************
* VID1.PRG FEITO EM CLIPPER 5.3 ATENCAO NAO CLIILA EM CLIPPER SUNNER *
**********************************************************************
SAVE SCREEN TO VTELA_VID1
PRIVATE VN[7],VMSG[7]

VN[1] = "1 - Loca‡Æo "
VN[2] = "2 - Devolu‡Æo "
VN[3] = "3 - Fecha Caixa"
VN[4] = "4 - Explica"
VN[5] = "5 - Inicio de Jogo"
VN[6] = "6 - Fim de Jogo"
VN[7] = "7 - Visualizar Contas"

VMSG[1] = "Loca‡äes de Fitas"
VMSG[2] = "Devolu‡Æo de Fitas"
VMSG[3] = "Fecha o Caixa"
VMSG[4] = "Explica‡äes de Loca‡äes"
VMSG[5] = "Inicio de Jogo"
VMSG[6] = "Verrifica o Tempo que Falta para Acabar o Jogo"
VMSG[7] = "Visualiza as Contas a Pagar e a Receber"

DO WHILE .T.
	VOPCAO = BOXMENU(7,VN,VMSG,10,11,25)
	DO CASE
		CASE VOPCAO = 0
			EXIT
		CASE VOPCAO = 1
			DO VID11
		CASE VOPCAO = 2
			DO VID12
		CASE VOPCAO = 3
			DO VID13
		CASE VOPCAO = 4
			DO VID14
		CASE VOPCAO = 5
			DO VID15
		CASE VOPCAO = 6
			DO VID16
		CASE VOPCAO = 7
			DO VID17
	ENDCASE

ENDDO

RESTORE SCREEN FROM VTELA_VID1
RETURN