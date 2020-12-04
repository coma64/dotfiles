# Load .Xresources if it exists
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

setxkbmap dvp
xset r rate 250 50

# Enable screen locker
# xautolock -time 10 -locker i3lock-fancy-dualmonitor &

# exec bspwm
export DESKTOP_SESSION=plasma
exec startplasma-x11
