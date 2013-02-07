[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

xsetroot -cursor_name left_ptr
xsetroot -solid "#333333"
xhost local:

exec /usr/bin/xmonad

