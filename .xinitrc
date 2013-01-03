[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

xsetroot -cursor_name left_ptr
xsetroot -solid "#333333"
xhost local:

xautolock -time 1 -locker "slocktogglevolume.sh" \
    -nowlocker "slocktogglevolume.sh" -detectsleep &
#nmvpn_auto2 &
ifexping &
touchpad.sh &
#autorun3gmodem.sh &
wmname LG3D &
battery-notify &

parcellite -dn &

firefox >/dev/null &
emacs &

sleep 30s && pidgin &
# Skype run auto with skype plugin in pidgin
#sleep 30s && skype &

sleep 30s && thunderbird &
audacious &
sakura --class='midnight' -e /home/michael/bin/mc.sh &

exec ck-launch-session /usr/bin/xmonad

