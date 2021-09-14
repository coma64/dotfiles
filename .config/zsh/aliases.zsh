alias af='alias-finder -l'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias at='fasd -f -e bat'
alias b='br'
alias bm='batman'
alias bb='fasd_broot'
alias c="br -h ${HOME}/.config"
alias cap="bat /sys/class/power_supply/BAT0/capacity"
alias color-test="msgcat --color=test"
alias cg="git --git-dir=${HOME}/.local/share/dotfiles --work-tree=${HOME}/"
alias cp='cp -i'
alias cpr='rsync --archive -hh --partial --info=stats1 --info=progress2 --modify-window=1'
alias d="br -g ${DEVELOPMENT_FOLDER}"
alias l="br -g ${HOME}/.local"
alias df='df -h'
alias doas='doas '
alias du='du -h'
alias elev-priv="$(type 'sudo' &> /dev/null && echo 'sudo ' || echo 'doas ')"
alias exchr='curl rate.sx'
alias free='free -h'
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l'
alias gpg-check='gpg2 --keyserver-options auto-key-retrieve --verify'
alias gpg-retrieve='gpg2 --keyserver-options auto-key-retrieve --receive-keys'
alias grep='grep --color=auto'
alias hw='hwinfo --short'
alias iem='interactive_emerge'
alias ipinfo='curl --silent ipinfo.io'
alias jctl="journalctl -p 3 -xb"
alias mv='mv -i'
alias mvr='rsync --archive -hh --partial --info=stats1 --info=progress2 --modify-window=1 --remove-source-files'
alias n='nvim'
alias nethogs='nethogs -v 3 -d 0.1'
alias nn='fasd -f -e nvim'
alias po='elev-priv poweroff'
alias pscpu='ps ax o user,pid,pcpu,pmem,time,comm k -pcpu | head'
alias psmem='ps ax o user,pid,pcpu,pmem,time,comm k -pmem | head'
alias rb='elev-priv reboot'
alias res-port-tmp='resize_portage_tmpdir'
alias rm='rm -I'
alias sudo='sudo '
alias tb='nc termbin.com 9999'
alias tiny='tiny_url'
alias wttr="curl --silent \"wttr.in/$(ipinfo | jq '.city')\""
alias yta='youtube-dl --extract-audio --audio-format mp3'
alias ytv='youtube-dl -f bestvideo+bestaudio'
alias z='fasd_cd -d'

# Replace yay with paru if installed
[ ! -x /usr/bin/yay ] && [ -x /usr/bin/paru ] && alias yay='paru'

if command -v 'lsd' &> /dev/null; then
    alias ls='lsd'
    alias ll='lsd -lA'
    alias lld='lsd -ld'
else
    alias ls='ls --color=auto'
    alias ll='ls -lah'
    alias lld='ls -ld'
fi
