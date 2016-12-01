#!/usr/bin/env bash

echo "=== Begin Vagrant Provisioning using 'config/vagrant/build_dependency_setup.sh'"

# Install build dependencies for a sane build environment
sudo apt-get -y -qq update
sudo apt-get -y -qq install zip unzip autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev ruby-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev liblzma-dev libgmp-dev
sudo apt-get -y -qq update
sudo apt-get -y -qq install curl vim wget python-software-properties

echo "=== End Vagrant Provisioning using 'config/vagrant/build_dependency_setup.sh'"
