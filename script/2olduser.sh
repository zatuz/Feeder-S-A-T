#!/bin/bash
set -o pipefail
#user creado
# se declara la variable user
#readonly user="zatuz"
usermod -aG sudo "$VAR1"
usermod -aG "$VAR1" "$VAR1"
echo "$VAR1:$VAR2" | chpasswd -m
