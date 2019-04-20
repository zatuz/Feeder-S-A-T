##repositorios para node js y npm
echo
echo "instalando repo nodejs"
curl -sL https://deb.nodesource.com/setup_11.x | bash -
sudo apt update; sudo apt upgrade -y; sudo apt-get install -y nodejs
## dependencia para ansible
if [ -f  /etc/apt/sources.list.d/ansible ]; then
    if [ $? != 0 ]; then touch /etc/apt/sources.list.d/ansible fi
    grep -q -F 'deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main' /etc/apt/sources.list.d/ansible || \
        echo '#deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main' >> /etc/apt/sources.list.d/ansible
fi
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
sudo apt-get update