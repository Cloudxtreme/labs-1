#!/bin/bash
# Fail on Errors
set -e

echo 'deb http://ppa.launchpad.net/saltstack/salt/ubuntu trusty main' > /etc/apt/sources.list.d/saltstack-ubuntu-salt-trusty.list
apt-get update
apt-get install -y --force-yes salt-master salt-minion ruby rubygems git
wget https://rubygems.org/downloads/salthiera-0.3.3.gem
gem install salthiera -v 0.3.3 --no-rdoc --no-ri
cp /vagrant/bootstrap/salt/saltmaster/master /etc/salt/master
cp /vagrant/bootstrap/salt/saltmaster/minion /etc/salt/minion
cp /vagrant/bootstrap/salt/saltmaster/salthiera.py /usr/lib/python2.7/dist-packages/salt/pillar/salthiera.py
ln -s /srv/salt/salthiera.yaml /etc/salt/salthiera.yaml 
ln -s /srv/salt/salthiera.yaml /etc/salthiera.yaml 

systemctl enable salt-master
systemctl enable salt-minion
systemctl restart salt-master
echo -n "Sleeping for 5 seconds to wait for salt-master."
for i in 1 2 3 4 5 ; do
  sleep 1
  echo -n "."
done
salt-call state.highstate --force-color
