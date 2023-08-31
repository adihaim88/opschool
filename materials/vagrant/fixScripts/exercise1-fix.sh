#!/bin/bash

echo "--------------------ex1------------------------"

echo "nameserver 192.168.1.1" | sudo tee /etc/resolv.conf.head
sudo systemctl restart systemd-networkd
