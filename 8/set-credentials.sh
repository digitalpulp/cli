#!/bin/sh
# This initialization file checks for the presence of an ssh
# passphrase in an environment variable.  When present it then
# stores the ssh credentials in the a persistent agent.

if [ ! -d /root/.ssh/ ]; then
    # There is no .ssh directory so create it.
    mkdir /root/.ssh/
fi
if [ -n "${SSH_PRIVATE_KEY}" -a ! -r /root/.ssh/id_rsa ]; then
    # A private key is coming in via env variable and has not been stored.
    echo -e "${SSH_PRIVATE_KEY}" >> /root/.ssh/id_rsa
    chmod 600 /root/.ssh/id_rsa
fi
if [ -n "${GIT_KNOWN_HOST}" -a ! -r /root/.ssh/known_hosts ]; then
    # A host key is coming in via env variable and has not been stored.
    echo -e "\n${GIT_KNOWN_HOST}" >> /root/.ssh/known_hosts
    chmod 600 /root/.ssh/known_hosts
fi
if [ -w /root/.ssh ]; then
    chmod 600 /root/.ssh
fi
# If there is no ssh-agent socket, start the agent.
if [ -n "${SSHPASS}" -a ! -r /root/.ssh/ssh_auth_sock ]; then
 eval `ssh-agent -s`
 ln -sf "${SSH_AUTH_SOCK}" /root/.ssh/ssh_auth_sock
fi
# Keep the container up
tail -f /dev/null
