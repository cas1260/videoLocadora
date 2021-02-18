*********************************************************************
* VID5.PRG FEITO EM CLIPPER 5.3 ATENCAO NAO CLIILA EM CLIPPER SUNNER *
**********************************************************************
SAVE SCREEN TO VTELA_VID1
PRIVATE VN[4],VMSG[4]

VN[1] = "1 - Reoganiza‡Æo"
VN[2] = "2 - Back-up"
VN[3] = "3 - Manute‡Æo"
VN[4] = "4 - Configura‡äes"

VMSG[1] = "Organiza os banco de Dados"
VMSG[2] = "Copia de Seguran‡a"
VMSG[3] = "Sobre o Programa"
VMSG[4] = "Configura‡äes do Sistema"

DO WHILE .T.
	VOPCAO = BOXMENU(4,VN,VMSG,10,51,25)
	DO CASE
		CASE VOPCAO = 0
			EXIT
		CASE VOPCAO = 1
			DO VID41
		CASE VOPCAO = 2
			DO VID42	
		CASE VOPCAO = 3
			DO VID43
		CASE VOPCAO = 4
			DO VID44
	ENDCASE

ENDDO

RESTORE SCREEN FROM VTELA_VID1
RETURN