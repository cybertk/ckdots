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

        local a=""
        local D=${1:-~}

        if [[ "$D" =~ ^[0-9]+$ ]];
        then
            pushd +$D >/dev/null || return
        else

            # change relative path to absolute
            pushd $D >/dev/null || return
            D=$PWD

            local i=$(dirs -v -l | awk "{ if (\$2==\"$D\") print \$1 }")
            local n=0
            for s in $i;
            do
                [ $s -eq 0 ] && continue
                popd -n +$((s-$n)) >/dev/null
                let n=n+1
            done
        fi

        dirs -v | awk ' { printf "\033[1;34m<%s>  \033[1;33m%s\n", $1, $2 }'
        echo -en "\033[0m"
    fi
}

export CDPATH=$CONFIG_CDPATH
