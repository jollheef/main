#!/bin/bash
LOCKER="i3lock --color=333333"
xautolock -disable
savebr="$(brightness show)"
#brightness set 0
if [[ $(amixer sget 'Master' toggle | grep "Mono:" \
    | awk '{print $6}') == '[on]' ]]; then
    volume toggle && ${LOCKER} && volume toggle
else
    ${LOCKER}
fi
brightness set $savebr
xautolock -enable
