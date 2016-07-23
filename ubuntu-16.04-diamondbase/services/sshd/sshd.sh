#!/bin/bash
set -e
source /bd_build/buildconfig
set -x

SSHD_BUILD_PATH=/bd_build/services/sshd

## Install the SSH server.
$minimal_apt_get_install openssh-server
mkdir /var/run/sshd
mkdir /etc/service/sshd
#touch /etc/service/sshd/down
cp $SSHD_BUILD_PATH/sshd.runit /etc/service/sshd/run
cp $SSHD_BUILD_PATH/sshd_config /etc/ssh/sshd_config

## Gen default SSH key .
rm -f /etc/ssh/ssh_host_dsa_key /etc/ssh/ssh_host_rsa_key /etc/ssh/ssh_host_ecdsa_key /etc/ssh/ssh_host_ed25519_key /root/.ssh/id_rsa
ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key
ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key
ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_ecdsa_key
ssh-keygen -q -N "" -t ed25519 -f /etc/ssh/ssh_host_ed25519_key
ssh-keygen -q -N "" -t rsa -f /root/.ssh/id_rsa
cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys
cp $SSHD_BUILD_PATH/ssh_config /root/.ssh/config 
