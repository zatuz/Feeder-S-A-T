#!/bin/bash
set -o pipefail
##variables para usuario
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi
echo -E "##############################################################"
echo -E "#hola soy sCRiboot, se que no es el mejor nombre             #"
echo -E "#pero mi programador tiene pesima imaginacion que mas ago    #"
echo -E "#Yo te apoyare con la configuracion de la maquina            #"
echo -E "#si mi creador tambien es algo flojo y aunque se esforzo     #"
echo -E "#en crearme lo iso solo para evitar la fatija en el futuro   #"
echo -E "#bueno empezemos empezaremos con un usuario y contraseña     #"
echo -E "#si ingresas un usuario y no existe lo creare inmediatamente #"
echo -E "#si el usuario existe lo agregare a los grupos necesarios    #"
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
        echo "el usuario no existia pero"
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

echo "para algunos programas o contenedores utilizan la zona horaria"
echo "tu zona horaria actual es $(date)"
echo "segun la zona horaria que deverias manejar es $(curl http://ip-api.com/line?fields=timezone)"
echo "perdona el proceso anterior pero mi programador es un novato te pido que lo perdones"
echo "quieres configurar la zona horaria [y=si][n=no]"
read -r TIEMPO
if [ "$TIEMPO" == "y" ]; then
    echo "de acuerdo as aceptado que modifiquemos la zona horaria"
    echo "en unos momentos tendras tu zona horaria correcta"
    timedatectl set-timezone $(curl http://ip-api.com/line?fields=timezone)
elif [ "$TIEMPO" == "n" ]; then
    echo "bien tu mandas yo solo soy un script que intenta ayudar"
    echo "continuamos"
fi
sleep 2
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
echo "instalando los repocitorios oficiales de ansible"
. "script/repansible.sh"
#iniciamos repnode.sh
echo "instalando los repocitorios oficiales de nodejs"
. "script/repnode.sh"
#corremos ultimo script como user
echo "%$user ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/"$user"
echo
echo "instalaremos los programas con el usuario creado"
sudo -u "$user" -p "$pass" "script/compose.sh"; "./script/final.sh"
usermod -aG docker "$user"
sudo rm /etc/sudoers.d/"$user"
su - "$user"