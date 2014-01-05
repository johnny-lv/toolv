#!/bin/bash

# - Install Server
installServer() {
    echo ">>>>>>>>>>>>>>>>>>Start installing Denyhosts..."
    yes|sudo apt-get install openssh-server denyhosts
    echo ">>>>>>>>>>>>>>>>>>Denyhost installed successfylly!"
}

# - Create OpenERP user 
createOpenERPUser() {
    echo ">>>>>>>>>>>>>>>>>>Start Creating OpenERP user"
    yes|sudo adduser --system --home=/opt/openerp --group opener
    echo ">>>>>>>>>>>>>>>>>>Created successfully!"
}

# - Install PostgreSQL 
installPostgreSQL() {
    echo ">>>>>>>>>>>>>>>>>>Start installing PostgreSQL..."
    yes|sudo apt-get install postgresql
    echo ">>>>>>>>>>>>>>>>>>PostgreSQL installed successfylly!"
}

# - Install dependent Python lib 
installPythonLibs() {
    echo ">>>>>>>>>>>>>>>>>>Start installing Python libs..."
    yes|sudo apt-get install python-dateutil python-docutils python-feedparser python-gdata python-jinja2 python-ldap python-libxslt1.1 python-lxml python-mako python-mock python-openid python-psycopg2 python-psutil python-pybabel python-pychart python-pydot python-pyparsing python-reportlab python-simplejson python-tz python-unittest2 python-vatnumber python-vobject python-webdav python-werkzeug python-xlwt python-yaml python-zsi
    echo ">>>>>>>>>>>>>>>>>>Python libs installed successfylly!"
}

# - Install OpenERP server 
installOpenERPServer() {
    echo ">>>>>>>>>>>>>>>>>>Start installing OpenERP server..."
    wget http://nightly.openerp.com/7.0/nightly/src/openerp-7.0-latest.tar.gz
    cd /opt/openerp
    yes|sudo tar xvf ~openerp-7.0-latest.tar.gz
    sudo chmod -R openerp.*
    sudo cp -a openerp-7.0 server

    # - Config

    echo ">>>>>>>>>>>>>>>>>>OpenERP server installed successfylly!"
}

## Intall OpenERP in Ubuntu
#sudo apt-get update
#sudo apt-get upgrade

read -p "Ready to install?" RESP
if [ "$RESP" = "y" ]; then
    echo ">>>>>>>>>>>>>>Now begin!"
    installServer
    createOpenERPUser
    installPostgreSQL
    installPythonLibs
    installOpenERPServer
fi

