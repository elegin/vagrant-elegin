#!/usr/bin/env bash

echo "=== Begin Vagrant Provisioning using 'config/vagrant/apache2_setup.sh'"

# Install Git if not available
if [ -z `which apache2` ]; then
  echo "===== Installing apache2"
  sudo apt-get install -y -qq --force-yes apache2
  sudo apt-get -y -qq update
  echo "===== Enable apache2 modules --"
  sudo a2enmod rewrite

  echo "===== Creating virtual hosts "
  mkdir /var/www/elegin.dev/public
  sudo a2dissite 000-default.conf
  cat << EOF | sudo tee -a /etc/apache2/sites-available/default.conf
  <VirtualHost *:80>
    DocumentRoot "/var/www/elegin.dev/public"
    ServerName elegin.dev

    <Directory "/var/www/elegin.dev/public">
        AllowOverride All
        Order allow,deny
        Allow from all
    </Directory>
    </VirtualHost>
EOF

  sudo a2ensite default.conf


  echo "===== Restart Apache"
  sudo /etc/init.d/apache2 restart

fi

echo "=== End Vagrant Provisioning using 'config/vagrant/apache2_setup.sh'"
