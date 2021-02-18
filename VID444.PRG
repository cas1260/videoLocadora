****************************************
*	 VID444.PRG CONFIGURA€ÇO DO SISTEMA	*
****************************************
SAVE SCREEN TO VTELA_SYS
DO WHILE .T.
	@ 14,49 CLEAR TO 22,74
	@ 14,49 TO 22,74
	@ 15,50 SAY "( ) Dos"
	@ 16,50 SAY "( ) Dos/Windows 3.1"
	@ 17,50 SAY "( ) Dos/Windows 95 "
	@ 18,50 SAY "( ) Dos/Windows 98"
	@ 19,50 SAY "( ) Novel"
	@ 20,50 SAY "( ) Linux"
	@ 21,50 SAY "( ) Outros"
	MENU = MENU_O(14,7,51,CHR(7),VSYS)
	IF MENU <> 0
		USE CONFIG
		REPLACE SYS WITH MENU
		VSYS = MENU
	ENDIF
	EXIT
ENDD
RESTORE SCREEN FROM VTELA_SYS
RETURN