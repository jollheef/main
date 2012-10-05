import XMonad
import XMonad.Util.EZConfig  -- key/mouse bindings
import XMonad.Actions.CopyWindow -- for copyToAll
import XMonad.Actions.GridSelect -- GridSelect displays items(e.g. the opened windows)
                                 -- in a 2D grid and lets the user select from it with the cursor/hjkl keys or the mouse. 
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
--    , layoutHook = myLayout
    } `additionalKeysP` myKeysP
-- Define amount and names of workspaces  
myWorkspaces = ["1:emacs","2:web","3:term","4:work","5:virtualization","6:media","7:music","8:im","9:mail"]
-- appName/className/title to workspace
myManageHook = composeAll  
 [ className =? "Emacs"         --> doShift "1:emacs"

 , className =? "Conkeror"      --> doShift "2:web"
 , className =? "Firefox"       --> doShift "2:web"

 , className =? "midnight"    --> doShift "3:term"

 , className =? "VirtualBox"    --> doShift "5:virtualization"


 , className =? "Vlc"           --> doShift "6:media"
 , className =? "Audacious"     --> doShift "7:music"
 , className =? "Pidgin"        --> doShift "8:im"
 , className =? "Thunderbird"   --> doShift "9:mail"
 , className =? "Xfce4-notifyd" --> doF W.focusDown <+> doF copyToAll
 , className =? "stalonetray"   --> doF W.focusDown <+> doShift "9:mail"
 ]
-- M - modMask, M1 - Alt, C - Control, S - Shift  
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

          , ("<Pause>",                 spawn "slocktogglevolume.sh")
          , ("M-f",                     spawn "firefox")
--          , ("M-c",                     spawn "conkeror-run")
          , ("M-a",                     spawn "sudo -u anonfox -H firefox")
          , ("M-C-a",                   spawn "sudo /etc/rc.d/rc.tor restart && DISPLAY=:0 notify-send -t 2500 'Tor::Restarted'")
          , ("M-e",                     spawn "emacs")
--          , ("M-e",                     spawn "emacsscript && emacsclient -c")
--          , ("M-C-e",                   spawn "sudo rc.d restart emqacsd && emacsclient -c")
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

          , ("M-g",                     goToSelected defaultGSConfig) -- GridSelect

          , ("M-<F9>",                  spawn "audacious -t")
          , ("M-<F10>",                 spawn "audacious -r")
          , ("M-<F11>",                 spawn "audacious -f")
          ]
