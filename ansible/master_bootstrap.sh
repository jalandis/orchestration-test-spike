#!/usr/bin/env bash

################################################################################
# Ansible Master Setup
################################################################################

sudo mkdir -p /root/.ssh
sudo cp /opt/orka/ansible/config/id_rsa /root/.ssh/id_rsa
sudo cp /opt/orka/ansible/config/id_rsa.pub /root/.ssh/id_rsa.pub
sudo chmod 700 /root/.ssh/id_rsa
sudo chmod 644 /root/.ssh/id_rsa.pub

sudo yum install -y ansible

# Simple ping test.
sudo ansible all -m ping

################################################################################
# Ansible Tower Setup
################################################################################
TOWER_ARTIFACTORY=https://releases.ansible.com/ansible-tower/setup
TOWER_VERSION=3.4.1-1

mkdir -p /opt/ansible
cd /opt/ansible

sudo curl -o "ansible-tower-setup-${TOWER_VERSION}.tar.gz" \
  -L "${TOWER_ARTIFACTORY}/ansible-tower-setup-${TOWER_VERSION}.tar.gz"
sudo tar xvzf "ansible-tower-setup-${TOWER_VERSION}.tar.gz"
cd "ansible-tower-setup-${TOWER_VERSION}"

sudo cp /opt/orka/ansible/config/tower_inventory \
  "/opt/ansible/ansible-tower-setup-${TOWER_VERSION}/inventory"

sudo ./setup.sh
