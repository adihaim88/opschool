#!/bin/bash

sudo chmod /etc/apache2/sites-available/000-default.conf
sudo sed '32,35d' /etc/apache2/sites-available/000-default.conf
sudo systemctl restart apache2

