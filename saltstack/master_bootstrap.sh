#!/usr/bin/env bash

################################################################################
# SaltStack Master Setup
################################################################################

sudo mkdir -p /etc/salt
sudo cp /opt/orka/saltstack/config/master /etc/salt/

curl -o bootstrap-salt.sh -L https://bootstrap.saltstack.com
sudo sh bootstrap-salt.sh -M -N git develop
sudo systemctl start salt-master
