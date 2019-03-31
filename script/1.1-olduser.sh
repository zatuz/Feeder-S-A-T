#!/bin/bash
#user creado 
# se declara la variable user
#readonly user="zatuz"
echo -n "cual password quieres para $VAR1? pass:"
read -s pass
usermod -aG sudo "$VAR1" 
usermod -aG "$VAR1" "$VAR1" 
echo "$VAR1:$pass" | chpasswd -m 