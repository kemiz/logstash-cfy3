#!/bin/bash

# Install JDK
set -x

YUM_CMD=$(which yum)
APT_GET_CMD=$(which apt-get)

ctx logger info "Installing Logstash"
# Get Java
if [[ ! -z $YUM_CMD ]]; then
   sudo rpm --import https://packages.elasticsearch.org/GPG-KEY-elasticsearch
   sudo curl https://raw.githubusercontent.com/kemiz/logstash-cfy3/3.2/logstash-config/logstash.repo | sudo tee /etc/yum.repos.d/logstash.repo
   sudo yum install -y logstash || exit $?
else
   wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
   curl https://packagecloud.io/gpg.key | sudo apt-key add -
   echo "deb http://packages.elastic.co/logstash/1.5/debian stable main" | sudo tee -a /etc/apt/sources.list
   sudo apt-get update && sudo apt-get install logstash || exit $?
fi

ctx logger info "Logstash installed successfully"

