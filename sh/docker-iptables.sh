#!/bin/bash

if [ "$(id -u)" != "0" ]; then
echo "Deve executar o comando como super usuario!"
exit 0
fi

if [ ! -e /etc/docker/daemon.json ]; then
    echo -e '{
    "iptables": false
    }' | tee /etc/docker/daemon.json >> /dev/null
    systemctl restart docker
fi
