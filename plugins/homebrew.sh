# Increase Github rate limit by using api token
export HOMEBREW_GITHUB_API_TOKEN=$CONFIG_GITHUB_API_TOKEN

# Avialble Bottle Mirrors, select one and add into ~/.config/ck-bots
# - https://mirrors.ustc.edu.cn/homebrew-bottles
#   LUG Mirror, see https://servers.ustclug.org/2016/01/mirrors-add-homebrew-bottles-source/
[[ -n $CONFIG_HOMEBREW_BOTTLE_MIRROR ]] && export HOMEBREW_BOTTLE_DOMAIN=$CONFIG_HOMEBREW_BOTTLE_MIRROR
