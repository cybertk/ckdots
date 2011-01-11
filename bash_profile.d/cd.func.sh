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

        echo "$D"
        if [[ "$D" =~ ^[0-9]+$ ]];
        then
            a="+$D"
        else
            D=${{D/$HOME/"~"}%/}
            local i=$(dirs -v | awk "{ if (\$2==\"$D\") print \$1 }")
            
            echo i is $i
            if [ x"$i" = x ];
            then
                a="$D"
            else
                a="+$i"
            fi
        fi

        echo "pushd $a; dirs -v"
        #pushd "$a" >/dev/null; dirs -v
    fi
}
