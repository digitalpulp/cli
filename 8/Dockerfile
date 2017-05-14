FROM drupaldocker/php-dev:5.6-alpine-cli

RUN apk add --no-cache mysql-client openssh-client rsync \
  && composer global require drush/drush:8.* \
  && ln -s ~/.composer/vendor/bin/drush /usr/local/bin/drush \
  && drush core-status -y

CMD ["tail", "-f", "/dev/null"]
