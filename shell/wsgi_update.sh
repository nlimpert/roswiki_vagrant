#!/bin/sh
# Update mod_wsgi due to incompatibility in the moin-script of wiki
if [ "${FOUND_APT}" -eq '0' ]; then
  apt-get -q -y install apache2-dev python-pip
  echo 'apache2-dev installed.'
fi
pip install mod_wsgi
pip install moin

printf "#LoadModule wsgi_module /usr/lib/apache2/modules/mod_wsgi.so\nLoadModule wsgi_module /usr/local/lib/python2.7/dist-packages/mod_wsgi/server/mod_wsgi-py27.so" > /etc/apache2/mods-available/wsgi.load

service apache2 restart
