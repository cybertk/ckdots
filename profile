#!/usr/bin/env bash

# .bash_profile vs .bashrc, see http://www.joshstaiger.org/archives/2005/07/bash_profile_vs.html

# shellcheck source=/dev/null
true

export CKDOTS_ROOT
export CKDOTS_CONFIG
export PATH="$CKDOTS_ROOT/bin:$PATH"

# Load configs
[[ -e "$CKDOTS_CONFIG/config.sh" ]] && . "$CKDOTS_CONFIG/config.sh"
[[ -e "$CKDOTS_CONFIG/hooks.sh" ]] && export CKDOTS_HOOKS="$CKDOTS_CONFIG/hooks.sh"

# Invoke plugins
for sh in ${CKDOTS_ROOT}/plugins/*.*sh; do . "$sh"; done

# Load custom profile
[[ -e "$CONFIG_PROFILE" ]] && . "$CONFIG_PROFILE"
