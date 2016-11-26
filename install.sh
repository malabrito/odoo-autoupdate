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


echo "Step 1 - Configure a Linux user for Odoo"
#Create a new user called odoo with home directory /opt/odoo and the group odoo. You can do it with this command:
sudo adduser --system --home=/opt/odoo --group odoo
#and create a new directory for Odoo in the /var/lib/ directory.
mkdir -p /var/lib/odoo

echo "Step 2 - Install and Configure PostgreSQL"
#Install postgreSQL with this apt-get command:
sudo apt-get install postgresql -y
su - postgres
createuser --createdb --username postgres --no-createrole --no-superuser --pwprompt odoo
Swing2016


echo "Step 3 - Install Python dependencies for Odoo 10"
sudo apt-get install python-dev libxml2-dev libxslt1-dev zlib1g-dev -y
sudo apt-get install python-cups python-dateutil python-decorator python-docutils python-feedparser \
python-gdata python-geoip python-gevent python-imaging python-jinja2 python-ldap python-libxslt1 \
python-lxml python-mako python-mock python-openid python-passlib python-psutil python-psycopg2 \
python-pybabel python-pychart python-pydot python-pyparsing python-pypdf python-reportlab python-requests \
python-simplejson python-tz python-unicodecsv python-unittest2 python-vatnumber python-vobject \
python-werkzeug python-xlwt python-yaml wkhtmltopdf -y

echo "Step 4 - Install Odoo Web Dependencies"
apt-get install -y npm
sudo ln -s /usr/bin/nodejs /usr/bin/node
sudo npm install -g less less-plugin-clean-css
