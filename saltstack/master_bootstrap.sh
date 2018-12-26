#!/usr/bin/env bash

################################################################################
# SaltStack GUI Setup
################################################################################
sudo yum install -y python-pip
sudo pip install --upgrade pip
sudo pip install cherrypy

sudo systemctl start salt-api
sudo mkdir -p /srv
sudo git clone https://github.com/erwindon/SaltGUI.git /srv
cd /srv

curl --silent --location https://rpm.nodesource.com/setup_8.x | sudo bash -
sudo yum install -y nodejs
curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
sudo rpm --import https://dl.yarnpkg.com/rpm/pubkey.gpg
sudo yum install -y yarn
sudo yarn install

################################################################################
# SaltStack Master Setup
################################################################################

sudo mkdir -p /etc/salt
sudo cp /opt/orka/saltstack/config/master /etc/salt/

curl -o bootstrap-salt.sh -L https://bootstrap.saltstack.com
sudo sh bootstrap-salt.sh -M -N git develop
sudo systemctl start salt-master
