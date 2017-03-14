import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ManageDocks --  ( avoidStruts, docks )
import XMonad.Util.Run
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Config.Desktop
import XMonad.Util.SpawnOnce
import XMonad.Actions.WorkspaceNames
-- import XMonad.Actions.Volume  -- xmonad-extras not compatible with xmonad 0.13
import System.IO

main :: IO ()
main = do
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
        , layoutHook = avoidStruts $ layoutHook defaultConfig
        } `additionalKeys`
        [ ((controlMask .|. mod1Mask, xK_m), spawn "emacsclient -c"),
          ((controlMask .|. mod1Mask, xK_s), spawn "systemctl suspend"),
          ((controlMask .|. mod1Mask, xK_n), spawn "nautilus -w"),
          ((controlMask .|. mod1Mask, xK_f), spawn "firefox --new-window"),
          ((mod1Mask .|. shiftMask, xK_t), spawn "gnome-terminal")
 --         ((mod1Mask, xK_F7), lowerVolume 4 >> return()),
 --         ((mod1Mask, xK_F8), raiseVolume 4 >> return())
                                                                          
        ]

