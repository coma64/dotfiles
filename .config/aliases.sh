if command -v 'fd' &> /dev/null; then
    alias fdf="fd --type file --hidden --no-ignore --ignore-case --glob --list-details --follow"
    alias fdd="fd --type directory --hidden --no-ignore --ignore-case --glob --list-details --follow"
else
    alias fdf="find -type f -O3 -L -ls -iname"
    alias fdd="find -type d -O3 -L -ls -iname"
fi

if command -v 'lsd' &> /dev/null; then
    alias ll="lsd -lA"
    alias lld="lsd -ld"
else
    alias ll="ls --color=auto -lah"
    alias lld="ls --color=auto -ld"
fi

alias git="hub"
alias config="git --git-dir=$HOME/.local/share/dotfiles --work-tree=$HOME/"
alias exchr="curl rate.sx"
alias wip="curl --silent ipinfo.io"
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
alias c="broot -h $HOME/.config"
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -I"
alias df='df -h'
alias free='free -m'
alias sn="sudo shutdown now"
alias sr="sudo reboot"
alias jctl="journalctl -p 3 -xb"
# verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
# receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
alias ytv="youtube-dl -f bestvideo+bestaudio "
alias yta="youtube-dl --extract-audio --audio-format mp3 "

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
