#!/bin/bash
#iniciamos el primer script para crear usuar
readonly dep1="script/3.-dep-1.sh"
readonly docker="script/4.-installdocker.sh"
echo "si ingresas un usuario que no existe se acreara el usuario"
echo -n "que usuario quieres usar? user:"
read user
export 	VAR1="$user"
if grep -qi "^$user:" /etc/passwd ; then
	. "script/1.1-olduser.sh"
else
	. "script/1.-newuser.sh"	
fi
echo "%$user ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/$user
su "$user"
cd ~
sudo ./"$dep1"
sudo ./"$docker"