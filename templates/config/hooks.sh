
# Hooks of proxy.sh
when_proxy_on() {
    unset HOMEBREW_BOTTLE_DOMAIN
}

when_proxy_off() {
    echo when proxy off
    . $CKDOTS_ROOT/plugins/homebrew.sh
}

main () {
    local f=when_$1

    [[ $(type -t $f) = function ]] && eval $f
}

main "$@"
