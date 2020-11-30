#!/bin/bash

# Based on this script, we can install PHP 7.4 in the system
# Here, we will install all the packages for PHP 7.4 in the system.
# Install php7.4 in the linux (Ubuntu 20)


apt update -y
apt get-update -y
apt install openssh-server -y

apt install software-properties-common -y
add-apt-repository ppa:ondrej/php

apt update -y
apt get-update -y

# for git and composer
apt install git -y
apt install composer -y


# for php 7.4
apt install libapache2-mod-php7.4 -y
apt install libphp7.4-embed -y
apt install php7.4 -y
apt install php7.4-bcmath -y 
apt install php7.4-bz2 -y
apt install php7.4-cgi -y
apt install php7.4-cli -y
apt install php7.4-common -y
apt install php7.4-curl -y
apt install php7.4-dba -y
apt install php7.4-dev -y
apt install php7.4-enchant -y
apt install php7.4-fpm -y
apt install php7.4-gd -y
apt install php7.4-gmp -y
apt install php7.4-imap -y
apt install php7.4-interbase -y
apt install php7.4-intl -y
apt install php7.4-json -y
apt install php7.4-ldap -y
apt install php7.4-mbstring -y
apt install php7.4-mysql -y
apt install php7.4-odbc -y
apt install php7.4-opcache -y
apt install php7.4-pgsql -y
apt install php7.4-phpdbg -y
apt install php7.4-pspell -y
apt install php7.4-readline -y
apt install php7.4-recode -y
apt install php7.4-snmp -y
apt install php7.4-soap -y
apt install php7.4-sqlite3 -y
apt install php7.4-sybase -y
apt install php7.4-tidy -y
apt install php7.4-xml -y
apt install php7.4-xmlrpc -y
apt install php7.4-xsl -y
apt install php7.4-zip -y


cd /etc/php/7.4/apache2
cp php.ini php.ini.bak

sed -i 's,^file_uploads =.*$,file_uploads = On,' php.ini
sed -i 's,^allow_url_fopen =.*$,allow_url_fopen = On,' php.ini
sed -i 's,^short_open_tag =.*$,short_open_tag = On,' php.ini
sed -i 's,^memory_limit =.*$,memory_limit = 10G,' php.ini
sed -i 's,^upload_max_filesize =.*$,upload_max_filesize = 1000M,' php.ini
sed -i 's,^max_execution_time =.*$,max_execution_time = 18000,' php.ini
sed -i 's,^date.timezone =.*$,date.timezone = America/Chicago,' php.ini

echo ""
echo ""
echo ""
echo ""
echo ""

grep '^file_uploads ' php.ini
grep '^allow_url_fopen ' php.ini
grep '^short_open_tag ' php.ini
grep '^memory_limit ' php.ini
grep '^upload_max_filesize ' php.ini
grep '^max_execution_time ' php.ini
grep '^date.timezone ' php.ini

echo ""
echo ""
echo ""
echo ""
echo ""


# crate a PHPINFO file in the Root DIR
# ---------------------------------------------------
FILEPATH=/var/www/html/phpinfo.php
echo "<?php
// Show all information, defaults to INFO_ALL
phpinfo();
?>" >> $FILEPATH
# ---------------------------------------------------
