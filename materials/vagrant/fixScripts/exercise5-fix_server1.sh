#!/bin/bash

sudo  chmod 777 /etc/hosts
sudo echo "192.168.60.11 server2" >> /etc/hosts
chmod 600 ~/.ssh/authorized_keys
ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N ""
eval "$(ssh-agent -s)"
ssh-add  ~/.ssh/id_rsa
ssh-copy-id -i ~/.ssh/id_rsa.pub "vagrant@server2"

