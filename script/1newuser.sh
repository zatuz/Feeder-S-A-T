#!/bin/bash
set -o pipefail
#variables de user an password
#readonly user="mi-usuario"
#readonly pass="my-password"
useradd -m "$VAR1"
usermod -aG sudo "$VAR1"
usermod -aG "$VAR1" "$VAR1"
echo "$VAR1:$VAR2" | chpasswd -m
chsh -s /bin/bash "$VAR1"
