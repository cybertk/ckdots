
export GPG_TTY=$(tty)

eval `keychain --nogui --agents ssh,gpg --eval "$CONFIG_KEYCHAIN"`
