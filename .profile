export EDITOR="nvim"
export VISUAL="nvim"
export PAGER=$([[ $(which "bat") ]] && echo "bat" || echo "less")
export BROWSER="google-chrome-stable"
export MANPAGER="less"
export PF_ASCII="default"
export PATH="$HOME/bin:$HOME/spicetify-cli:$HOME/.poetry/bin:$HOME/.pyenv/bin:$HOME/.cargo/bin:$HOME/.local/bin:/snap/bin:/opt/code/bin:$PATH"
export LANG="en_US.UTF-8"
export SNCLIRC="$HOME/.config/sncli/snclirc"

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# asdf version manager
[ -f /opt/asdf-vm/asdf.sh ] && . /opt/asdf-vm/asdf.sh 
[ -f $HOME/.asdf/asdf.sh ] && . $HOME/.asdf/asdf.sh

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    startx
fi
