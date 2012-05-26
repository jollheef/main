#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

#if [[ $(tty) = /dev/tty* ]]; then
#    setfont ter-v16n
#fi

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]] &&  ! [[ -e /tmp/.X11-unix/X0 ]] && (( EUID )); then
	while true; do
		read -p 'Do you want to start X? (y/n): '
		case $REPLY in
			[Yy]) exec startx ;;
			[Nn]) break ;;
			*) printf '%s\n' 'Please answer y or n.' ;;
		esac
	done
fi
