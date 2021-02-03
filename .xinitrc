# Load .Xresources if it exists
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

setxkbmap de
xset r rate 250 50

# Enable screen locker
# xautolock -time 10 -locker i3lock-fancy-dualmonitor &

exec dbus-launch --exit-with-session qtile
#export DESKTOP_SESSION=plasma
#exec startplasma-x11
