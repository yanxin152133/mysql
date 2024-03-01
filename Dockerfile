FROM mysql:latest

RUN microdnf update -y \
    && microdnf install -y glibc-locale-source  \
      wget \
      tar \
    && localedef -c -f UTF-8 -i zh_CN zh_CN.utf8 \
    && wget https://github.com/prometheus/mysqld_exporter/releases/download/v0.15.0/mysqld_exporter-0.15.0.linux-amd64.tar.gz \
    && tar -zxvf mysqld_exporter-0.15.0.linux-amd64.tar.gz -C /etc \
    && rm -rf mysqld_exporter-0.15.0.linux-amd64.tar.gz

ENV LANG zh_CN.utf8 

COPY my.cnf /etc/mysql/conf.d/mysqlutf8.cnf
COPY my1.cnf /etc/mysqld_exporter-0.15.0.linux-amd64
CMD ["mysqld", "--character-set-server=utf8", "--collation-server=utf8_unicode_ci"]
CMD ["./etc/mysqld_exporter-0.15.0.linux-amd64/mysqld_exporter", "--config.my-cnf=my1.cnf"]