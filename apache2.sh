#!/bin/bash

# Here, we are going to install web service in the server.
# For web service, we are going to install Apache 2.
# Install Web Service in the Linux (Ubuntu 18 or 19)

hostnamectl
hostnamectl set-hostname web-server

apt update -y
apt-get update -y

apt install apache2 -y


systemctl stop apache2.service
systemctl start apache2.service
systemctl enable apache2.service
systemctl restart apache2.service

mv /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf.bak

APA_FILE=/etc/apache2/sites-available/000-default.conf
echo "<VirtualHost *:80>
        ServerAdmin admin@example.com
        DocumentRoot /var/www/html/
        ServerName example.com
        ServerAlias www.example.com
        <Directory /var/www/html/>
                Options Indexes FollowSymLinks MultiViews
                AllowOverride All
                Order allow,deny
                allow from all
        </Directory>
        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>" >> $APA_FILE

systemctl stop apache2.service
systemctl start apache2.service
systemctl enable apache2.service
systemctl restart apache2.service		
a2ensite 000-default.conf
a2enmod rewrite
systemctl restart apache2.service
echo ""
echo ""
