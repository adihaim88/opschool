#!/bin/bash

echo "--------------------exercise5-server2------------------------"

chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys

sudo  chmod 777 /etc/hosts
sudo echo "192.168.60.10 server1" >> /etc/hosts
sshpass -p "vagrant" ssh "vagrant@server1" "echo '$(cat ~/.ssh/id_rsa.pub)' >> ~/.ssh/authorized_keys"


