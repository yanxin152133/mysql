from mysql:5.6

DOCKER_FILE_CONTENT=$DOCKER_FILE_CONTENT'ENV LANG zh_CN.UTF-8\n'
DOCKER_FILE_CONTENT=$DOCKER_FILE_CONTENT'ENV LC_ALL zh_CN.UTF-8\n'

COPY my.cnf /etc/mysql/conf.d/mysqlutf8.cnf
CMD ["mysqld", "--character-set-server=utf8", "--collation-server=utf8_unicode_ci"]