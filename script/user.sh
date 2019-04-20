#!/bin/bash
set -o pipefail                  #cierra bash cuando termine
usermod -aG sudo "$VAR1"         #agrega usuario existente a sudo
usermod -aG "$VAR1" "$VAR1"      #agrega usuario a su grupo
echo "$VAR1:$VAR2" | chpasswd -m #cambia password