export EDITOR='nvim'
export VISUAL='nvim'
export PAGER=`[ command -v bat &>/dev/null ] && echo 'bat' || echo 'less'`
export BROWSER='chromium'
export MANPAGER='less'
export PF_ASCII='default'
export PATH="$HOME/bin:$HOME/spicetify-cli:$HOME/.poetry/bin:$HOME/.pyenv/bin:$HOME/.cargo/bin:$HOME/.local/bin:/snap/bin:/opt/code/bin:$PATH"
export LANG='en_US.UTF-8'
export SNCLIRC="$HOME/.config/sncli/snclirc"
export FZF_DEFAULT_OPTS='--reverse --inline-info --height 40%'
export FZF_DEFAULT_COMMAND='fd --type file --hidden'
export FZF_CTRL_T_COMMAND='fd --type file --type directory --hidden'
export FZF_ALT_C_COMMAND='fd --type directory --hidden'
export TERMINAL='alacritty'
export _JAVA_AWT_WM_NONREPARENTING=1

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# asdf version manager
[ -f /opt/asdf-vm/asdf.sh ] && . /opt/asdf-vm/asdf.sh 
[ -f $HOME/.asdf/asdf.sh ] && . $HOME/.asdf/asdf.sh

[[ ! $DISPLAY && $XDG_VTNR -eq 1 ]] && startx
