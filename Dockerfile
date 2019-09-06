from mysql:5.6

echo "export LANG=C.UTF-8" >>/etc/profile && source /etc/profile

COPY my.cnf /etc/mysql/conf.d/mysqlutf8.cnf
CMD ["mysqld", "--character-set-server=utf8", "--collation-server=utf8_unicode_ci"]