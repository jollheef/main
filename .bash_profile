#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]] &&  ! [[ -e /tmp/.X11-unix/X0 ]] && (( EUID )); then
    while true; do
	read -p 'Set brightness (0-255): '
	brightness set $REPLY
	if [ $? -eq 0 ]; then
	    break
	fi
    done
    while true; do
	read -p 'Do you want to start X? (y/n): '
	case $REPLY in
	    [Yy]) exec startx ;;
	    [Nn]) break ;;
	    *) printf '%s\n' 'Please answer y or n.' ;;
	esac
    done
fi
