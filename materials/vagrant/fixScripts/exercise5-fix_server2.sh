#!/bin/bash
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys

sudo sed -i -e "s/#PubkeyAuthentication yes/PubkeyAuthentication yes/g" /etc/ssh/sshd_config
sudo echo "AuthorizedKeysFile  .ssh/authorized_keys" >> /etc/ssh/sshd_config

