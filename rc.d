#!/bin/sh
case $1 in
    list)
	ls /etc/rc.d/ | sed 's/rc.//' -s | \
	    while read i; do echo -n "$i ";done
	echo
	;;
    start)
	sudo /etc/rc.d/rc.$2 $1
	;;
    stop)
	sudo /etc/rc.d/rc.$2 $1
	;;
    restart)
	sudo /etc/rc.d/rc.$2 $1
	;;
    status)
	sudo /etc/rc.d/rc.$2 $1
	;;
    *)
	echo "Use: rc.d {list|start|stop|restart|status}"
esac

