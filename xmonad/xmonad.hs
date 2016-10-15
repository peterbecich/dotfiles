import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Config.Desktop
import XMonad.Util.SpawnOnce
import XMonad.Actions.WorkspaceNames
import System.IO

baseConfig = desktopConfig

main = xmonad . myConfig =<< spawnPipe "xmobar"
             
myConfig pipe = desktopConfig {modMask = controlMask .|. mod1Mask
        , terminal = "rxvt"
        , startupHook = startupHook baseConfig <+> spawnOnce "rxvt"
        , logHook = myLogHook pipe
        , manageHook = manageDocks            
        } `additionalKeys`
        [ ((controlMask .|. mod1Mask, xK_m), spawn "emacsclient -c") ]

myLogHook pipe = workspaceNamesPP xmobarPP {
                   ppOutput = hPutStrLn pipe
                 } >>= dynamicLogWithPP
             


