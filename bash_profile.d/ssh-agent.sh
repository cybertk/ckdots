_SSH_AUTH_SOCK=/tmp/ssh-agent.sock
_SSH_PID_FILE=/tmp/ssh-agent.pid
_SSH_AGENT_PID=$(cat $_SSH_PID_FILE 2>/dev/null)

# validate SSH_AUTH socket.
if [[ -S "$_SSH_AUTH_SOCK" && -n $_SSH_AGENT_PID
    && -d /proc/$_SSH_AGNET_PID ]]; then

    # ssh-agent is already running now.
    export SSH_AUTH_SOCK=$_SSH_AUTH_SOCK
    export SSH_AGENT_PID=$_SSH_AGENT_PID
else

    # Spawn a new ssh-agent
    eval `ssh-agent -a $_SSH_AUTH_SOCK` >/dev/null
    if [[ -z $SSH_AGENT_PID ]]; then

        echo Failed to start ssh-agent.
    else

        # Save pid.
        echo $SSH_AGENT_PID >$_SSH_PID_FILE

        echo Trying to add keys.
        ssh-add
    fi
fi

unset _SSH_AUTH_SOCK
unset _SSH_AGENT_PID
unset _SSH_PID_FILE
