#!/bin/sh
if [ ! -d "/root/.ssh" ]; then
  mkdir /root/.ssh
fi
if [ -n "${GIT_KNOWN_HOST}" ]; then
  echo -e ${GIT_KNOWN_HOST} >> ${HOME}/.ssh/known_hosts
  ssh-keyscan -H bitbucket.org >> /root/.ssh/known_hosts
  ssh-keyscan -H github.com >> /root/.ssh/known_hosts
fi
if [ -n "${SSH_PRIVATE_KEY}" ]; then
  echo -e ${SSH_PRIVATE_KEY} >> ${HOME}/.ssh/id_rsa
fi
chmod 0700 /root/.ssh/known_hosts
chmod 0600 /root/.ssh/id_rsa
chmod 0600 /root/.ssh

