#!/bin/bash

# Install MySql in the Linux (Ubuntu 18 or 19)

apt update -y
apt-get update -y

apt install mysql-server -y
apt install mysql-client -y

systemctl start mysql.service
systemctl enable mysql.service
systemctl stop mysql.service
systemctl restart mysql.service
systemctl enable mysql.service

mysql_secure_installation


clear
echo ""
echo ""
echo ""
echo "***************************************************************************"
echo -e "   \e[1;32mPlease complete the configuration in the database: ----  \e[0m  "
echo "***************************************************************************"
echo ""
echo -n -e "  \e[1;32mEnter the database root password: ----  ";  read PASSWORD
echo ""

# To create an new user id and password in the database
echo ""
echo -n -e "  \e[1;32mEnter the new user id: ----   \e[0m";       read CREATE_USER_NAME
echo ""
echo ""
echo -n -e "  \e[1;32mEnter the new user password: ----  \e[0m";  read USER_PASSWORD
echo ""
echo ""

echo ""
echo ""
echo -n -e "  \e[1;32mPlease Enter the database name: ----  \e[0m"; read DB
echo ""
echo ""

# To create a Database. 
mysql -u root -p$PASSWORD -e "CREATE DATABASE $DB;"

# To assign the permission 
mysql -u root -p$PASSWORD -e "CREATE USER '$CREATE_USER_NAME'@'localhost' IDENTIFIED BY '$USER_PASSWORD';"
mysql -u root -p$PASSWORD -e "GRANT ALL PRIVILEGES ON *.* TO '$CREATE_USER_NAME'@'localhost' IDENTIFIED BY '$USER_PASSWORD';"

echo ""
echo ""
echo ""
echo "***************************************************************************"
echo ""
echo ""
echo -n -e "  \e[1;32mMySql installation has finished: ----  \e[0m"
echo ""
echo ""
echo "***************************************************************************"
echo ""
echo ""
echo ""
echo ""
