#!/bin/bash
# Recebendo as variáveis.
declare ENTRADA=$1
declare USUARIO=$2
declare ENTRADA1=$3
declare SENHA=$4

# Criando if aninhado para liberar usuario e senha.
if [ "$ENTRADA" = "-u" ]; #Entrando no primeiro if.
then
	if [ "$ENTRADA1" = "-p" ]; #Entrando no segundo if.
	then
	echo " Informações recebidas, aguarde..."
	sleep 1
# Usando sshpass para o input de senha em linha de comando. apt-get install sshpass yum install sshpass.
 sshpass -p "$SENHA" ssh -o StrictHostKeyChecking=no "$USUARIO"@192.168.5.141
fi #Saindo do segundo if. 
fi #Saindo do primeiro if.
exit
