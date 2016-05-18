DRUSH for Drupal
-----------------------

[![Build Status](https://travis-ci.org/drupal-docker/drush.svg?branch=master)](https://travis-ci.org/drupal-docker/drush)


Version | Tags | Dockerfile
--- | --- | --- | ---
master | `master`, `8` | [Dockerfile](https://github.com/drupal-docker/drush/blob/master/master/Dockerfile)
8 | `latest`, `8` | [Dockerfile](https://github.com/drupal-docker/drush/blob/master/8/Dockerfile)
7 | `7` | [Dockerfile](https://github.com/drupal-docker/drush/blob/master/7/Dockerfile)
6 | `6` | [Dockerfile](https://github.com/drupal-docker/drush/blob/master/6/Dockerfile)

# Quickstart:

Interactive shell:
````
docker run --rm -ti drupaldocker/drush
````
Bash with drush command available:
````
docker run --rm -ti drupaldocker/drush bash
````

# Environmental variables

No variables

# Description

@todo

# Good to know

Drush 6 doesn't have support for `drush core-cli` command. Use:
````
$ docker run --rm -ti drupaldocker/drush bash
/var/www/html# drush st
/var/www/html# exit
````

# Status

Proof of concept

# Contributing

1. Fork the repo
1. Create your feature branch
1. Commit your changes
1. Push to the branch
1. Create new Pull Request
1. Wait for result of automate tests
