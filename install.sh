#! /bin/bash

echo "Step 1 - Add the Odoo repository"
#First you will have  to add the Odoo apt repository to your repository database file /etc/apt/sources.list. First, add the Odoo key with this apt command:
wget -O - https://nightly.odoo.com/odoo.key | apt-key add -
#Then add the Odoo repository with the echo command:
echo "deb http://nightly.odoo.com/10.0/nightly/deb/ ./" >> /etc/apt/sources.list
#Note: >> = add the Odoo repository to the last line in sources.list file.
#update the Ubuntu package lists:
sudo apt-get update
#and upgrade:
sudo apt-get upgrade


echo "Step 2 - Configure a Linux user for Odoo"
#Create a new user called odoo with home directory /opt/odoo and the group odoo. You can do it with this command:
sudo adduser --system --home=/opt/odoo --group odoo
#and create a new directory for Odoo in the /var/lib/ directory.
mkdir -p /var/lib/odoo

echo "Step 3 - Install and Configure PostgreSQL"
#Install postgreSQL with this apt-get command:
sudo apt-get install postgresql -y

echo "Step 4 - Install Python dependencies for Odoo 10"
sudo apt-get install python-dateutil python-docutils python-feedparser python-jinja2 python-ldap python-libxslt1 python-lxml python-mako python-mock python-openid python-psycopg2 python-psutil python-pybabel python-pychart python-pydot python-pyparsing python-reportlab python-simplejson python-tz python-unittest2 python-vatnumber python-vobject python-webdav python-werkzeug python-xlwt python-yaml python-zsi poppler-utils python-pip python-pypdf python-passlib python-decorator gcc python-dev mc bzr python-setuptools python-markupsafe python-reportlab-accel python-zsi python-yaml python-argparse python-openssl python-egenix-mxdatetime python-usb python-serial lptools make python-pydot python-psutil python-paramiko poppler-utils python-pdftools antiword python-requests python-xlsxwriter python-suds python-psycogreen python-ofxparse python-gevent

echo "Step 5 - Install Odoo Web Dependencies"
apt-get install -y npm
sudo ln -s /usr/bin/nodejs /usr/bin/node
sudo npm install -g less less-plugin-clean-css
