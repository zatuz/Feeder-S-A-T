#!/bin/bash
#variables de user an password
#readonly user="mi-usuario"
#readonly pass="my-password"

echo -n "cual password quieres para $VAR1? pass:"
read -s pass
useradd -m "$VAR1"
usermod -aG sudo "$VAR1"
usermod -aG "$VAR1" "$VAR1"
echo "$VAR1:$pass" | chpasswd -m
chsh -s /bin/bash "$VAR1"
