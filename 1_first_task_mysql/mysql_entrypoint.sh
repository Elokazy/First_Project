#!/bin/bash
cd /usr/local/mysql
echo $PWD
echo $BASH
bin/mysqld --defaults-file=/etc/mysql/my.cnf
bin/mysqld --initialize-insecure  --user=mysql
#CREATE USER 'root'@'%' IDENTIFIED BY 'root';
#grant all privileges on test.* to root@'%' identified by 'root';
#FLUSH PRIVILEGES;

