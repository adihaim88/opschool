#!/bin/bash

echo "--------------------ex1------------------------"


sudo sed -i -e "s/#DNS=/DNS=192.168.1.1/g"  /etc/systemd/resolved.conf
sudo sed -i -e "s/#FallbackDNS=/FallbackDNS=192.168.60.10 192.168.1.1/g"  /etc/systemd/resolved.conf

#sudo shutdown -h now
