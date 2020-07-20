#!/bin/bash


DAY=$(date "+%d/%m/%y %H:%M:%S") ##  Ordernando valores Date

ps aux  >> /etc/script/monitor  ### Incrementando no txt com >>

echo "Log realizado $DAY" 	### Imprimido o  horário da execução.
				## Utilizei o Crontab para repetir a cada 15min

#crontado -u root -e // adicionando a linha */15 * * * * /bin/bash /ps.sh
