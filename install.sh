#!/bin/bash

# Here, we will create a menu for installation all the service in the system.
# Each and every menu will download the script from the server and run in the machine.

chmod -R 777 dns.sh
chmod -R 777 apache2.sh
chmod -R 777 php7.4.sh
chmod -R 777 mysql.sh
chmod -R 777 mariadb.sh
clear
echo "#############################################################"
echo ""
echo -e "   \e[1;32mPlease select the service......  \e[0m  "
echo ""
echo "#############################################################"

options=("DNS Service" "Web Service" "PHP 7.4" "Database Service (MySql)" "Database Service (MariaDB)" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "DNS Service")
        	  echo "#############################################################"
            echo -e "   \e[1;32mDNS Service is going to install in the server: ----  \e[0m  "
            echo "#############################################################"      
            ./dns.sh
            ;;
        "Web Service")
        	  echo "#############################################################"
            echo -e "   \e[1;32mWEB Service is going to install in the server: ----  \e[0m  "
            echo "#############################################################"
            ./apache2.sh
            ;;
        "PHP 7.3")
            echo "#############################################################"
            echo -e "   \e[1;32mPHP 7.3 Service is going to install in the server: ----  \e[0m  "
            echo "#############################################################" 
            ./php7.3.sh
            ;;
        "Database Service (MySql)")
            echo "#############################################################"
            echo -e "   \e[1;32mMySql Service is going to install in the server: ----  \e[0m  "
            echo "#############################################################"
            ./mysql.sh
            ;;
        "Database Service (MariaDB)")
            echo "#############################################################"
            echo -e "   \e[1;32mMariaDB Service is going to install in the server: ----  \e[0m  "
            echo "#############################################################" 
            ./mariadb.sh
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
