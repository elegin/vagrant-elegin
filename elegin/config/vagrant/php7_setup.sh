#!/usr/bin/env bash

echo "=== Begin Vagrant Provisioning using 'config/vagrant/php7_setup.sh'"

# Install Git if not available
if [ -z `which php` ]; then
  echo "===== Installing ppa for php 7"
  sudo add-apt-repository ppa:ondrej/php -y
  sudo apt-get -y -qq update
  echo "===== Installing php 7"
  sudo apt-get install -y -qq --force-yes php7.0-common php7.0-dev php7.0-json php7.0-opcache php7.0-cli libapache2-mod-php7.0 php7.0 php7.0-mysql php7.0-fpm php7.0-curl php7.0-gd php7.0-mcrypt php7.0-mbstring php7.0-bcmath php7.0-zip
  echo "===== Configure PHP.ini --"
  sudo sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php/7.0/apache2/php.ini
  sudo sed -i "s/display_errors = .*/display_errors = On/" /etc/php/7.0/apache2/php.ini

fi

echo "=== End Vagrant Provisioning using 'config/vagrant/php7_setup.sh'"
