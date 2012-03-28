LOCAL_SSH_AUTH=/tmp/ssh-agent.sock

# validate SSH_AUTH socket.
if [ -S "$LOCAL_SSH_AUTH" ];
then
    # ssh-agent is running now.
    export SSH_AUTH_SOCK=$LOCAL_SSH_AUTH

    # TODO: export $SSH_AGENT_PID
else
    eval ssh-agent -a $LOCAL_SSH_AUTH >/dev/null
    ssh-add
fi

unset LOCAL_SSH_AUTH
