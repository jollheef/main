PATHBIN="/home/michael/bin/"
#${PATHBIN}/

xrdb -merge ~/.Xresources

xsetroot -cursor_name left_ptr
xsetroot -solid "#333333"
xhost local:

xautolock -time 1 -locker "${PATHBIN}/slocktogglevolume.sh" \
    -nowlocker "${PATHBIN}/slocktogglevolume.sh" -detectsleep &
#nmvpn_auto2 &
${PATHBIN}/tpvpn_auto &
${PATHBIN}/ifexping &
${PATHBIN}/touchpad.sh &
#autorun3gmodem.sh &
wmname LG3D &
${PATHBIN}/battery-notify &
#transmission-dog &
#rhythmbox &
audacious &

#parcellite -dn &
glipper &

#sed -i 's/firefox -P escapizm/firefox -P main/' ~/.xmonad/xmonad.hs
firefox >/dev/null &
emacs &

#send info to phone
#/home/michael/bin/vksensors.sh &

${PATHBIN}/sleep-while-inet-down && ${PATHBIN}/pidgin-dog &
# Skype run auto with skype plugin in pidgin
#sleep 30s && skype &

${PATHBIN}/sleep-while-inet-down && icedove &
#audacious &
#sakura --class='midnight' -e /home/michael/bin/mc.sh &
sakura --class='midnight' &

exec ck-launch-session /usr/bin/xmonad

