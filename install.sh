#!/bin/bash
set -o pipefail
#iniciamos el primer script para crear usuario
#readonly dep1="script/3.-dep-1.sh"
#readonly docker="script/4.-installdocker.sh"
##variables para usuario
echo "si ingresas un usuario que no existe se acreara el usuario"
echo -n "que usuario quieres usar? user:"
read -r  user
echo -n "cual password quieres para $user? pass:"
read -r -s pass
export  VAR1="$user"
export  VAR2="$pass"
# verifica usuario para crear o modificar
if   grep -qi ^"$user": /etc/passwd; then
        . script/2olduser.sh
else
        . script/1newuser.sh
 fi
#crea archivo sudoers
#echo "%$user ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/"$user"
#cp -r /home/zatuz/Feeder-S-A-T /home/"$user"/ > /dev/null 2>&1
#chown -R "$user":"$user"  /home/"$user"/Feeder-S-A-T
#corremos primer script como su root
  . "script/3dep.sh"
#corremos ultimo script como user
sudo -u "$user" -p"$pass" "script/4depusr.sh"
