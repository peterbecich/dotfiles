import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Config.Desktop
import XMonad.Util.SpawnOnce
import System.IO

baseConfig = desktopConfig

main = do
  xmproc <- spawnPipe "xmobar"
--dynamicLogWithPP $ defaultPP { ppOutput = hPutStrLn h }
  xmonad $ baseConfig
      { logHook = dynamicLogWithPP xmobarPP { ppOutput = hPutStrLn xmproc }
        , modMask = controlMask .|. mod1Mask
	, terminal = "rxvt"
	, startupHook = startupHook baseConfig <+> spawnOnce "rxvt"
	}

--quitWithWarning :: X ()
--quitWithWarning = do
--    let m = "confirm quit"
--    s <- dmenu [m]
--    when (m == s) (io exitSuccess) 

