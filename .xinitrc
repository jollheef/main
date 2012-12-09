[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

xsetroot -cursor_name left_ptr
xsetroot -solid "#333333"
xhost local:

nmvpn_auto2 &
ifexping &
touchpad.sh &
#autorun3gmodem.sh &
wmname LG3D &
battery-notify &

parcellite -dn &


firefox >/dev/null &
emacs &

pidgin &
skype &

thunderbird &
audacious &
sakura --class='midnight' -e /home/michael/bin/mc.sh &

exec ck-launch-session /usr/bin/xmonad
