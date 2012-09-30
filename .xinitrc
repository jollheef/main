xsetroot -cursor_name left_ptr
xsetroot -solid "#333333"
xhost local:
#syndaemon -K -d -i 1 &

#aarchup &
ifexping &
touchpad.sh &
autorun3gmodem.sh &
wmname LG3D &

#firefox &
emacs &
#emacsscript && emacsclient -c &
#vlc &
pidgin &
thunderbird &

exec ck-launch-session /usr/bin/xmonad

