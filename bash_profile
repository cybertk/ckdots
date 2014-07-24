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

# Brew use /usr/local/bin
_PATH=/usr/local/bin
export PATH=$_PATH:${PATH/$_PATH:/}
unset _PATH

# Setup PATH, invoke app I customized first
# Reset PATH first.
# TODO implement in 1 line code.
_PATH=~/bin
export PATH=~/bin:${PATH/$_PATH:/}
unset _PATH

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
for sh in ${CK_PROFILE_DIR}/bash_profile.d/*.sh; do . "$sh"; done
for sh in ./.bash_profile.d/*.sh; do . "$sh"; done
