from mysql:5.6

RUN apt-get update
RUN apt-get install -y locales
RUN sed -ie 's/# zh_CN.UTF-8 UTF-8/zh_CN.UTF-8 UTF-8/g' /etc/locale.gen
RUN locale-gen
RUN mkdir /usr/share/fonts/truetype/deng/
ADD ./fonts/deng/*.ttf /usr/share/fonts/truetype/deng/
RUN fc-cache -vf
RUN fc-list
ENV LANG zh_CN.UTF-8

COPY my.cnf /etc/mysql/conf.d/mysqlutf8.cnf
CMD ["mysqld", "--character-set-server=utf8", "--collation-server=utf8_unicode_ci"]