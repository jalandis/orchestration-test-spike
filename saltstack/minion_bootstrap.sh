#!/usr/bin/env bash

sudo mkdir -p /etc/salt
sudo cp /opt/orka/saltstack/config/minion /etc/salt/

sudo mkdir -p /etc/salt/pki/minion
sudo cp /opt/orka/saltstack/config/insecure.pem /etc/salt/pki/minion/minion.pem
sudo cp /opt/orka/saltstack/config/insecure.pub /etc/salt/pki/minion/minion.pub

curl -o bootstrap-salt.sh -L https://bootstrap.saltstack.com
sudo sh bootstrap-salt.sh git develop
sudo systemctl start salt-minion
