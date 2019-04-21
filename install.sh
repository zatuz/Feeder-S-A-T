#!/bin/bash
set -o pipefail
##variables para usuario
echo -E "##############################################################"
echo -E "#si ingresas un usuario si no existe se acreara el usuario   #"
echo -E "#si el usuario existe añadira a grupos                       #"
echo -E "#NOTA si quieres tambien puedes cambiarle el pass al user    #"
echo -E "#que existe de lo contrario pon la misma contrasña           #"
echo -E "##############################################################"
echo -n "que usuario quieres usar? user:"
read -r  user
echo -n "cual password quieres para $user? pass:"
read -r -s pass
export  VAR1="$user"
export  VAR2="$pass"
clear
# verifica usuario para crear o modificar
if   grep -qi ^"$user": /etc/passwd; then
        . "script/user.sh"
        echo
        echo "el usuario fue modificado"
elif [ "$0" != 0 ]; then
        . "script/newuser.sh"
        echo
        echo "el usuario fue creado exitosamente"

else
        if  [ -f /etc/passwd ]; then
            grep -q -F ^"$user" '/etc/passwd' ||
            echo
            echo "tubimos problemas para realizar nuestro trabajo"
            echo "intentalo con permisos root"
            exit
        fi
 fi
sleep 4
#corremos el primer script de dependencias primarias como root
echo
echo "instalando las dependencias primarias"
. "script/dep.sh"
#corremos el segundo script de repositorios oficiales como root
echo
echo "instalando los repocitorios oficiales"
. "script/repoficial.sh"
# corremos el 3er script de docker
echo
echo "instalando los repocitorios oficiales de docker"
. "script/repdock.sh"
#corremos script ansible reposit
. "script/repansible.sh"
#iniciamos repnode.sh
. "script/repnode.sh"
#corremos ultimo script como user
echo "%$user ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/"$user"
echo
echo "instalaremos los programas con el usuario creado"
sudo -u "$user" -p "$pass" "script/compose.sh"; "./script/final.sh"
usermod -aG docker "$user"
su - "$user"