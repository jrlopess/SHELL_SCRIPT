#!/bin/bash
# Recebendo as variáveis.
declare ENTRADA=$1
declare USUARIO=$2

#Criando if para validar o parâmetro  -u acompanhando do usuário, caso seja true, é passado para o comando seguinte.
if [ "$ENTRADA" = "-u" ]; #Entrando no primeiro if.
then
               echo " Informações recebidas, aguarde..."

  sleep 1
#USUARIO recebe a variável de entrada e conecta no host, trocar ip para um válido no ambiente.
ssh -o StrictHostKeyChecking=no "$USUARIO"@192.168.5.141
fi  #Saindo do if.
exit


