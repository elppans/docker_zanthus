#!/bin/bash

DH="$(date +%d%m%y.%H%M-%S)"
DOCKDIR='demonstracao'

#docker-zanthus stop

cd /opt
tar -zcvf "$HOME"/${DOCKDIR}_"$DH".tar.gz \
--exclude=${DOCKDIR}/manager_carga/* \
--exclude=${DOCKDIR}/manager_logs/* \
--exclude=${DOCKDIR}/manager_cert/* \
--exclude=${DOCKDIR}/disco_compartilhado/* \
--transform "s,^/opt/${DOCKDIR}/,,S" \
${DOCKDIR}

#sudo tar -zcvf demonstracao_"$DH".tar.gz --exclude=demonstracao/manager_carga --exclude=demonstracao/manager_logs --exclude=demonstracao/disco_compartilhado --transform 's,^/opt/demonstracao/,,S' demonstracao

#docker-zanthus start

echo -e "\n\n/opt/demonstracao_"$DH".tar.gz OK!\n\n"
