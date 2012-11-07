# @param $1, src, files in current repo
# @param $2, dst, files in real dir
function sync() {

if [ -d "$1" ];
then
    # Create directory if un-exist.
    if [ ! -e "$2" ];
    then
        echo "Syncing $2"
        [ -n "$dryrun" ] || mkdir "$2"
    fi

    for f in $(/bin/ls $1);
    do
        # NOTE: Quote var with "" to avoid space(Path contains space) issue.
        sync "$1/$f" "$2/$f"
    done
else
    # Won't sync .gitignore
    if [ `basename $1` == ".gitignore" ];then return; fi;

    if [ -n "$verbose" ];
    then
        if [ -f "$2" ];
        then
            diff -Nur "$2" "$1"
        else
            diff -Nur /dev/null "$1"
        fi
    else
        if diff "$1" "$2"  2>&1 1>&/dev/null;
        then
            echo "[$1] Latest" >/dev/null
        else
            echo "Syncing $2"
            [ -n "$dryrun" ] || $SUDO /bin/cp "$1" "$2"
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
#sync vim
sync vimrc ~/.vimrc
sync vim ~/.vim

#sync bash
sync bashrc ~/.bashrc
sync bash_profile ~/.bash_profile
sync bash_profile.d ~/.bash_profile.d
sync bash_logout ~/.bash_logout

#sync xinit
sync xinitrc ~/.xinitrc

#sync git
sync gitconfig ~/.gitconfig

#sync env
sync env ~/env

#sync bin
sync bin ~/bin

#sync zsh
sync zshrc ~/.zshrc

#sync pptpd config
#SUDO=sudo
#sync config/pptp/pptpd.conf /etc/pptpd.conf
#sync config/pptp/ppp/pptpd-options /etc/ppp/pptpd-options
