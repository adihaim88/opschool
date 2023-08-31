#!/bin/bash

echo "--------------------ex1------------------------"


#sudo sed -i -e "s/#DNS=/DNS=192.168.1.1/g"  /etc/systemd/resolved.conf
#sudo sed -i -e "s/#FallbackDNS=/FallbackDNS=192.168.60.10 192.168.1.1/g"  /etc/systemd/resolved.conf
echo "nameserver 192.168.1.1" | sudo tee /etc/resolv.conf.head
sudo systemctl restart systemd-networkd
