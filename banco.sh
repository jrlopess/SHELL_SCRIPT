#!/bin/bash
##Declarando variáveis de entrada. Utilizando a var CONNECT evitar repetição do parâmetro.
declare ARGUMENTO=$1
declare USUARIO=$2
declare CONNECT="mysql -u root -pjoao -e"

case $ARGUMENTO in 
# Mostra os db.
-S|show) $CONNECT  "show databases";;
# Criação de usuário e no final SELECT mostra a tabela com todos os usuários criados. Podendo ser removido.
-C|create) $CONNECT  "CREATE USER '$USUARIO'@'localhost' IDENTIFIED BY 'password'; SELECT user FROM mysql.user ; ";;

# Da permisão de UPDATE para o usuário definino na variável. banco_test exemplo de sintaxe.
-G|GRANT)  $CONNECT   " GRANT UPDATE  ON banco_teste . * TO '$USUARIO'@'localhost' IDENTIFIED BY 'password' ; FLUSH PRIVILEGES; ";; 

# Retirando permissões.
-R|REVOKE) $CONNECT " REVOKE ALL, GRANT OPTION FROM '$USUARIO'@'localhost'; ";; 

#Excluindo usuário do banco.
-d|drop)   $CONNECT   "DROP USER '$USUARIO'@'localhost'; SELECT user FROM mysql.user; " ;;
*) echo " Nenhuma entrada válida."
esac
 
