#!/usr/bin/env bash

while [[ $# -gt 0 ]]
do
    key="${1}"
    case ${key} in
        --minion)
            minion="${2}"
            shift ;;
    esac
    shift
done

################################################################################
# Ansible register Minions
################################################################################

echo "${minion}"
mkdir -p /etc/ansible
echo "${minion}" >> /etc/ansible/hosts

mkdir -p /root/.ssh
sudo ssh-keyscan -H "${minion}" 2>/dev/null >> /root/.ssh/known_hosts
