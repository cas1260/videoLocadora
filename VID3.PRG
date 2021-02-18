*********************************************************************
* VID1.PRG FEITO EM CLIPPER 5.3 ATENCAO NAO CLIILA EM CLIPPER SUNNER *
**********************************************************************
SAVE SCREEN TO VTELA_VID1
PRIVATE VN[12],VMSG[12]
IF VRELATORIO = "N"
	VN[1] = "Acesso Negado!!"
	VN[2] = "Acesso Negado!!"
	VN[3] = "Acesso Negado!!"
	VN[4] = "Acesso Negado!!"
	VN[5] = "Acesso Negado!!"	
	VN[6] = "Acesso Negado!!"
	VN[7] = "Acesso Negado!!"
	VN[8] = "Acesso Negado!!"
	VN[9] = "Acesso Negado!!"
	VN[10] = "Acesso Negado!!"
	VN[11] = "Acesso Negado!!"
	VN[12] = "Acesso Negado!!"

	VMSG[1] = ""
	VMSG[2] = ""
	VMSG[3] = ""
	VMSG[4] = ""
	VMSG[5] = ""
	VMSG[6] = ""
	VMSG[7] = ""
	VMSG[8] = ""
	VMSG[9] = ""
	VMSG[10] = ""
	VMSG[11] = ""
	VMSG[12] = ""
ELSE
	VN[1] = "1 - Cliente[Dep 1,2]"
	VN[2] = "2 - Produto Completo"
	VN[3] = "3 - Produto / Autor"
	VN[4] = "4 - Produto / Tipo & Autor"
	VN[5] = "5 - Produto / Tipo"
	VN[6] = "6 - Produto / Classe"
	VN[7] = "7 - Produto / Classe & Autor"
	VN[8] = "8 - Produto P/ Cliente"
	VN[9] = "9 - Cliente P/ Produto"
	VN[10] = "A - Cliente em Atrso"
	VN[11] = "B - Os Menhores Cliente"
	VN[12] = "C - Calcular Hist¢rico "

	VMSG[1] = "Localiza‡Æo de Cliente e Dependetes"
	VMSG[2] = "Localiza‡Æo de Todos os Produtos"
	VMSG[3] = "Localiza‡Æo de produtos por Autores"
	VMSG[4] = "Localiza‡Æo de Produtos por Tipo & Autor"
	VMSG[5] = "Localiza‡Æo de Produtos por Tipo"
	VMSG[6] = "Localiza‡Æo de Produtos por Classe"
	VMSG[7] = "Localiza‡Æo de Produtos por Classe & Autor"
	VMSG[8] = "Localiza‡Æo de Produtos por Foi locado pelo cliente"
	VMSG[9] = "Localiza‡Æo de Produtos por Foi locado pelo cliente"
	VMSG[10] = "Localiza‡Æo de Todos os Cliente en Atraso"
	VMSG[11] = "Localiza‡Æo do Cliente que mais Locou Mais Fitas"
	VMSG[12] = "Calcular Quanto que cada Fita j  Redeu"
ENDIF	
DO WHILE .T.
	VOPCAO = BOXMENU_A(12,VN,VMSG,10,42,28)
	IF VOPCAO = 0
		EXIT
	ENDIF
	IF VRELATORIO <> "N"
		DO CASE
			CASE VOPCAO = 0
				EXIT
			CASE VOPCAO = 1
				DO VID31		
			CASE VOPCAO = 2
				DO VID32
			CASE VOPCAO = 3
				DO VID33
			CASE VOPCAO = 4
				DO VID34
			CASE VOPCAO = 5
				DO VID35
			CASE VOPCAO = 6
				DO VID36
			CASE VOPCAO = 7
				DO VID37
			CASE VOPCAO = 8
				DO VID38
			CASE VOPCAO = 9
				DO VID39
			CASE VOPCAO = 10
				DO VID3A
			CASE VOPCAO = 11
				DO VID3B
			CASE VOPCAO = 12
				DO VID3C
		ENDCASE
	ENDIF
ENDDO

RESTORE SCREEN FROM VTELA_VID1
RETURN