# @param $1, src
# @param $2, dst
function sync() {

if [ -d $1 ];
then
    for f in $1/*;
    do
        bn=$(basename $f)
        sync $f $2/$bn
    done
else
    if diff $1 $2  2>&1 >/dev/null;
    then
        echo "[$1] Latest" >/dev/null
    else
        echo "Syncing $2"
        /bin/cp $1 $2
    fi
fi
}

cp=/bin/cp

if [ ! -f $cp ];
then
    echo "cannot find $cp"
    exit
fi

sync vimrc ~/.vimrc
sync vim ~/.vim
sync bash_profile ~/.bash_profile
sync bash_profile.d ~/.bash_profile.d
