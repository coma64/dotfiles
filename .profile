export EDITOR="nvim"
export VISUAL="nvim"
export PAGER=$([[ $(which "bat") ]] && echo "bat" || echo "less")
export BROWSER="google-chrome-stable"
export PF_ASCII="default"
#export TERM="xterm-256color"
export PATH="$HOME/spicetify-cli:$HOME/.poetry/bin:$HOME/.pyenv/bin:$HOME/.cargo/bin:$HOME/.local/bin:$HOME/bin:/snap/bin:/opt/code/bin:$PATH"
export LANG=en_US.UTF-8

# broot
source /home/coma/.config/broot/launcher/bash/br

# pyenv (could be slow)
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# thefuck (default alias: fuck)
eval $(thefuck --alias)

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
