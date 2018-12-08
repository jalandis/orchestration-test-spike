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