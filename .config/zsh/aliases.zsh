alias jctl="journalctl -p 3 -xb"
alias pscpu='ps ax o user,pid,pcpu,pmem,time,comm k -pcpu | head'
alias psmem='ps ax o user,pid,pcpu,pmem,time,comm k -pmem | head'
alias cpr='rsync --archive -hh --partial --info=stats1 --info=progress2 --modify-window=1'
alias mvr='rsync --archive -hh --partial --info=stats1 --info=progress2 --modify-window=1 --remove-source-files'

alias cp='cp -i'
alias df='df -h'
alias doas='doas '
alias du='du -h'
alias mv='mv -i'
alias grep='grep --color=auto'
alias free='free -h'
alias pacman='paru'
alias rg='kitty +kitten hyperlinked_grep'

alias b='br'
alias bm='batman'
alias vi='nvim'
alias p='paru'
alias n='nnn-quit-cd -RAex'
alias l='n -d'
alias zz='exec zsh'
# alias t='tmux'
# alias tp='tmuxp load'
alias t='todoist-cli'
alias kt='kitty'

function kts() {
    kitty --session sessions/$1 &!
}

alias af='alias-finder -l'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias cap="bat /sys/class/power_supply/BAT0/capacity"
alias color-test="msgcat --color=test"
alias config="git --git-dir=${HOME}/.local/share/dotfiles --work-tree=${HOME}/"
alias config-lg="lazygit --git-dir=${HOME}/.local/share/dotfiles --work-tree=${HOME}/"
alias elev-priv="$(type 'sudo' &> /dev/null && echo 'sudo ' || echo 'doas ')"
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l'
alias gpg-check='gpg2 --keyserver-options auto-key-retrieve --verify'
alias gpg-retrieve='gpg2 --keyserver-options auto-key-retrieve --receive-keys'
alias hw='hwinfo --short'
alias iem='interactive_emerge'
alias ipinfo='curl --silent ipinfo.io'
alias nethogs='nethogs -v 3 -d 0.1'
alias no='br ${HOME}/notes'
alias po='elev-priv poweroff'
alias rb='elev-priv reboot'
alias res-port-tmp='resize_portage_tmpdir'
alias rm='rm -I'
alias sudo='sudo '
alias tiny='tiny_url'
alias gcff='fzf-git-checkout'
alias lg='lazygit'
alias lc='lazydocker'
alias tb='nc termbin.com 9999'

# alias update-tebil-tarball="cp $DEVELOPMENT_FOLDER/js/tebils/dist/tebils-2.0.0.tgz"

# docker compose
alias dc='docker compose'
alias dcu='dc up'
alias dcud='dc up -d'
alias dcudb='dc up -d --build'
alias dcl='dc logs'
alias dce='dc exec'
alias dcd='dc down'
alias dcdv='dc down -v'
alias dcr='dc restart'

# python manage.py
alias pm='python manage.py'
alias pms='pm shell'
alias pmd='pm db_shell'
alias pmdl='pm debug_login'

# Replace yay with paru if installed
[ ! -x /usr/bin/yay ] && [ -x /usr/bin/paru ] && alias yay='paru'

if command -v 'lsd' &> /dev/null; then
    alias ls='lsd --hyperlink=auto'
    alias ll='ls -lA'
    alias lld='ls -ld'
else
    alias ls='ls --hyperlink=auto --color=auto'
    alias ll='ls -lah'
    alias lld='ls -ld'
fi

function npm-aliases() {
    alias ${1}="${2}"
    alias ${1}s="${2} start"
    alias ${1}r="${2} run"
    alias ${1}d="${2} run dev"
    alias ${1}g="${2} run generate"
    alias ${1}b="${2} run build"
    alias ${1}w="${2} run watch"
    alias ${1}bw="${2} run build:watch"
    alias ${1}l="${2} link"
}

npm-aliases np npm
npm-aliases pn pnpm
