#!/bin/bash
#user creado 
# se declara la variable user
#readonly user="zatuz"

echo -n "que ppasword quieres usar? pass:"
read pass

usermod -aG sudo "$user" && \
usermod -aG "$user" "$user" &&\
echo "$pass" | passwd "$user" --stdin	
