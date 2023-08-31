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
ssh-add  ~/.ssh/id_rsa

echo -e "Host server1\n\tStrictHostKeyChecking no\n\tUserKnownHostsFile=/dev/null" >> ~/.ssh/config

sudo apt update
sudo apt-get install sshpass

#sshpass -p "vagrant" ssh "vagrant@server1" "sudo ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N ''"
#sshpass -p "vagrant" ssh "vagrant@server1" "sudo chmod 700 ~/.ssh"
#eval "$(ssh-agent -s)"
#sshpass -p "vagrant" ssh "vagrant@server1" "$(ssh-agent -s)"
#sshpass -p "vagrant" ssh "vagrant@server1" "ssh-add  ~/.ssh/id_rsa"
#sshpass -p "vagrant" ssh "vagrant@server1" "echo '$(sudo cat ~/.ssh/id_rsa.pub)' >> ~/.ssh/authorized_keys"


#copy key from server to server1
sshpass -p "vagrant" ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub -o StrictHostKeyChecking=no vagrant@server1
#copy key from server1 to server2
server1_public_key=ssh -o StrictHostKeyChecking=no -i ~/.ssh/id_rsa vagrant@192.168.60.10 'cat /home/vagrant/.ssh/id_rsa.pub'
sudo echo "$server1_public_key" >> /home/vagrant/.ssh/authorized_keys




