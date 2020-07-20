#!/bin/bash
##Declarando as variáveis de entrada de acordo com a ordem de entrada.
declare ARQUIVO=$1
declare VAR=$2
declare GROUP=$3

##Preparando IFS para leitura através delimitação por vírgula.
OLDIFS=$IFS
IFS=','

#Criando IF para verificar se houve alguma entrada. Caso seja vazio, o script encerra.
if [ -z $ARQUIVO ]
   then
   echo " Nenhum valor encontrado, favor insira o texto"
exit 
else
 echo " Lendo o arquivo $ARQUIVO, aguarde.." 
fi
sleep 2
#Criando While para ler as colunas dentro da lista de csv. Utilizando o Case para seguir algumas opções de acordo com a entrada de "VAR".
while read USUARIO SENHA GRUPO TELEFONE
 do
 case $VAR in

# Criando usuário, pode também chamar o paramêtro -p adicionalmente para criar senha e utilizar o campo SENHA do arquivo caso necessário.
-create) echo "Criando $USUARIO"
 useradd -m  -s /bin/bash $USUARIO ;;

# Para bloquear optei por mudar shell padrão para um valor False.
-block) echo "Bloqueando $USUARIO"
usermod -s bin/false $USUARIO;;

# O desbloqueio é realizado voltando para o shell padrão /bin/bash.
-unlock) echo "Desbloqueando $USUARIO"
usermod -s /bin/bash $USUARIO;;

# Nessa opção podemos usar variável de entrada GROUP para definir externamente onde os usuários serão adicionados.
-group) echo "Aguarde a inclusão no GRUPO $GROUP"
gpasswd -a $USUARIO $GROUP ;;

#Caso nenhuma opção corresponda, o script é encerrado.
*) echo  "Entrada inválida" 
exit ;;
esac
done<$ARQUIVO
IFS=$OLIFS
CONTADOR=$(wc -w < $ARQUIVO)
#wc -w para ler a quantida real de linhas.
echo "Procedimento realizado com  $CONTADOR usuários."
