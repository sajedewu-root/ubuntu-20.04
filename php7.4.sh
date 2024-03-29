#!/bin/bash

# Based on this script, we can install PHP 7.4 in the system
# Here, we will install all the packages for PHP 7.4 in the system.
# Install php7.4 in the linux (Ubuntu 20)


apt update -y
apt-get update -y
apt install openssh-server -y

apt install software-properties-common -y
add-apt-repository ppa:ondrej/php

apt update -y
apt-get update -y
apt upgrade -y

# for git and composer
apt-get install git -y
apt-get install curl -y
apt-get install unzip -y
apt-get install vim -y

curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
HASH=`curl -sS https://composer.github.io/installer.sig`
php -r "if (hash_file('SHA384', '/tmp/composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer
composer


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


# PHP configuration file located

cd $(dirname "$(php -i | grep /.+/php.ini -oE)")

sed -i 's,^file_uploads =.*$,file_uploads = On,' php.ini
sed -i 's,^allow_url_fopen =.*$,allow_url_fopen = On,' php.ini
sed -i 's,^short_open_tag =.*$,short_open_tag = On,' php.ini
sed -i 's,^memory_limit =.*$,memory_limit = 10G,' php.ini
sed -i 's,^upload_max_filesize =.*$,upload_max_filesize = 1000M,' php.ini
sed -i 's,^max_execution_time =.*$,max_execution_time = 18000,' php.ini
sed -i 's,^date.timezone =.*$,date.timezone = America/Chicago,' php.ini
sed -i 's,^zlib.output_compression =.*$,zlib.output_compression = on,' php.ini
sed -i 's,^realpath_cache_size =.*$,realpath_cache_size = 10M,' php.ini
sed -i 's,^realpath_cache_ttl =.*$,realpath_cache_ttl = 7200,' php.ini


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
grep '^zlib.output_compression ' php.ini
grep '^realpath_cache_size ' php.ini
grep '^realpath_cache_ttl ' php.ini



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
