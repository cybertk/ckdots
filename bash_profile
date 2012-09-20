#!/bin/sh
#
# Copyright 2010 Kyan He, <kyan.ql.he@gmail.com>

umask 027

# set PAGER to vim if exists
[ -e ~/bin/vimpager ] && export PAGER=~/bin/vimpager

export LANG="en_US.UTF8"

export TZ='Asia/Shanghai'

# Setup PATH, invoke app I customized first
# Reset PATH first.
# TODO implement in 1 line code.
_PATH=~/bin
export PATH=~/bin:${PATH/$_PATH:/}
unset _PATH

# Setup customized lib path
export LD_LIBRARY_PATH=~/lib

# set colorful PS1 and enable color for ls etc.
if which dircolors >/dev/null ; then
        [ -f ~/.dir_colors ] && eval $(dircolors -b ~/.dir_colors)
fi

PS1="\[\033[0;1;32m\][\j] [$(date +%R:%S)\[\033[0;32m\]@\h\[\033[0;1;32m\]] [$(basename `tty`)] \[\033[0;32m\]\w\n\$ "

export EDITOR=vim

# Setup IME
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

# invoke plugins
for sh in ~/.bash_profile.d/*.sh; do . "$sh"; done
