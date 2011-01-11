#!/bin/sh
#
# Kyan He <kyan.ql.he@gmail.com> @ Tue Jan 11 17:18:44 CST 2011
#
# extend cd
#

function c() {

    if [ $# -gt 1 ];
    then
        cd $*
    else

        if [ "$1" -eq "$1" ];
        then
            pushd +$D; dirs -v
            return
        fi

        local D=${1:-~}
        local i=$(dirs -v | awk "{ if (\$2==\"$D\") print \$1 }")

        local ARG=""
        if [ x"$i" = x ];
        then
            ARG=$D
        else
            ARG=+$i
        fi

        echo "pushd $ARG; dirs -v"
        pushd $ARG; dirs -v

    fi
}

c $*

