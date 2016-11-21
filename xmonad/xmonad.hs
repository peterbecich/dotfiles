import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Config.Desktop
import XMonad.Util.SpawnOnce
import XMonad.Actions.WorkspaceNames
--import XMonad.Actions.Volume
import System.IO

-- baseConfig = desktopConfig


-- main = xmonad . myConfig =<< spawnPipe "xmobar"
             
-- myConfig pipe = desktopConfig {modMask = controlMask .|. mod1Mask
--         , terminal = "rxvt"
--         , startupHook = startupHook baseConfig <+> spawnOnce "rxvt"
--         , logHook = myLogHook pipe
--         , manageHook = manageDocks
--         , layoutHook = avoidStruts $ layoutHook defaultConfig
--         } `additionalKeys`
--         [ ((controlMask .|. mod1Mask, xK_m), spawn "emacsclient -c"),
--           ((controlMask .|. mod1Mask, xK_s), spawn "systemctl suspend -i")--,
--  --         ((mod1Mask, xK_F7), lowerVolume 4 >> return()),
--  --         ((mod1Mask, xK_F8), raiseVolume 4 >> return())
                                                                          
--         ]

-- myLogHook pipe = workspaceNamesPP xmobarPP {
--                    ppOutput = hPutStrLn pipe
--                  } >>= dynamicLogWithPP


main :: IO ()
main = do
  h <- spawnPipe "xmobar"
  xmonad $ defaultConfig {
          modMask = controlMask .|. mod1Mask
        , terminal = "gnome-terminal"
        , startupHook = startupHook defaultConfig
        , logHook = dynamicLogWithPP $ defaultPP {
                            ppOutput = hPutStrLn h
                                       }
        , manageHook = manageDocks <+> manageHook defaultConfig
        , layoutHook = avoidStruts $ layoutHook defaultConfig
        } `additionalKeys`
        [ ((controlMask .|. mod1Mask, xK_m), spawn "emacsclient -c"),
          ((controlMask .|. mod1Mask, xK_s), spawn "systemctl suspend"),
          ((controlMask .|. mod1Mask, xK_n), spawn "nautilus -w"),
          ((mod1Mask .|. shiftMask, xK_t), spawn "gnome-terminal")
 --         ((mod1Mask, xK_F7), lowerVolume 4 >> return()),
 --         ((mod1Mask, xK_F8), raiseVolume 4 >> return())
                                                                          
        ]

