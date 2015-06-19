#!/bin/bash

#SALTMASTER=$(grep SALTMASTER config/servers.rb | awk '{print $3}' | sed "s/'//g")
SALTMASTER="192.168.123.1"

echo "${SALTMASTER} salt salt.apt-forge.vagrant" >> /etc/hosts
