# X session initial script
# created by kyan <cra4fizx@gmail.com>
# last modified: Mon Jun 29 01:57:53 CST 2009
#

DEFAULT_SESSION=awesome

case $1 in
awesome)
        urxvtd -q -o -f
        urxvtc&
        urxvtc&
        urxvtc&
        urxvtc&
        apvlv&
        firefox&
#        pcmanfm&
        exec awesome
        ;;
xfce4)
        devilspie&
        urxvtd -q -o -f
        exec startxfce4
        ;;
gnome)
	exec gnome-session
	;;
*)
esac
