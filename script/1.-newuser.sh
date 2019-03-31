#!/bin/bash
#variables de user an password
#readonly user="mi-usuario"
#readonly pass="my-password"

echo -n "que ppasword quieres usar? pass:"
read pass
useradd -m "$user"
usermod -aG sudo "$user"
usermod -aG "$user" "$user"
echo "$pass" | passwd "$user" --stdin
chsh -s /bin/bash "$user"
su "$user"

## opcion 1 de variables para user an password
#read -p "Enter your username: " username
#read -sp "Enter your password: " password
## si no funciona la variable username y password usar este script para el password
#!/bin/bash
# Read Password
#echo -n Password: 
#read -s password
#echo
# Run Command
#echo $password

## script para el pasword
#echo thePassword | passwd $user --stdin

