if [ command -v fd &>/dev/null ]; then
    alias fdf="fd --type file --hidden --no-ignore --ignore-case --glob --list-details --follow"
    alias fdd="fd --type directory --hidden --no-ignore --ignore-case --glob --list-details --follow"
else
    alias fdf="find -type f -O3 -L -ls -iname"
    alias fdd="find -type d -O3 -L -ls -iname"
fi

alias git="hub"
alias config="git --git-dir=$HOME/.dotfiles --work-tree=$HOME/"
alias exchr="curl rate.sx"
alias wip="curl --silent ipinfo.io"
alias ll="lsd -lA"
alias ld="lsd -ld"
alias l="ls -lah --color=auto"
alias sudo="sudo "
alias tb="nc termbin.com 9999 | tee | xclip -selection clipboard"
alias tiny='function _tinyUrl(){ curl -s http://tinyurl.com/api-create.php?url\="$1"; echo; };_tinyUrl'
alias gbr="git remote get-url origin | xargs xdg-open"
alias grep="grep --color=auto"
alias cap="bat /sys/class/power_supply/BAT0/capacity"
alias wifi-restart="nmcli con down id 'fritzbox-zaton' && nmcli con up id 'fritzbox-zaton'"
alias nethogs="nethogs -lv 4"
alias sncli="sncli --config=$HOME/.config/sncli/snclirc"
alias color-test="msgcat --color=test"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

function tsc() {
    TOTAL_SECONDS_SINCE_CREATION=$(expr `date +%s` - `stat -c %Y $@`)
    MINUTES_SINCE_CREATION=$((TOTAL_SECONDS_SINCE_CREATION / 60))
    SECONDS_SINCE_CREATION=$((TOTAL_SECONDS_SINCE_CREATION % 60))
    echo "Time Since Creation: ${MINUTES_SINCE_CREATION}min  ${SECONDS_SINCE_CREATION}sec"
}

function cpr() {
    rsync --archive -hh --partial --info=stats1 --info=progress2 --modify-window=1 "$@"
} 

function mvr() {
    rsync --archive -hh --partial --info=stats1 --info=progress2 --modify-window=1 --remove-source-files "$@"
}

function wttr {
    city=$(curl --silent ipinfo.io | jq ."city")
    city=${city:1:${#city[@]}-2}

    curl --silent "wttr.in/${city}"
}

function dcd {
    cd $(\fd --hidden --no-ignore --type directory $1 | sed "1q")
}
