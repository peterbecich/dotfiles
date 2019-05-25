import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ManageDocks ( avoidStruts , docks)
-- import XMonad.Hooks.ManageDocks ( docks )
import XMonad.Util.Run
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Config.Desktop
import XMonad.Util.SpawnOnce
-- import XMonad.Layout.Reflect
-- import qualified XMonad.Layout.ToggleLayouts as TL
import XMonad.Layout.MultiToggle
import XMonad.Layout.NoBorders
import XMonad.Actions.WorkspaceNames
import XMonad.Actions.CycleWS
import XMonad.Actions.GridSelect
import XMonad.Actions.FindEmptyWorkspace
import XMonad.Actions.Volume  -- xmonad-extras not compatible with xmonad 0.13
import System.IO

main :: IO ()
main = do
  h <- spawnPipe "~/.local/bin/xmobar"
  _ <- spawnPipe "setxkbmap -option ctrl:nocaps,altwin:swap_lalt_lwin"
  _ <- spawnPipe "xrandr --output DP-2 --brightness 0.9"
  _ <- spawnPipe "sleep 2; feh --bg-fill --randomize  ~/Pictures/wallpapers/*"
  _ <- spawnPipe "/usr/bin/pkill stalonetray"
  _ <- spawnPipe "xscreensaver -no-splash &"
  _ <- spawnPipe "sleep 1; /usr/bin/stalonetray &"
  _ <- spawnPipe "~/dotfiles/bin/init.sh"
  _ <- spawnPipe "sleep 1; /usr/bin/nm-applet &"
  xmonad $ docks defaultConfig {
        modMask = mod4Mask
        , XMonad.focusFollowsMouse = False
        , terminal = "gnome-terminal"
        , borderWidth = 2
        , logHook = dynamicLogWithPP $ defaultPP { ppOutput = hPutStrLn h }
        , manageHook = manageHook defaultConfig
        , layoutHook = avoidStruts $ smartBorders $ layoutHook defaultConfig
        } `additionalKeys`
        [ ((mod4Mask, xK_m), spawn "emacsclient -c")
          , ((mod4Mask, xK_s), spawn "xscreensaver-command -lock; sleep 2; systemctl suspend")
          , ((mod4Mask .|. shiftMask, xK_s), spawn "xscreensaver-command -lock")
          -- ((mod4Mask, xK_p), spawn "xset dpms force suspend"),
          , ((mod4Mask, xK_n), spawn "nautilus -w")
          , ((mod4Mask, xK_f), spawn "firefox --new-window")
          , ((mod4Mask, xK_0), viewEmptyWorkspace)
          , ((mod4Mask, xK_c), swapNextScreen)
          , ((mod4Mask .|. shiftMask, xK_t), spawn "gnome-terminal")
          , ((mod4Mask, xK_g), goToSelected defaultGSConfig)
          , ((mod4Mask, xK_F11 ), lowerVolume 3 >> return ())
          , ((mod4Mask, xK_F12 ), raiseVolume 3 >> return ())
          , ((mod4Mask, xK_F10), toggleMute    >> return ())
          , ((mod4Mask, xK_F7), spawn "setxkbmap -layout dvorak")          
          , ((mod4Mask, xK_F8), spawn "setxkbmap -layout us")
          
        ]

