#!/bin/bash

if [ "$(id -u)" != "0" ]; then
  echo "Deve executar este Script como super usuario!"
  exit 0
fi

# Enable UFW if it's not already enabled
ufw enable

# Allow specific services
ufw allow ssh
ufw allow http
ufw allow https
ufw allow samba
ufw allow OpenSSH-server

# Allow specific ports
ufw allow 53/udp
ufw allow 53/tcp
ufw allow 5353/udp
ufw allow 139/tcp
ufw allow 445/tcp
ufw allow 137/udp
ufw allow 138/udp
ufw allow 9090/tcp
ufw allow 3040/tcp
ufw allow 3040/udp
ufw allow 11211/tcp
ufw allow 8109/tcp
ufw allow 8899/tcp
ufw allow 5672/tcp
ufw allow 6571/tcp
ufw allow 15672/tcp
ufw allow 25672/tcp
ufw allow 123/tcp
ufw allow 4096/tcp
ufw allow 5432/tcp

# You can add more specific rules as needed, e.g.,
# ufw allow from 192.168.1.0/24 to 22/tcp

# Variaveis para redirecionamento
PORT='8080'
TOPORT='80'

# Configura o redirecionamento (NÃO É POSSÍVEL DIRETAMENTE COM O UFW)

# Permite o acesso à porta 8080 (exemplo)
# ufw allow $PORT/tcp

# Permite o acesso à porta 80 (exemplo)
# ufw allow $TOPORT/tcp

# Remoção do redirecionamento: O UFW não possui um comando direto para redirecionamento de portas como o FirewallD. Para simular esse comportamento, normalmente utilizamos um proxy reverso (como o Nginx ou Apache) ou ferramentas de rede mais avançadas.

# Show the current firewall rules
ufw status

