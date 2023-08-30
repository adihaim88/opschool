#!/bin/bash
echo "--------------------exercise5-server1------------------------"


sudo  chmod 777 /etc/hosts
sudo echo "192.168.60.11 server2" >> /etc/hosts
chmod 600 ~/.ssh/authorized_keys

ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N ""
eval "$(ssh-agent -s)"
ssh-add  ~/.ssh/id_rsa

sudo sed -i -e "s/#PubkeyAuthentication yes/PubkeyAuthentication yes/g" /etc/ssh/sshd_config
sudo sed -i -e "s/#AuthorizedKeysFile/AuthorizedKeysFile/g" /etc/ssh/sshd_config

echo -e "Host server2\n\tStrictHostKeyChecking no\n\tUserKnownHostsFile=/dev/null" >> ~/.ssh/config


sudo apt-get install sshpass
sshpass -p 'vagrant' ssh-copy-id vagrant@server2


