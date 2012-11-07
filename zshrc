# Copyright 2012 cybertk, <kyan.ql.he@gmail.com>

# Skil all this for non-interactive shells
[[ -z "${PS1}" ]] && return

# Setup umask, new file's permission.
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

export PS1="[%n@%m] %/
$ "

export EDITOR=vim

# Setup IME
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

autoload -U zutil
autoload -U compinit
autoload -U complist

compinit

setopt correctall
setopt autocd
setopt auto_resume
setopt extendedglob

HISTFILE=~/.zsh/history
HISTSIZE=1000
SAVEHIST=1000

# invoke plugins
for sh in ~/.bash_profile.d/*.sh; do . "$sh"; done
