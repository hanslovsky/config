# the following variable defines the session which is started if the user
# doesn't explicitely select a session
DEFAULT_SESSION=twm

case $1 in
xfce4)
	exec startxfce4
	;;
icewm)
	icewmbg &
	icewmtray &
	exec icewm
	;;
wmaker)
	exec wmaker
	;;
blackbox)
	exec blackbox
	;;
i3)
        exec i3
        ;;
*)
	exec $DEFAULT_SESSION
	;;
esac
