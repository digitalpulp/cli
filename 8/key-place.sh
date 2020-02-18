#!/bin/sh
if [ ! -d "/root/.ssh"]; then
  mkdir /root/.ssh
fi
if [ -n "${GIT_KNOWN_HOST}" ]; then
  echo -e ${GIT_KNOWN_HOST} >> ${HOME}/.ssh/known_hosts
fi
if [ -n "${SSH_PRIVATE_KEY}" ]; then
  echo -e ${SSH_PRIVATE_KEY} >> ${HOME}/.ssh/id_rsa
fi
chmod /root/.ssh 0600
chmod /root/.ssh/known_hosts 0700
chmod /root/.ssh/id_rsa 0600
