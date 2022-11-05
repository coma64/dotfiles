export AMD_VULKAN_ICD=RADV
export BROWSER=google-chrome-stable
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export MAIL=thunderbird
export TERM=xterm-256color
export EDITOR=nvim
export VISUAL=nvim
export PYENV_ROOT="${HOME}/.pyenv"
export PATH="${HOME}/go/bin:${HOME}/.ghcup/bin:${HOME}/.nodenv/bin:${HOME}/.poetry/bin:${PYENV_ROOT}/bin:${HOME}/.local/bin:${PATH}"
export DEVELOPMENT_FOLDER="${HOME}/dev"
export AUTOENV_ENV_FILENAME='.envrc'
export MAKEFLAGS='-j16'

# asdf
[ -f "/opt/asdf-vm/asdf.sh" ] && source "/opt/asdf-vm/asdf.sh"
# pyenv
if which pyenv &>/dev/null; then
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi
# nodenv
which nodenv &>/dev/null && eval "$(nodenv init -)"
# ghcup
[ -f "/home/zaton/.ghcup/env" ] && source "/home/zaton/.ghcup/env"
# cargo
[ -f  "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"



# Added by Toolbox App
export PATH="$PATH:/home/zaton/.local/share/JetBrains/Toolbox/scripts"
