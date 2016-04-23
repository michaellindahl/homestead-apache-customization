#!/bin/sh

# If you would like to do some extra provisioning you may
# add any commands you wish to this file and they will
# be run after the Homestead machine is provisioned.

sudo apt-get -qq -u update
sudo apt-get install -y apache2
sudo service nginx stop
sudo a2enmod rewrite
sudo service apache2 start
