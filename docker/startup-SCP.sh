#!/bin/ash

# Inicia o serviço SSH
/usr/sbin/sshd &

# Mantém o script em execução indefinidamente
tail -f /dev/null