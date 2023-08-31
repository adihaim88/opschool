#!/bin/bash
echo "--------------------exercise5-server1------------------------"
sudo  chmod 777 /etc/hosts
sudo echo "192.168.60.11 server2" >> /etc/hosts
sudo chmod 600 ~/.ssh/authorized_keys
sudo chmod 700 ~/.ssh


sudo -u vagrant ssh-keygen -t rsa -b 4096 -f /home/vagrant/.ssh/id_rsa -N ""
eval "$(ssh-agent -s)"
ssh-add  /home/vagrant/.ssh/id_rsa

echo -e "Host server1\n\tStrictHostKeyChecking no\n\tUserKnownHostsFile=/dev/null" >> /home/vagrant/.ssh/config
sudo chmod 400 /home/vagrant/.ssh/config 

sudo sed -i -e "s/PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config
sudo sed -i -e "s/#PubkeyAuthentication yes/PubkeyAuthentication yes/g" /etc/ssh/sshd_config
sudo sed -i -e "s/#AuthorizedKeysFile/AuthorizedKeysFile/g" /etc/ssh/sshd_config
sudo service ssh restart

#sudo sed -i -e '$a    StrictHostKeyChecking no' /etc/ssh/ssh_config


