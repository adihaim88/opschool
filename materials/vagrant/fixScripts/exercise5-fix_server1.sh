#!/bin/bash
#add fix to exercise5-server1 here
ssh-keygen -t rsa -b 4096
eval "$(ssh-agent -s)"
ssh-add  ./id_rsa
