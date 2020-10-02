Drush and Composer
==================
Tags and releases listed on [Docker Hub](https://hub.docker.com/r/digitalpulp/cli/)

[![Docker Pulls](https://img.shields.io/docker/pulls/digitalpulp/php.svg?maxAge=2592000)](https://hub.docker.com/r/digitalpulp/cli/)

Tags for these containers have been simplifed to just the php version. The most recent are:

- 7.3.22
- 7.4.10
- codeship-7.3
- codeship-7.4

Both Drush and Drupal Console expect to be installed in the Drupal vendor directory.  This
container expects the project to be mounted at `/var/www` and sets `/var/www/vendor/bin` as
a PATH component.
