#!/bin/bash

# Debian Server, configurar Power Settings

LOGIND_CONF="/etc/systemd/logind.conf"
HANDLE_LID_SWITCH="HandleLidSwitch=ignore"

# Desativar hibernação
sudo systemctl mask systemd-hibernate.service

# Desativar suspensão
sudo systemctl mask systemd-suspend.service

# Verificar se HandleLidSwitch existe e ajustar
if [ -f "$LOGIND_CONF" ]; then
    if grep -q "^$HANDLE_LID_SWITCH" "$LOGIND_CONF"; then
        echo "HandleLidSwitch already set to ignore."
    else
        sudo sed -i "/^#*\s*HandleLidSwitch/c$HANDLE_LID_SWITCH" "$LOGIND_CONF"
        echo "HandleLidSwitch set to ignore."
    fi
else
    echo "$LOGIND_CONF not found."
fi

# Recarregar as configurações do systemd
sudo systemctl daemon-reload

# Ubuntu Server, desativar Standby

CONFIG_FILE="/etc/systemd/sleep.conf"

# Verifica se o arquivo de configuração existe
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Arquivo $CONFIG_FILE não encontrado. Criando o arquivo..."
    sudo touch "$CONFIG_FILE"
fi

# Função para adicionar ou ajustar configuração
add_or_update_config() {
    local key=$1
    local value=$2
    if grep -q "^#$key" "$CONFIG_FILE"; then
        # Descomenta a linha e ajusta o valor
        sudo sed -i "s/^#$key=.*/$key=$value/" "$CONFIG_FILE"
    elif grep -q "^$key" "$CONFIG_FILE"; then
        # Ajusta o valor se já existir
        sudo sed -i "s/^$key=.*/$key=$value/" "$CONFIG_FILE"
    else
        # Adiciona a linha se não existir
        echo "$key=$value" | sudo tee -a "$CONFIG_FILE" > /dev/null
    fi
}

# Adiciona ou ajusta as configurações
add_or_update_config "AllowSuspend" "no"
add_or_update_config "AllowHibernation" "no"
add_or_update_config "AllowSuspendThenHibernate" "no"
add_or_update_config "AllowHybridSleep" "no"

# Reinicia o serviço systemd-logind para aplicar as alterações
sudo systemctl restart systemd-logind

# echo "Configurações de suspensão desativadas com sucesso!"

echo "Configurações de hibernação e suspensão desativadas e HandleLidSwitch configurado."
