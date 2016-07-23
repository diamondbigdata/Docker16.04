#!/bin/bash
set -e
source /bd_build/buildconfig
set -x

CONFD_BUILD_PATH=/bd_build/services/confdsvc

## Install the confd
$minimal_apt_get_install openssh-server

# Install confd
cp $CONFD_BUILD_PATH/confd-0.11.0-linux-amd64 /usr/bin/confd && chmod +x /usr/bin/confd

mkdir /var/run/confd
mkdir /etc/service/confd
#touch /etc/service/confd/down
cp $CONFD_BUILD_PATH/confd.runit /etc/service/confd/run

mkdir /var/run/monit
mkdir /etc/service/monit
#touch /etc/service/monit/down
cp $CONFD_BUILD_PATH/monit.runit /etc/service/monit/run


mkdir -p /var/log/supervisor
mkdir -p /etc/confd/conf.d
mkdir -p /etc/confd/templates

# Add confd tmpl and toml
cp $CONFD_BUILD_PATH/confd/*.toml /etc/confd/conf.d/
cp $CONFD_BUILD_PATH/confd/*.tmpl /etc/confd/templates/

# Add monit conf for services
cp $CONFD_BUILD_PATH/monit/*.conf /etc/monit/conf.d/

cp $CONFD_BUILD_PATH/confd-start.sh /usr/bin/confd-start.sh
chmod 755 /usr/bin/confd-start.sh