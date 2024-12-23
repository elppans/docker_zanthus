#!/bin/bash

DH="$(date +%d%m%y.%H%M-%S)"

#docker-zanthus stop

cd /opt
tar -zcvf "$HOME"/docker_"$DH".tar.gz \
--exclude=docker/manager_carga/* \
--exclude=docker/manager_logs/* \
--exclude=docker/manager_cert/* \
--exclude=docker/disco_compartilhado/* \
--transform 's,^/opt/docker/,,S' \
docker

#sudo tar -zcvf docker_"$DH".tar.gz --exclude=docker/manager_carga --exclude=docker/manager_logs --exclude=docker/disco_compartilhado --transform 's,^/opt/docker/,,S' docker

#docker-zanthus start

echo -e "\n\n/opt/docker_"$DH".tar.gz OK!\n\n"
