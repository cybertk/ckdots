# use tty to provide passphrase whatever keychain is available
export GPG_TTY=$(tty)

if ! which keychain >/dev/null 2>&1; then
    return
fi


eval `keychain $CONFIG_KEYCHAIN`
