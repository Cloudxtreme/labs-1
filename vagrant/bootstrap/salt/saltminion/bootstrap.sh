#!/bin/bash
# Fail on Errors
set -e

echo 'deb http://ppa.launchpad.net/saltstack/salt/ubuntu trusty main' > /etc/apt/sources.list.d/saltstack-ubuntu-salt-trusty.list

apt-get update
apt-get install -y --force-yes salt-minion

rm -f /etc/salt/minion_id
cp /vagrant/bootstrap/salt/saltminion/minion /etc/salt/minion

systemctl enable salt-minion
service salt-minion restart
echo -n "Sleeping for 5 seconds to wait for salt-minion."
for i in 1 2 3 4 5 ; do
  sleep 1
  echo -n "."
done
salt-call state.highstate --force-color
