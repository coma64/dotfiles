module Main where

import XMonad
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.Ungrab (unGrab)
import XMonad.Layout.ThreeColumns (ThreeCol(..))
import XMonad.Hooks.EwmhDesktops (ewmh)
import XMonad.Hooks.DynamicLog

fillWorkspaces :: [String] -> Int -> [String]
fillWorkspaces ws x = ws ++ (show <$> [l..l + x])
    where l = length ws

-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.
myLayout = tiled ||| Mirror tiled ||| Full
  where
    tiled    = Tall nmaster delta ratio
    nmaster  = 1      -- Default number of windows in the master pane
    ratio    = 1/2    -- Default proportion of screen occupied by master pane
    delta    = 3/100  -- Percent of screen to increment by when resizing panes


myConfig = def
    { modMask               = mod4Mask
    , terminal              = "alacritty"
    , focusFollowsMouse     = False
    , normalBorderColor     = "#888888"
    , focusedBorderColor    = "#bed600"
    , workspaces            = fillWorkspaces ["web", "code", "music"] 10
    , layoutHook            = myLayout
    }
    `additionalKeysP`
    [ ("M-c", spawn "google-chrome-stable")
    , ("M-s", unGrab *> spawn "scrot -s")
    , ("M-m", spawn "spotify")
    ]

main :: IO ()
main = xmonad . ewmh =<< xmobar myConfig
