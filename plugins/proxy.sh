# Turn on/off http proxy
# Usage:
#   Turn on proxy
#       $ proxy on [index]
#   Turn off proxy
#       $ proxy off
#   Show current proxy status
#       $ proxy
#
# Config:
#   CONFIG_PROXY_URL, single proxy url string
#   CONFIG_PROXY_URLS, proxy urls array, switching with `proxy on <index>`

function proxy() {
    declare opt="$1" index="${2:-0}"

    if [[ "$opt" = off ]]; then
        # Turn off proxy
        unset https_proxy
        unset http_proxy
        unset no_proxy

        [[ -x $CKDOTS_HOOKS ]] && . $CKDOTS_HOOKS proxy_off
    elif [[ "$opt" = on ]]; then
        local proxy_url

        if [[ -n "$CONFIG_PROXY_URL" ]]; then
            proxy_url=$CONFIG_PROXY_URL
        else
            proxy_url=${CONFIG_PROXY_URLS[@]:$index:1}
        fi

        # Turn on proxy
        export https_proxy="$proxy_url"
        export http_proxy="$proxy_url"
        # Support inline script in $CONFIG_PROXY_BYPASS. e.g. CONFIG_PROXY_BYPASS='localhost,$(docker-machine ip)'
        export no_proxy="$(eval "echo $CONFIG_PROXY_BYPASS")"

        [[ -x $CKDOTS_HOOKS ]] && . $CKDOTS_HOOKS proxy_on
    fi

    # Show current proxy status
    echo "PROXY_HTTPS: ${https_proxy:-OFF}"
    echo "PROXY_HTTP : ${http_proxy:-OFF}"
    [[ -n $https_proxy || -n "$http_proxy" ]] && echo "PROXY_BYPASS: $no_proxy"
}

# Activate proxy if CONFIG_PROXY_ON is set
if [[ -n "$CONFIG_PROXY_ON" ]]; then
    proxy on
fi
