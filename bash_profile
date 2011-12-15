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
export PATH=~/bin:${PATH/`echo ~/bin`:/}

# set colorful PS1 and enable color for ls etc.
if which dircolors >/dev/null ; then
        [ -f ~/.dir_colors ] && eval $(dircolors -b ~/.dir_colors)
fi

PS1="\[\033[0;1;32m\][\j] [$(date +%R:%S)\[\033[0;32m\]@\h\[\033[0;1;32m\]] [$(basename `tty`)] \[\033[0;32m\]\w\n\$ "

export EDITOR=vim

# invoke plugins
for sh in ~/.bash_profile.d/*.sh; do . "$sh"; done
