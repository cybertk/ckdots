export NVM_DIR=~/.nvm

[[ -s "$NVM_DIR/nvm.sh" ]] && . "$NVM_DIR/nvm.sh"

if [[ -n "$CONFIG_NVM_MIRROR" ]]
then
    export NVM_NODEJS_ORG_MIRROR="$CONFIG_NVM_MIRROR/node"
    export NVM_IOJS_ORG_MIRROR="$CONFIG_NVM_MIRROR/iojs"
fi
