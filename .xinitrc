xrdb -merge ~/.Xresources

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
#transmission-dog &
audacious &

parcellite -dn &

#sed -i 's/firefox -P escapizm/firefox -P main/' ~/.xmonad/xmonad.hs
firefox >/dev/null &
emacs &

sleep-while-inet-down && pidgin-dog &
# Skype run auto with skype plugin in pidgin
#sleep 30s && skype &

sleep-while-inet-down && icedove &
#audacious &
sakura --class='midnight' -e /home/michael/bin/mc.sh &

exec ck-launch-session /usr/bin/xmonad

