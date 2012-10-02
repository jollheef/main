xsetroot -cursor_name left_ptr
xsetroot -solid "#333333"
xhost local:
#syndaemon -K -d -i 1 &

#aarchup &
ifexping &
touchpad.sh &
autorun3gmodem.sh &
wmname LG3D &
nm-applet &
stalonetray --icon-gravity E --geometry +1100 -p &

firefox &
emacs &
#emacsscript && emacsclient -c &
#vlc &
pidgin &
thunderbird &
audacious &
sakura --class='midnight' -e /home/michael/bin/mc.sh &

exec ck-launch-session /usr/bin/xmonad

