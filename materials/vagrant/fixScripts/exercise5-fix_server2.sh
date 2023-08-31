#!/bin/bash

echo "--------------------exercise5-server2------------------------"

chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys

sudo  chmod 777 /etc/hosts
sudo echo "192.168.60.10 server1" >> /etc/hosts

echo -e "Host server1\n\tStrictHostKeyChecking no\n\tUserKnownHostsFile=/dev/null" >> ~/.ssh/config

sudo apt update
sudo apt-get install sshpass
sshpass -p "vagrant" ssh "vagrant@server1" "sudo ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N ''"
#eval "$(ssh-agent -s)"
sshpass -p "vagrant" ssh "vagrant@server1" "ssh-add  ~/.ssh/id_rsa"
sshpass -p "vagrant" ssh "vagrant@server1" "echo '$(cat ~/.ssh/id_rsa.pub)' >> ~/.ssh/authorized_keys"



