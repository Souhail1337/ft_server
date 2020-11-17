#!bin/bash
export DEBIAN_FRONTEND=noninteractive
apt install wget -y
apt install lsb-release -y
apt install gnupg -y
apt install php-{mbstring,zip,gd,xml,pear,gettext,cgi} -y
wget http://repo.mysql.com/mysql-apt-config_0.8.13-1_all.deb
echo mysql-apt-config mysql-apt-config/select-product          select Apply              | debconf-set-selections
echo mysql-apt-config mysql-apt-config/select-server           select mysql-5.7          | debconf-set-selections
echo mysql-apt-config mysql-apt-config/select-connector-python select none               | debconf-set-selections
echo mysql-apt-config mysql-apt-config/select-workbench        select none               | debconf-set-selections
echo mysql-apt-config mysql-apt-config/select-utilities        select none               | debconf-set-selections
echo mysql-apt-config mysql-apt-config/select-connector-odbc   select connector-odbc-x.x | debconf-set-selections
dpkg -i mysql-apt-config_0.8.13-1_all.deb
apt update
echo mysql-community-server mysql-community-server/re-root-pass password souhail01 | debconf-set-selections
echo mysql-community-server mysql-community-server/root-pass    password souhail01 | debconf-set-selections
apt update
apt dist-upgrade -y
apt install mysql-community-server -y
apt update
service mysql start
mysql --user=root --password=souhail01 -Bse "CREATE DATABASE WP_DB;
GRANT ALL ON WP_DB.* to 'wp_user'@'localhost' IDENTIFIED BY 'souhail01';
FLUSH PRIVILEGES;"
mysql --user=root --password=souhail01 WP_DB < wp_db.sql
mysql < /var/www/html/phpmyadmin/sql/create_tables.sql --user=root --password=souhail01
mysql --user=root --password=souhail01 -Bse "GRANT ALL PRIVILEGES ON phpmyadmin.* TO 'pma'@'localhost' IDENTIFIED BY 'pmapass';FLUSH PRIVILEGES;"
#mkdir /var/www/html/phpmyadmin/tmp
#chmod 777 /var/www/html/phpmyadmin/tmp
#chown -R www-data:www-data /var/www/html/phpmyadmin/tmp
service php7.3-fpm start
nginx -g 'daemon off;'
