import XMonad

import XMonad.Util.EZConfig
import XMonad.Util.Ungrab

import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog

main :: IO ()
main = xmonad . ewmhFullscreen . ewmh . xmobarProp $ myconfig


myconfig = def
    { modMask = mod4Mask,  -- Rebind Mod to the Super key
      logHook = dynamicLog
    }
  `additionalKeysP`
    [ ("M-C-l", spawn "xscreensaver-command -lock")
    , ("M-g"  , spawn "google-chrome")
    ]

