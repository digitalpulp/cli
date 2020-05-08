#!/bin/sh
if [ ! -d "/root/.ssh" ]; then
  mkdir /root/.ssh
fi
echo "StrictHostKeyChecking accept-new" >> /root/.ssh/config
echo ".ssh dir exists and config created."
if [ -n "${GIT_KNOWN_HOST}" ]; then
  echo -e ${GIT_KNOWN_HOST} >> /root/.ssh/known_hosts
  chmod 0700 /root/.ssh/known_hosts
  echo "Git host key copied."
fi
if [ -n "${SSH_PRIVATE_KEY}" ]; then
  echo -e ${SSH_PRIVATE_KEY} >> /root/.ssh/id_rsa
  chmod 0600 /root/.ssh/id_rsa
  echo "SSH key copied."
fi
chmod 0600 /root/.ssh
if [ -n "${GIT_NAME}" ]; then
  git config --global user.name ${GIT_NAME}
  echo "git name set."
fi
if [ -n "${GIT_EMAIL}" ]; then
  git config --global user.email ${GIT_EMAIL}
  echo "git email set."
fi
# Invoke ssh-agent if needed.
if [ -n "${SSHPASS}" ]; then
    # If there is no ssh-agent socket, start the agent and add the key.
    if [ ! -r /root/.ssh/ssh_auth_sock ]; then
        eval `ssh-agent -s`
        ln -sf "${SSH_AUTH_SOCK}" /root/.ssh/ssh_auth_sock
    fi
    SSH_AUTH_SOCK=/root/.ssh/ssh_auth_sock
    export SSH_AUTH_SOCK
    if [ ssh-add -l > /dev/null ]; then
        exit 0
    else
    expect << EOF
        spawn ssh-add
        expect "Enter passphrase for /root/.ssh/id_rsa:"
        send "${SSHPASS}"
        send "\n"
        expect eof
EOF
    fi
fi

exec "$@"
