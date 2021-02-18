ECHO OFF
CLS
ECHO Criado pasta
MD C:\VIDEO
ECHO pasta criada
CLS
ECHO ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
ECHO บ                                                                            บ
ECHO บ                            Instalado Programa                              บ
ECHO บ                                                                            บ
ECHO ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
ECHO Instalado o Programa
ECHO ====================
COPY A:\*.* C:\VIDEO
C:
CD VIDEO
COPY CLIENTE.DBF CLIENTE.DBT
COPY PRODUTO.DBF PRODUTO.DBT
COPY LOCACAO.DBF LOCACAO.DBT
COPY LOCACAO2.DBF LOCACAO2.DBT
ECHO ATUALIZANDO OS ARQUIVO
ECHO ======================
ECHO SET CLIPPER=F100 >> C:\AUTOEXEC.BAT
ECHO FILES=100 >> C:\CONFIG.SYS
ECHO BUFFERS=35 >> C:\CONFIG.SYS
ECHO ==============================================
ECHO Agora voc tem quer Reiniciar o seu Computador
ECHO ==============================================
ECHO ON
