sleep .1; xrandr --output DP-2 --rotate normal --pos 0x0 --output DP-4 --rotate normal --pos 3840x0
sleep .1; feh --bg-scale --no-xinerama --randomize ~/Pictures/wallpaper.png

xscreensaver -no-splash &

/usr/bin/pkill stalonetray
sleep 1; stalonetray

sleep 2; feh --bg-scale --no-xinerama --randomize ~/Pictures/wallpaper.png

sleep 1
pkill nm-applet
sleep 1
nm-applet n
sleep 1
dropbox stop
sleep 1
dropbox start

sleep 1
pkill redshift-gtk
sleep 1
redshift-gtk
