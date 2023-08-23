#!/bin/bash

sudo  chmod 777 /etc/hosts
sudo echo "192.168.60.11 server2" >> /etc/hosts
ssh-keygen -t rsa -b 4096
eval "$(ssh-agent -s)"
ssh-add  ./id_rsa

