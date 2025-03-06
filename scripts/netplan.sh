#!/bin/bash

# Solicitar o nome da interface via terminal
read -p "Digite o nome da interface de rede: " ETH_INTERFACE

# Definir arquivo de configuração do Netplan
NETPLAN_CONFIG="/etc/netplan/01-netcfg.yaml"

# Criar VLANs no Netplan
echo "Configurando VLANs para a interface $ETH_INTERFACE..."
cat <<EOF > $NETPLAN_CONFIG
network:
  version: 2
  renderer: networkd
  ethernets:
    eno1:
      dhcp4: no
      addresses:
        - 10.10.10.3/24
        - 192.168.0.2/24
EOF

# Aplicar Netplan
echo "Aplicando configurações de rede..."
sudo netplan apply
