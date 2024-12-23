#!/bin/bash

if [ "$(id -u)" != "0" ]; then
echo "Deve executar o comando como super usuario!"
exit 0
fi

##      Usando arquivo de log - INÍCIO
# Habilita log copiando a saída padrão para o arquivo LOGFILE

exec 1> >(tee -a "/var/log/"${0##*/}".log")

# faz o mesmo para a saída de ERROS

exec 2> >(tee -a "/var/log/"${0##*/}"_error.log")

##      Usando arquivo de log - FIM
# Verificar status do FirewallD e ativar (Se não ativado):
systemctl is-enabled firewalld && echo OK || systemctl enable firewalld
systemctl is-active firewalld && echo OK || systemctl start firewalld
firewall-cmd --state && echo OK || { echo -e "Falha" ; exit 1 ; }
#systemctl status firewalld

# Variaveis para o redirecionamento:
PORT='8080'
TOPORT='80'

# Configuração do redirecionamento:
sudo firewall-cmd --add-forward-port=port=${PORT}:proto=tcp:toport=${TOPORT}
sudo firewall-cmd --runtime-to-permanent
sudo firewall-cmd --reload
sudo firewall-cmd --list-all
