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
  --_ <- spawn "sleep 1; xrandr --output HDMI-0 --rotate left --pos 1200x0"
  _ <- spawn "sleep 1; xrandr --output HDMI-0 --rotate left --pos 1920x0"
  _ <- spawn "sleep 1; xrandr --output DVI-D-0 --rotate normal --pos 0x400"
  --_ <- spawn "sleep 1; xrandr --output DVI-D-0 --rotate left --pos 0x0"
  --_ <- spawn "sleep 1; xrandr --output DVI-D-0 --pos 0x360 --output HDMI-0 --pos 1920x0"
  h <- spawnPipe "/usr/local/bin/xmobar"
  _ <- spawnPipe "setxkbmap -option ctrl:nocaps"
  _ <- spawnPipe "sleep 2; feh --bg-fill --randomize  ~/Pictures/wallpapers/rotated-*"
  --_ <- spawnPipe "/usr/bin/pkill stalonetray"
  --_ <- spawnPipe "sleep 1; /usr/bin/stalonetray &"
  xmonad $ docks defaultConfig {
        modMask = mod4Mask
        , XMonad.focusFollowsMouse = False
        , terminal = "gnome-terminal"
        , logHook = dynamicLogWithPP $ defaultPP { ppOutput = hPutStrLn h }
        , manageHook = manageHook defaultConfig
        , layoutHook = avoidStruts $ smartBorders $ layoutHook defaultConfig
        } `additionalKeys`
        [ ((mod4Mask, xK_m), spawn "emacsclient -c")
          , ((mod4Mask, xK_s), spawn "systemctl suspend")
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

