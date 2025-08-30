FROM alpine:3.22

RUN apk add --no-cache \
    apache2 curl \
    php83 php83-apache2 php83-common php83-cli php83-fpm php83-mbstring php83-pdo_mysql php83-opcache php83-redis php83-pecl-memcached imagemagick \
    php83-curl php83-json php83-xml php83-xmlreader php83-simplexml php83-zip php83-zlib php83-fileinfo php83-dom php83-gd php83-sockets php83-ftp \
    php83-apcu php83-imap php83-ldap php83-sqlite3 php83-pgsql php83-sodium

RUN mkdir -p /run/apache2 \
    && echo "ServerName localhost" >> /etc/apache2/httpd.conf \
    && sed -i 's#^DocumentRoot ".*#DocumentRoot "/var/www/html"#' /etc/apache2/httpd.conf \
    && sed -i 's#<Directory ".*#<Directory "/var/www/html">#' /etc/apache2/httpd.conf \
    && rm -rf /var/cache/apk/*

COPY . /var/www/html/

EXPOSE 80

CMD ["httpd", "-D", "FOREGROUND"]
