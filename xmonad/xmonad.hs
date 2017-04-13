import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ManageDocks --  ( avoidStruts, docks )
import XMonad.Util.Run
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Config.Desktop
import XMonad.Util.SpawnOnce
import XMonad.Layout.Reflect
-- import qualified XMonad.Layout.ToggleLayouts as TL
import XMonad.Layout.MultiToggle
import XMonad.Layout.NoBorders
import XMonad.Actions.WorkspaceNames
import XMonad.Actions.CycleWS
import XMonad.Actions.GridSelect
-- import XMonad.Actions.Volume  -- xmonad-extras not compatible with xmonad 0.13
import System.IO

main :: IO ()
main = do
  _ <- spawn "xrandr --output DVI-I-3 --rotate left"
  _ <- spawn "xrandr --output DVI-I-2 --auto --pos 0x360 --output DVI-I-3 --auto --pos 2200x0"
  _ <- spawn "feh --bg-fill --no-xinerama ~/Pictures/wallpaper"
  h <- spawnPipe "/home/peterbecich/.cabal/bin/xmobar"
  xmonad $ docks defaultConfig {
          modMask = controlMask .|. mod1Mask
        , XMonad.focusFollowsMouse = False
        , terminal = "gnome-terminal"
        -- , startupHook = docksStartupHook <+> startupHook defaultConfig
        , logHook = dynamicLogWithPP $ defaultPP {
                            ppOutput = hPutStrLn h
                                       }
        , manageHook = manageHook defaultConfig
        , layoutHook = avoidStruts $
          mkToggle (single REFLECTX) $
          mkToggle (single REFLECTY) $
          -- TL.toggleLayouts (noBorders Full) $
          smartBorders $
          -- lessBorders Never (Full 1 0.5 0.03) $
          layoutHook defaultConfig
        } `additionalKeys`
        [ ((controlMask .|. mod1Mask, xK_m), spawn "emacsclient -c"),
          ((controlMask .|. mod1Mask, xK_s), spawn "systemctl suspend"),
          ((controlMask .|. mod1Mask, xK_n), spawn "nautilus -w"),
          ((controlMask .|. mod1Mask, xK_f), spawn "firefox --new-window"),
          ((controlMask .|. mod1Mask, xK_c), swapNextScreen),
          ((controlMask .|. mod1Mask, xK_x), sendMessage $ Toggle REFLECTX),          
          ((controlMask .|. mod1Mask, xK_y), sendMessage $ Toggle REFLECTY),          
          ((mod1Mask .|. shiftMask, xK_t), spawn "gnome-terminal"),
          ((controlMask .|. mod1Mask, xK_g), goToSelected defaultGSConfig)
          
 --         ((mod1Mask, xK_F7), lowerVolume 4 >> return()),
 --         ((mod1Mask, xK_F8), raiseVolume 4 >> return())
                                                                          
        ]

