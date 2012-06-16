xsetroot -cursor_name left_ptr
xsetroot -solid "#333333"
xhost local:
#syndaemon -K -d -i 1 &

aarchup &
ifexping &
touchpad.sh &

#firefox &
emacsscript && emacsclient -c &
#vlc &
pidgin &
thunderbird &

exec xmonad
