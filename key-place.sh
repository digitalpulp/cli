#!/bin/sh
if [ ! -d "/root/.ssh" ]; then
  mkdir /root/.ssh
fi
echo "StrictHostKeyChecking accept-new" >> /root/.ssh/config
echo ".ssh dir exists and config created."
if [ -n "${GIT_KNOWN_HOST}" ]; then
  echo -e ${GIT_KNOWN_HOST} >> /root/.ssh/known_hosts
  echo "Git host key copied."
fi
if [ -n "${SSH_PRIVATE_KEY}" ]; then
  echo -e ${SSH_PRIVATE_KEY} >> /root/.ssh/id_rsa
  echo "SSH key copied."
fi
chmod 0700 /root/.ssh/known_hosts
chmod 0600 /root/.ssh/id_rsa
chmod 0600 /root/.ssh

