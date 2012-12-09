#!/bin/bash
xinput set-int-prop "SynPS/2 Synaptics TouchPad" "Device Enabled" 8 1
xinput set-int-prop "SynPS/2 Synaptics TouchPad" "Synaptics Two-Finger Pressure" 32 10
xinput set-int-prop "SynPS/2 Synaptics TouchPad" "Synaptics Two-Finger Width" 32 9
xinput set-int-prop "SynPS/2 Synaptics TouchPad" "Synaptics Edge Scrolling" 8 0 0 0
xinput set-int-prop "SynPS/2 Synaptics TouchPad" "Synaptics Jumpy Cursor Threshold" 32 110
xinput set-int-prop "SynPS/2 Synaptics TouchPad" "Synaptics Two-Finger Scrolling" 8 1 1

# Not work (!)
#syndaemon -k -i 1 -d &
# Disable TouchPad
synclient TouchpadOff=1 &
# Disable tap-to-click
synclient TapButton1=0 &
synclient TapButton2=0 &
synclient TapButton3=0 &
synclient VertTwoFingerScroll=0 &
synclient HorizTwoFingerScroll=0 &
