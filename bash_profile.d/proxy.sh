# Turn on/off http proxy
# Usage:
#   Turn on proxy
#       $ proxy on
#   Turn off proxy
#       $ proxy off
#   Show current proxy status
#       $ proxy
function proxy() {
    declare opt="$1"

    if [[ "$opt" = off ]]; then
        # Turn off proxy
        unset https_proxy
        unset http_proxy
        unset no_proxy
    elif [[ "$opt" = on ]]; then
        # Turn on proxy
        export https_proxy="$CONFIG_PROXY_URL"
        export http_proxy="$CONFIG_PROXY_URL"
        export no_proxy="$CONFIG_PROXY_BYPASS"
    fi

    # Show current proxy status
    echo "PROXY_HTTPS: ${https_proxy:-OFF}"
    echo "PROXY_HTTP : ${http_proxy:-OFF}"
    [[ -n $https_proxy || -n "$http_proxy" ]] && echo "PROXY_BYPASS: $no_proxy"
}

