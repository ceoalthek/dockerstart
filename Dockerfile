FROM ubuntu/trusty

LABEL maintainer="ogarces@althek.com"

RUN apt-get install -y mysql-server mysql-client php5-mysql
ADD configs/mysql/mysql-setup.sh /mysql-setup.sh
RUN chmod +x /*.sh
ADD configs/mysql/my.cnf /etc/mysql/conf.d/my.cnf
ADD configs/mysql/supervisor.conf /etc/supervisor/conf.d/mysql.conf
RUN /mysql-setup.sh

ADD index.php /var/www/html/index.php

EXPOSE 80 443
