#Starting with base layer
FROM ubuntu:18.04

RUN groupadd -r mysql && useradd -r -g mysql -s /bin/false mysql

#Update Debian Packages
RUN apt-get update && apt-get install -y apt-utils 

#Install mysql
RUN DEBIAN_FRONTEND=noninteractive apt-get install mysql-server  --yes

#Environment Varibales:
ENV MYSQL_DATABASE test
ENV MYSQL_ROOT_PASSWORD root
ENV MYSQL_USER miko
ENV MYSQL_PASSWORD miko

#presisting DB_container data
VOLUME /var/lib/mysql

#copy configuration
COPY config/ /etc/mysql/
RUN chown mysql:mysql /etc/mysql/my.cnf && chmod 600 /etc/mysql/my.cnf
#coping entrypoint
COPY mysql_entrypoint.sh /usr/local/bin/

#/usr/local/bin/
#give proper permissions
RUN chmod +x /usr/local/bin/mysql_entrypoint.sh

ENTRYPOINT ["/usr/local/bin/mysql_entrypoint.sh"]

EXPOSE 3306

CMD ["mysqld"]
