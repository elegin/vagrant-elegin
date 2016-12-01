#!/usr/bin/env bash

echo "=== Begin Vagrant Provisioning using 'config/vagrant/composer_setup.sh'"

# Install Git if not available
if [ -z `which composer` ]; then
  echo "===== Installing composer"
  curl -s https://getcomposer.org/installer | php
  sudo mv composer.phar /usr/local/bin/composer
  sudo chmod +x /usr/local/bin/composer
fi

echo "=== End Vagrant Provisioning using 'config/vagrant/composer_setup.sh'"
