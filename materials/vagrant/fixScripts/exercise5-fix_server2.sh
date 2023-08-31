#!/bin/bash

echo "--------------------exercise5-server2------------------------"

chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys

sudo  chmod 777 /etc/hosts
sudo echo "192.168.60.10 server1" >> /etc/hosts

sudo sed -i -e "s/#PubkeyAuthentication yes/PubkeyAuthentication yes/g" /etc/ssh/sshd_config
sudo sed -i -e "s/#AuthorizedKeysFile/AuthorizedKeysFile/g" /etc/ssh/sshd_config
sudo service ssh restart

sudo -u vagrant ssh-keygen -t rsa -b 4096 -f /home/vagrant/.ssh/id_rsa -N ""
eval "$(ssh-agent -s)"
ssh-add  /home/vagrant/.ssh/id_rsa

sudo echo "Host server1\n\tStrictHostKeyChecking no\n\tUserKnownHostsFile=/dev/null" >> /etc/ssh/ssh_config
sudo chmod 600 /etc/ssh/ssh_config

sudo apt update
sudo apt-get install sshpass


#copy key from server2 to server1
sshpass -p "vagrant" ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub -o StrictHostKeyChecking=no vagrant@server1

#copy key from server1 to server2
server1_public_key=ssh -o StrictHostKeyChecking=no -i /home/vagrant/.ssh/id_rsa vagrant@192.168.60.10 'cat /home/vagrant/.ssh/id_rsa.pub'

echo "This is the server1_public_key : $server1_public_key"
sudo echo "$server1_public_key" >> /home/vagrant/.ssh/authorized_keys




