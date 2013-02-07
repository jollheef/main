#!/bin/bash
# Обвязка для translate.py
notify-send -t 1500 "$(xsel -o)" "$(python /home/michael/bin/translate.py "$(xsel -o | sed "s/[\"'<>]//g")" | head -n 35)"
echo "`xsel -o`\n" >> /home/michael/doc/translated
