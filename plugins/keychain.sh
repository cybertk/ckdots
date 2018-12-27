if ! which keychain >/dev/null 2>&1; then
    return
fi

export GPG_TTY=$(tty)

eval `keychain $CONFIG_KEYCHAIN`
