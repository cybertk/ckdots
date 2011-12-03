#!/bin/sh
# alias.sh
# used to define alias
# created by seraph  2009/04/15

alias ls='ls --color=always -h'
if rsync 2 >&1 1>&/dev/null;
then
    alias cp='rsync --progress'
else
    echo "no rsync found"
fi
alias cpp='cp'
alias mv='mv -iv'
alias rm='rm -iv'
alias grep='grep --color=auto -n'
alias killall='killall -v'
alias chmod='chmod -v'
alias pgrep='pgrep -l'
alias rsync='rsync --progress'
alias wget='wget --read-timeout=30'
alias vi='vim'

alias a='cscope'
alias b='cscope -Rb'
# c is maped to cd.func.sh
alias d='less'
alias e='a'
alias f='/usr/bin/find -regex'
alias g='a'
alias h='a'
alias i='a'
alias j='jobs -pl'
alias k='pkill'
alias l='ls -al'
alias n='a'
alias o='pcmanfm .'
alias p='apvlv'
alias q='a'
alias r='a'
alias s='a'
alias t='t'
alias u='a'
alias v='vi -R'
alias w='a'

