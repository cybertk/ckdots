#!/bin/sh
#
# Copyright 2010 Kyan He, <kyan.ql.he@gmail.com>

# .bash_profile vs .bashrc, see http://www.joshstaiger.org/archives/2005/07/bash_profile_vs.html

umask 027

# set PAGER to vim if exists
[ -e ~/bin/vimpager ] && export PAGER=~/bin/vimpager

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export TZ='Asia/Shanghai'

# Setup PATH, invoke app I customized first
# TODO implement in 1 line code.

# Brew use /usr/local/bin
_PATH=/usr/local/bin
export PATH=$_PATH:${PATH/$_PATH:/}

# Bins from ck-bashrc
_PATH=$CK_BASHRC_DIR/bin
export PATH=$_PATH:${PATH/$_PATH:/}

# Bins of user customized first
_PATH=~/bin
export PATH=$_PATH:${PATH/$_PATH:/}


# Setup customized lib path
# On Mac 10.8, we get the following warning
#   dyld: DYLD_ environment variables being ignored because main executable (/usr/bin/sudo) is setuid or setgid
# export LD_LIBRARY_PATH=~/lib

# set colorful PS1 and enable color for ls etc.
if which dircolors >/dev/null ; then
        [ -f ~/.dir_colors ] && eval $(dircolors -b ~/.dir_colors)
fi
PS1="\[\033[0;1;32m\][\j] [$(date +%R:%S)\[\033[0;32m\]@\h\[\033[0;1;32m\]] [$(basename `tty`)] \[\033[0;32m\]\w\n\$ \[\033[0;37m\]"

export EDITOR=vim

# Setup IME
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

# invoke plugins
# Global
for sh in ${CK_BASHRC_DIR}/bash_profile.d/*.*sh; do . "$sh"; done

# Load configs
[ -e ~/.config/ck-dots ] && . ~/.config/ck-dots
export CKDOTS_MODULES=${CK_BASHRC_DIR}/bash_profile.d
export CKDOTS_HOOKS=~/.config/ck-dots-hooks

# Private
if [ -d ~/.bash_profile.d ]; then
    for sh in ~/.bash_profile.d/*.*sh; do . "$sh"; done
fi
