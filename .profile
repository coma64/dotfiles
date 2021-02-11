[ -f '/etc/profile' ] && . '/etc/profile'

export BROWSER='brave-bin'
export EDITOR='nvim'
export FZF_ALT_C_COMMAND='fd --type directory --hidden'
export FZF_CTRL_T_COMMAND='fd --type file --type directory --hidden'
export FZF_DEFAULT_COMMAND='fd --type file --hidden'
export FZF_DEFAULT_OPTS='--keep-right --layout=reverse --inline-info --height 30%'
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export LANG='en_US.UTF-8'
export PAGER='less'
export PATH="/usr/lib/ccache/bin:${HOME}/go/bin:/opt/vscode-bin/bin:${HOME}/bin:${HOME}/spicetify-cli:${HOME}/.poetry/bin:${HOME}/.pyenv/bin:${HOME}/.cargo/bin:${HOME}/.local/bin:/snap/bin:/opt/code/bin:${PATH}"
export SNCLIRC="${HOME}/.config/sncli/snclirc"
export TERMINAL='alacritty'
export VISUAL='nvim'
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CURRENT_DESKTOP="Qtile"
export XDG_DATA_DIRS="${XDG_DATA_DIRS}:/var/lib/flatpak/exports/share:/home/coma/.local/share/flatpak/exports/share"
export XDG_DATA_HOME="${HOME}/.local/share"
export _JAVA_AWT_WM_NONREPARENTING=1
export MAIL='thunderbird'
export MANPAGER='nvim +Man!'

source "${HOME}/.cargo/env"

# Start xorg
[[ ! "${DISPLAY}" ]] && startx
