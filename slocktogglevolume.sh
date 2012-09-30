#!/bin/sh
savebr="$(brightness show)"
brightness set 0
if [[ ''$(amixer sget 'Master' toggle | grep "Mono:" | awk '{print $6}')'' == '[on]' ]]; then
    volume toggle && slock && volume toggle
else
    slock
fi
brightness set $savebr
