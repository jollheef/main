#!/bin/sh
if [[ ''$(amixer sget 'Master' toggle | grep "Mono:" | awk '{print $6}')'' == '[on]' ]]; then
    volume toggle && slock && volume toggle
else
    slock
fi