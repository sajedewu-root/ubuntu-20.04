#!/bin/bash

# Install MariaDB in the Linux (Ubuntu 18 or 19)

apt update -y
apt-get update -y

apt install mariadb-server -y
apt install mariadb-client -y

systemctl start mariadb.service
systemctl enable mariadb.service
systemctl stop mariadb.service
systemctl restart mariadb.service
systemctl enable mariadb.service

mysql_secure_installation


clear
echo ""
echo ""
echo ""
echo "***************************************************************************"
echo -e "\e[1;32mPlease complete the configuration in the database: ----  \e[0m  "
echo "***************************************************************************"
echo ""
echo -n -e "\e[1;33mEnter the database root password: ---- \e[0m "; read PASSWORD
echo ""

# To create an new user id and password in the database
echo ""
echo -n -e "\e[1;33mEnter the new user id: ---- \e[0m "; read CREATE_USER_NAME
echo ""
echo ""
echo -n -e "\e[1;33mEnter the new user password: ---- \e[0m "; read USER_PASSWORD
echo ""
echo ""
echo -n -e "\e[1;33mPlease Enter the database name: ---- \e[0m "; read DB
echo ""
echo ""
echo ""
echo ""
mysql -u root -p$PASSWORD -e "CREATE DATABASE $DB;"
mysql -u root -p$PASSWORD -e "CREATE USER '$CREATE_USER_NAME'@'localhost' IDENTIFIED BY '$USER_PASSWORD';"
mysql -u root -p$PASSWORD -e "GRANT ALL PRIVILEGES ON *.* TO '$CREATE_USER_NAME'@'localhost' IDENTIFIED BY '$USER_PASSWORD';"

echo ""
echo "---------------------------------------------"
echo ""
echo ""
echo "       MariaDB installation has finished"
echo ""
echo ""
echo "---------------------------------------------"
echo ""
echo ""
echo ""
echo ""
