#!/bin/bash
mysql -u root -proot
CREATE USER 'root'@'%' IDENTIFIED BY 'root';
grant all privileges on test.* to root@'%' identified by 'root';
FLUSH PRIVILEGES;

