import XMonad
--import XMonad.Core
import XMonad.Util.EZConfig  -- key/mouse bindings
import XMonad.Actions.CopyWindow -- for copyToAll
import XMonad.Actions.GridSelect -- GridSelect displays items(e.g. the opened windows)
                                 -- in a 2D grid and lets the user select from it with the cursor/hjkl keys or the mouse.
import XMonad.Layout
import XMonad.Layout.PerWorkspace  -- use different layouts on different WSs
import XMonad.Layout.Master
import XMonad.Layout.Reflect -- for gimp layout
import XMonad.Hooks.ManageDocks



--import XMonad.Layout.Named
--import XMonad.Layout.Reflect

import XMonad.Layout.IM
import XMonad.Layout.Grid
import Data.Ratio ((%))
import XMonad.Layout.Spacing

import qualified XMonad.StackSet as W -- for W.focusDown

main = do
  xmonad $ defaultConfig
    { terminal    = "sakura"
    , borderWidth = 0
    , focusedBorderColor = "#2f2f2f" -- "#000000"
    , normalBorderColor  = "#353535"
    , modMask     = mod4Mask
    , manageHook = myManageHook
    , workspaces = myWorkspaces
    , layoutHook = myLayout
    } `additionalKeysP` myKeysP
-- Define amount and names of workspaces
myWorkspaces = ["1:emacs","2:web","3:term","4:work","5:virtualization","6:media","7:music","8:im","9:mail"]
gridLayout = spacing 8 $ Grid
pidginLayout = withIM (18/100) (Role "buddy_list") gridLayout
tiled50 = Tall 2 (3/100) (50/100)
--tiled75 = Tall 2 (3/100) (75/100)
gimpLayout = withIM (0.175) (Role "gimp-toolbox") $
  withIM (0.10) (Role "toolbox_window") $
  reflectHoriz $
  withIM (0.20) (Role "gimp-dock") $
  layoutHook defaultConfig
--testLayout = Full ||| Grid

myLayout = avoidStruts $
--             onWorkspace "1:emacs"              Full $
--             onWorkspace "2:web"                Full $
--             onWorkspace "3:term"               tiled50 $
             onWorkspace "4:work"               gimpLayout $
--             onWorkspace "5:virtualization"     Full $
--             onWorkspace "6:media"              Full $
--             onWorkspace "7:music"              tiled50 $
             onWorkspace "8:im"                 pidginLayout $
--             onWorkspace "9:mail"               tiled50 $
                 Full ||| tiled50 ||| Mirror tiled50
--                 tiled50 ||| Mirror tiled50 ||| Full

-- appName/className/title to workspace. Use xprop.
myManageHook = composeAll
  [ className =? "Emacs"                --> doShift "1:emacs"

  , className =? "Conkeror"             --> doShift "2:web"
  , className =? "Firefox"              --> doShift "2:web"
  , className =? "Iceweasel"            --> doShift "2:web"

  , className =? "midnight"             --> doShift "3:term"

  , className =? "OpenOffice.org 3.2"   --> doShift "4:work"
  , className =? "Mathematica"          --> doShift "4:work"
  , className =? "XMathematica"         --> doShift "4:work"
  , className =? "Gimp"                 --> doShift "4:work"
  , role      =? "gimp-layer-new"       --> doFloat
  , role      =? "gimp-color-selector"  --> doFloat
  , role      =? "gimp-dock"            --> doF W.focusDown
  , role      =? "gimp-toolbox"         --> doF W.focusDown
  , role      =? "toolbox_window"       --> doF W.focusDown

  , className =? "VirtualBox"           --> doShift "5:virtualization"
  , className =? "Wine"                 --> doShift "5:virtualization"

  , className =? "Vlc"                  --> doShift "6:media"
  , className =? "MPlayer"              --> doShift "6:media"

  , className =? "Audacious"            --> doShift "7:music"
  , className =? "Mumble"               --> doShift "7:music"

  , className =? "Pidgin"               --> doShift "8:im"
  , className =? "Skype"                --> doShift "8:im"

  , className =? "Zenity"               --> doFloat

  , className =? "Thunderbird"          --> doShift "9:mail"
  , className =? "Mail"                 --> doShift "9:mail"
  , className =? "Icedove"              --> doShift "9:mail"

  , className =? "Xfce4-notifyd"        --> doF W.focusDown <+> doF copyToAll
  , className =? "stalonetray"          --> doF W.focusDown <+> doShift "9:mail"
  ]
 where role = stringProperty "WM_WINDOW_ROLE"
-- M - modMask, M1 - Alt, C - Control, S - Shift. Use xev.
myKeysP = [ ("<XF86MonBrightnessUp>",   spawn "brightness inc 25")
          , ("<XF86MonBrightnessDown>", spawn "brightness dec 25")
          , ("<XF86Launch1>",           spawn "brightness toggle")
          , ("<XF86AudioRaiseVolume>",  spawn "volume inc 5")
          , ("<XF86AudioLowerVolume>",  spawn "volume dec 5")
          , ("<XF86AudioMute>",         spawn "volume toggle")
          , ("M-]",                     spawn "brightness inc 15")
          , ("M-[",                     spawn "brightness dec 15")
          , ("M-\\",                    spawn "brightness toggle")
          , ("M-S-]",                   spawn "volume inc 5")
          , ("M-S-[",                   spawn "volume dec 5")
          , ("M-S-\\",                  spawn "volume toggle")
          , ("M-S-b",                   spawn "battery")
          , ("M-S-t",                   spawn "temperature")
          , ("M-S-u",                   spawn "uptime.sh")
          , ("M-C-t",                   spawn "DISPLAY=:0 notify-send -t 3000 \"$(transmission-remote -l)\"")

          , ("M-S-v",                   spawn "volume show")

          , ("<Pause>",                 spawn "slocktogglevolume.sh")
          , ("S-<Pause>",               spawn "slock-toggle-br.sh")
          , ("C-<Pause>",               spawn "xautolock -disable")
          , ("C-S-<Pause>",             spawn "xautolock -enable")

          , ("M-f",                     spawn "firefox >/dev/null 2>&1")
--          , ("M-f",                     spawn "firefox -private >/dev/null 2>&1")
--          , ("M-c",                     spawn "conkeror-run")
          , ("M-a",                     spawn "sudo -u anonfox -H firefox >/dev/null 2>&1")
          , ("M-C-a",                   spawn "sudo service tor restart && DISPLAY=:0 notify-send -t 2500 'Tor::Restarted'")
          , ("M-e",                     spawn "emacs")
--          , ("M-e",                     spawn "emacsscript && emacsclient -c")
--          , ("M-C-e",                   spawn "sudo rc.d restart emacsd && emacsclient -c")
          , ("M-s",                     spawn "sakura")
          , ("<XF86PowerOff>",          spawn "slocktogglevolume.sh & sudo pm-suspend")
          , ("S-<XF86PowerOff>",        spawn "sudo shutdown -h now")
          , ("C-<XF86PowerOff>",        spawn "sudo reboot")
          , ("S-M1-q",                  spawn "translate.sh")
          , ("C-;",                     spawn "synclient TouchpadOff=$(synclient -l | grep -c 'TouchpadOff.*=.*0')")
          , ("C-'",                     spawn "togglemousehide")

          , ("M-d",                     spawn "showdate.sh")

          , ("M-z",                     spawn "allmount.sh 1")
          , ("M-x",                     spawn "allmount.sh 0")

--          , ("<insert>"                 spawn "gmrun")

          , ("M-g",                     goToSelected defaultGSConfig) -- GridSelect

          , ("M-<F9>",                  spawn "audacious -t")
          , ("M-<F10>",                 spawn "audacious -r")
          , ("M-<F11>",                 spawn "audacious -f")

          , ("M-<F7>",                  spawn "record 600 >/dev/null 2>&1")
          , ("M-<F8>",                  spawn "record stop >/dev/null 2>&1")

          , ("M-m",                     spawn "mathematica")

          , ("M-S-m",                   spawn "mumble")
          , ("M-S-e",                   spawn "eveonline")

          , ("M-v",                     spawn "vkplay")
          , ("<Print>",                 spawn "screenshot2")
          ]
