#!/bin/bash
#add fix to exercise2 here
sudo  chmod 777 /etc/hosts
sudo sed -i -e "s/127.0.0.1/#127.0.0.1/g" /etc/hosts
sudo systemctl restart systemd-resolved
