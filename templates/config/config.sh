## General configs
## Sort by alphabetical

# Atlas of Hashicorp
CONFIG_ATLAS_API_TOKEN=

# Azure
CONFIG_AZURE_SUBSCRIPTION_ID=

# Docker
CONFIG_DOCKER_REGISTRY_MIRROR=

# Hub - GitHub CLI https://github.com/github/hub
CONFIG_HUB_GITHUB_TOKEN=

# Homebrew
CONFIG_HOMEBREW_BOTTLE_MIRROR=
CONFIG_HOMEBREW_AUTO_UPDATE_SECS=$((3600*24))
CONFIG_HOMEBREW_GITHUB_TOKEN=

# Proxy for intel
CONFIG_PROXY_URL=
CONFIG_PROXY_BYPASS='.local, localhost'

# ckdots
CONFIG_PROFILE=$CKDOTS_CONFIG/profile

## Configs for pc-1 only
if [[ $(hostname) = "pc-1" ]]; then
    CONFIG_PROXY_ON=1
fi
