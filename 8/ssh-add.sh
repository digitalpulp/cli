#!/bin/sh
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
