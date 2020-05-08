FROM php:7.3-alpine
LABEL maintainer="digitalpulp"

RUN apk add --no-cache --virtual .dd-build-deps libpng-dev libjpeg-turbo-dev postgresql-dev libxml2-dev $PHPIZE_DEPS \
   && apk add --no-cache --update zlib libzip-dev \
   && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
   && docker-php-ext-install gd mbstring pdo pdo_mysql pdo_pgsql zip \
   && docker-php-ext-install opcache bcmath soap \
   && pecl install redis-3.1.1 xdebug \
   && docker-php-ext-enable redis xdebug \
   && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
   && php -r "if (hash_file('sha384', 'composer-setup.php') === 'e0012edf3e80b6978849f5eff0d4b4e4c79ff1609dd1e613307e16318854d24ae64f26d17af3ef0bf7cfb710ca74755a') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
   && php composer-setup.php \
   && php -r "unlink('composer-setup.php');" \
   && mv composer.phar /usr/local/bin/composer \
   && echo "export PATH=~/.composer/vendor/bin:\$PATH" >> ~/.bash_profile \
   && apk add --no-cache sudo git libpng libjpeg libpq libxml2 mysql-client openssh-client rsync patch expect \
   && apk del .dd-build-deps \
   && apk add --no-cache mysql-client openssh-client rsync \
   && apk add --no-cache bash bash-doc bash-completion

COPY drupal-*.ini /usr/local/etc/php/conf.d/
COPY xdebug.ini /usr/local/etc/php/conf.d/
COPY entrypoint.sh /usr/local/bin/
RUN chmod 655 /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
CMD ["tail", "-f", "/dev/null"]
