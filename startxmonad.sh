#!/bin/bash
# /home/peterbecich/.cabal/bin/xmobar &
sleep .5
/home/peterbecich/.dropbox-dist/dropboxd &
emacsclient -c &
stalonetray &
exec xmonad-session


