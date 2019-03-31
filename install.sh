#!/bin/bash
#iniciamos el primer script para crear usuario
echo "si ingresas un usuario que no existe se acreara el usuario"
echo -n "que usuario quieres usar? user:"
read user

if grep -qi "^$user:" /etc/passwd ; then
	id $user 
	sed -i '5i readlony user="$user"' script/1.1-olduser.sh
	. "script/1.1-olduser.sh"
else
	sed -i '5i readlony user="$user"' script/1.-newuser.sh
	. "script/1.-newuser.sh"	
fi
. 