#!/bin/bash

#DOCYML="/opt/demonstracao/docker-compose.yml"
#MANAGERWEB="$(cat "$DOCYML" | grep -v '#' | grep -A 1 'manager_1:' | grep 'image' | awk '{print $2}')"
#echo "$MANAGERWEB" > /tmp/manager_1
#docker ps > /tmp/docker_manager_1
#cat /tmp/docker_manager_1 | grep "$MANAGERWEB"
#docker exec -it "$MANAGERWEB" /bin/bash


#manager_file="/tmp/manager_1"
#docker_manager_file="/tmp/docker_manager_1"

#export MF=`cat /tmp/manager_1`
#echo $MF 

#cat /tmp/docker_manager_1 | grep $MF

cd /opt/demonstracao
cat /opt/demonstracao/docker-compose.yml | grep -v '#' | grep -A 1 'manager_1:' | grep 'image' | awk '{print $2}' | cut -d ':' -f '2'

read -p "Digitar o resultado aqui: " DOCML

#echo $DOCML
DKPS=$(docker ps | grep "$DOCML" | awk '{print $1}')
docker exec -it "$DKPS" /bin/bash
