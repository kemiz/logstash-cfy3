#!/bin/bash

# Install JDK
set -x

YUM_CMD=$(which yum)
APT_GET_CMD=$(which apt-get)

ctx logger info "Installing Java"
# Get Java
if [[ ! -z $YUM_CMD ]]; then
   sudo yum -y -q install java-1.7.0-openjdk
   ctx logger info "Java installed succesfully" || exit $?
else
   sudo apt-get update
   sudo apt-get -f install libdevmapper-event1.02.1
   sudo apt-get -qq --no-upgrade install openjdk-7-jdk
   ctx logger info "Java installed succesfully" || exit $?
fi

