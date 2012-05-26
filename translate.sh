#!/bin/sh
# Обвязка для translate.py
notify-send "$(xsel -o)" "$(python2 /home/michael/bin/translate.py "$(xsel -o | sed "s/[\"'<>]//g")" | head -n 35)"
echo "`xsel -o`\n" >> /home/michael/doc/translated
