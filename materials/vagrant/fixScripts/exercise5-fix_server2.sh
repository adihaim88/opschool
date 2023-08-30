#!/bin/bash

echo "--------------------exercise5-server2------------------------"

chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys

sudo  chmod 777 /etc/hosts
sudo echo "192.168.60.10 server1" >> /etc/hosts

ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N ""
eval "$(ssh-agent -s)"
ssh-add  ~/.ssh/id_rsa

sudo sed -i -e "s/#PubkeyAuthentication yes/PubkeyAuthentication yes/g" /etc/ssh/sshd_config
sudo sed -i -e "s/#AuthorizedKeysFile/AuthorizedKeysFile/g" /etc/ssh/sshd_config
sudo service ssh restart

#echo -e "Host server1\n\tStrictHostKeyChecking no\n\tUserKnownHostsFile=/dev/null" >> ~/.ssh/config
server1_public_key=ssh -o StrictHostKeyChecking=no -i ~/.ssh/id_rsa vagrant@192.168.60.10 'cat ~/.ssh/id_rsa.pub'
sudo echo "$server1_public_key" >> ~/.ssh/authorized_keys

echo "Public key added to authorized_keys on server2."


#sudo apt update
#sudo apt-get install sshpass

#sshpass -p 'vagrant' ssh-copy-id vagrant@server1
