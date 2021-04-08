import           XMonad                            (Full (Full), Tall (Tall),
                                                    XConfig (borderWidth, focusFollowsMouse, focusedBorderColor, handleEventHook, layoutHook, logHook, manageHook, modMask, terminal),
                                                    defaultConfig, mod4Mask,
                                                    screenWorkspace, shiftMask,
                                                    spawn, whenJust, windows,
                                                    xK_0, xK_F7, xK_F8, xK_c,
                                                    xK_e, xK_f, xK_g, xK_m,
                                                    xK_n, xK_r, xK_s, xK_t,
                                                    xK_w, xmonad, (.|.), (|||))
import           XMonad.Actions.CycleWS            (swapNextScreen)
import           XMonad.Actions.FindEmptyWorkspace (viewEmptyWorkspace)
import           XMonad.Actions.GridSelect         (defaultGSConfig,
                                                    goToSelected)
import           XMonad.Actions.Volume             (lowerVolume, raiseVolume,
                                                    toggleMute)
import           XMonad.Hooks.DynamicLog           (PP (ppOutput), defaultPP,
                                                    dynamicLogWithPP)
import           XMonad.Hooks.EwmhDesktops         (fullscreenEventHook)
import           XMonad.Hooks.ManageDocks          (avoidStruts, docks)
import           XMonad.Layout.NoBorders           (smartBorders)
import           XMonad.Layout.Spiral              (spiral)
import           XMonad.Util.EZConfig              (additionalKeys)
import           XMonad.Util.Run                   (hPutStrLn, spawnPipe)

import qualified XMonad.StackSet                   as W


-- myLayout = mosaic 2 [3,2] ||| Full ||| Tall
-- https://github.com/xmonad/xmonad/wiki/Layouts
-- myLayout = mosaic 2 [3,2] ||| Full ||| Tall 1 (3/100) (1/2) ||| Grid
myLayout = Tall 1 (3/100) (1/2) ||| Full ||| spiral (6/7)

-- https://wiki.haskell.org/Xmonad/Frequently_asked_questions#Screens_are_in_wrong_order
flipScreens = [((m .|. mod4Mask, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [1,0]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

myKeys = [
  ((mod4Mask, xK_m), spawn "emacsclient -c")
  , ((mod4Mask, xK_s), spawn "xscreensaver-command -lock; sleep 2; systemctl suspend; sleep 2; xrandr --output DP-2 --auto --panning 3840x2160+3840+0 --output DP-4 --panning 3840x2160+0+0 --right-of DP-2")
  , ((mod4Mask, xK_n), spawn "nautilus -w")
  , ((mod4Mask, xK_f), spawn "firefox --new-window")
  , ((mod4Mask, xK_0), viewEmptyWorkspace)
  , ((mod4Mask, xK_c), swapNextScreen)
  , ((mod4Mask .|. shiftMask, xK_t), spawn "gnome-terminal")
  , ((mod4Mask, xK_g), goToSelected defaultGSConfig)
  , ((0, 0x1008ff11), lowerVolume 3 >> return ())
  , ((0, 0x1008ff13), raiseVolume 3 >> return ())
  , ((0, 0x1008ff12), toggleMute    >> return ())
  , ((mod4Mask, xK_F7), spawn "setxkbmap -layout dvorak")
  , ((mod4Mask, xK_F8), spawn "setxkbmap -layout us")
  ] ++ flipScreens



main :: IO ()
main = do
  h <- spawnPipe "~/.cabal/bin/xmobar"
  _ <- spawnPipe "~/dotfiles/bin/init.sh"
  xmonad $ docks defaultConfig
        { modMask = mod4Mask
        , borderWidth = 4
        , focusedBorderColor = "#A61D00"
        , XMonad.focusFollowsMouse = False
        , terminal = "gnome-terminal"
        , logHook = dynamicLogWithPP $ defaultPP { ppOutput = hPutStrLn h }
        , manageHook = manageHook defaultConfig
        , layoutHook = avoidStruts $ smartBorders $ myLayout
        , handleEventHook = fullscreenEventHook
        } `additionalKeys` myKeys
