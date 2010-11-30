# @param $1, src, files in current repo
# @param $2, dst, files in real dir
function sync() {

if [ -d $1 ];
then
    for f in $1/*;
    do
        bn=$(basename $f)
        sync $f $2/$bn
    done
else
    if [ -n "$verbose" ];
    then
        if [ -f "$2" ];
        then
            diff -Nur $2 $1
        else
            diff -Nur /dev/null $1
        fi
    else
        if diff $1 $2  2>&1 1>&/dev/null;
        then
            echo "[$1] Latest" >/dev/null
        else
            echo "Syncing $2"
            [ -n "$dryrun" ] || /bin/cp $1 $2
        fi
    fi
fi
}

function env_check() {
cp=/bin/cp

if [ ! -f $cp ];
then
    echo "cannot find $cp"
    exit
fi
}

# [ $opt = ${opt#-v} ] || echo "option -v exist"
case $1 in
    "-v")
    verbose=1
    ;;
    "-p")
    dryrun=1
    ;;
esac

env_check

sync vimrc ~/.vimrc
sync vim ~/.vim
sync bash_profile ~/.bash_profile
sync bash_profile.d ~/.bash_profile.d
