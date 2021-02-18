*********************************************************************
* VID2.PRG FEITO EM CLIPPER 5.3 ATENCAO NAO CLIILA EM CLIPPER SUNNER *
**********************************************************************
SAVE SCREEN TO VTELA_VID1
PRIVATE VN[7],VMSG[7]

VN[1] = "1 - Cliente"
VN[2] = "2 - Produto"
VN[3] = "3 - Usuario"
VN[4] = "4 - Tipo"
VN[5] = "5 - Clase"
VN[6] = "6 - Jogos"
VN[7] = "7 - Contas"

VMSG[1] = "Incluis∆o,Modificaá∆o,Exclus∆o de Cliente"
VMSG[2] = "Incluis∆o,Modificaá∆o,Exclus∆o de Produto"
VMSG[3] = "Incluis∆o,Modificaá∆o,Exclus∆o de Usuario"
VMSG[4] = "Incluis∆o,Modificaá∆o,Exclus∆o de Tipo"
VMSG[5] = "Incluis∆o,Modificaá∆o,Exclus∆o de Clase"
VMSG[6] = "Incluis∆o,Modificaá∆o,Exclus∆o de Jogo"
VMSG[7] = "Incluis∆o,Modificaá∆o,Exclus∆o de Contas a Pagar e a Receber"


DO WHILE .T.

	VOPCAO = BOXMENU(7,VN,VMSG,10,26,28)
	DO CASE
		CASE VOPCAO = 0
			EXIT
		CASE VOPCAO = 1
			DO VID21
		CASE VOPCAO = 2
			DO VID22
		CASE VOPCAO = 3
			DO VID23
		CASE VOPCAO = 4
			DO VID24
		CASE VOPCAO = 5
			DO VID25
		CASE VOPCAO = 6
			DO VID26
		CASE VOPCAO = 7
			DO VID27
	ENDCASE

ENDDO

RESTORE SCREEN FROM VTELA_VID1
RETURN