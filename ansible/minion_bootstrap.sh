#!/usr/bin/env bash

################################################################################
# Anisble Minion Setup
################################################################################

mkdir -p /root/.ssh
sudo cat /opt/orka/ansible/config/id_rsa.pub >> /root/.ssh/authorized_keys
sudo chmod 600 /root/.ssh/authorized_keys
