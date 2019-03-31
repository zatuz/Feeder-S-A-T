#!/bin/bash
#iniciamos el primer script para crear usuario
echo "si ingresas un usuario que no existe se acreara el usuario"
echo -n "que usuario quieres usar? user:"
read user
readonly dep1="script/3.-dep-1.sh"
readonly docker="script/4.-installdocker.sh"
export 	VAR1="$user"
if [ grep -qi "^$user:" /etc/passwd ]; then
	. "script/1.1-olduser.sh"
else
	. "script/1.-newuser.sh"	
fi
echo "\%$user ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/$user
cp -r ../Feeder-S-A-T /home/$user/
chown -R $user:$user  /home/$user/Feeder-S-A-T
su $user
cd  ~/Feeder-S-A-T
sudo ./"$dep1"
sudo ./"$docker"

