#!/bin/bash
set -o pipefail
#se configura timezone de forma automatica
#utilizaremos curl para conseguir la zona
#se usara la pagina web http://ip-api.com/line?fields=timezone  para detectar zona horaria
#comando "ln -sf" nos servira para genar un enlaze simbolico del archivo /usr/share/zoneinfo/lugar/zona_actual al archivo /etc/localtime
#opcion que me funciono utilizar timedatectl set-timezone con el comando curl consiguiendo la info de la pagina de arriba
echo "para algunos programas o contenedores utilizan la zona horaria"
echo "tu zona horaria actual es $(date)"
echo "segun la zona horaria que deverias manejar es $(curl -sSL http://ip-api.com/line?fields=timezone)"
echo "perdona el proceso anterior pero mi programador es un novato te pido que lo perdones"
echo "quieres configurar la zona horaria [y=si][n=no]"
read -r TIEMPO
if [ "$TIEMPO" == "y" ]; then
    echo "de acuerdo as aceptado que modifiquemos la zona horaria"
    echo "en unos momentos tendras tu zona horaria correcta"
    timedatectl set-timezone "$(curl -sSL http://ip-api.com/line?fields=timezone)"

elif [ "$TIEMPO" == "n" ]; then
    echo "bien tu mandas yo solo soy un script que intenta ayudar"
    echo "continuamos"
fi
sleep 2