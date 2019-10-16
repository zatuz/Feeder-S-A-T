#!/bin/bash
set -o pipefail                   #configura bash cuando termine
useradd -m "$VAR1"                #crea usuario
usermod -aG sudo "$VAR1"          #agrega user a grupo sudo
usermod -aG "$VAR1" "$VAR1"       #agrega user a su grupo
echo "$VAR1:$VAR2" | chpasswd -m  #configura la contraseña de user
chsh -s /bin/zsh "$VAR1"       #configura bash como terminal
##sudo useradd -m -g osiris -G osiris - s /bin/bash usuario