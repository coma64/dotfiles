# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk
### End of Zinit's installer chunk
### End of Zinit's installer chunk

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# nistory
# Append rather then overwrite
setopt append_history 
# Add history immediately after typing a command
setopt inc_append_history 
# Add timestemp to each entry
setopt extended_history
# History length and file
SAVEHIST=10000
HISTSIZE=$SAVEHIST
HISTFILE=~/.zsh_history

# Ignore these chars on ctrl-w
export WORDCHARS=''    

# Completion
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Plugins
zinit ice depth=1
zinit light romkatv/powerlevel10k

zinit ice as"completion" wait lucid blockf
zinit snippet OMZ::plugins/rust/_rust
zinit ice as"completion" wait lucid blockf
zinit snippet OMZ::plugins/rustup/_rustup
zinit ice as"completion" wait lucid blockf
zinit snippet OMZ::plugins/fd/_fd
zinit ice as"completion" wait lucid blockf
zinit snippet OMZ::plugins/tmuxinator/_tmuxinator

zinit ice wait lucid
zinit snippet OMZ::plugins/systemd/systemd.plugin.zsh
zinit ice wait lucid
zinit snippet OMZ::plugins/tmuxinator/tmuxinator.plugin.zsh
zinit ice wait lucid blockf
zinit light zsh-users/zsh-completions
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_MANUAL_REBIND=true
zinit ice wait lucid atload'_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions
zinit ice lucid wait
zinit snippet OMZ::plugins/zsh_reload/zsh_reload.plugin.zsh
zinit ice lucid wait
zinit snippet OMZ::plugins/vscode/vscode.plugin.zsh
zinit ice lucid wait
zinit snippet OMZ::plugins/rsync/rsync.plugin.zsh
zinit ice lucid wait
zinit snippet OMZ::plugins/git-extras/git-extras.plugin.zsh
zinit ice lucid wait
zinit snippet OMZ::plugins/cp/cp.plugin.zsh
zinit ice lucid wait
zinit snippet OMZ::plugins/command-not-found/command-not-found.plugin.zsh
zinit ice wait lucid
zinit snippet OMZ::plugins/alias-finder/alias-finder.plugin.zsh
zinit ice wait lucid
zinit snippet OMZ::plugins/npm/npm.plugin.zsh
zinit ice wait lucid
zinit snippet OMZ::plugins/node/node.plugin.zsh
zinit ice wait lucid
zinit snippet OMZ::plugins/pip/pip.plugin.zsh
zinit ice wait lucid
zinit snippet OMZ::plugins/archlinux/archlinux.plugin.zsh
zinit ice wait lucid
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit ice wait lucid
zinit snippet OMZ::plugins/extract/extract.plugin.zsh
zinit ice wait lucid
zinit snippet OMZ::plugins/tmux/tmux.plugin.zsh

# Binds
# TODO: shit doesn't work
KEYTIMEOUT=1
zinit ice lucid wait 
zinit light softmoth/zsh-vim-mode

# Set fzf installation directory path
export FZF_BASE=`which fzf`
zinit ice wait lucid
zinit snippet OMZ::plugins/fzf/fzf.plugin.zsh

bindkey '^[ ' autosuggest-accept

# broot
source /home/coma/.config/broot/launcher/bash/br
# thefuck (default alias: fuck)
eval $(thefuck --alias)
# fasd
eval "$(fasd --init auto)"

# Load aliases
if [ -f $HOME/.config/aliases.sh ]; then
    . $HOME/.config/aliases.sh
fi
# Load zsh specific aliases
if [ -f $HOME/.config/zsh/zsh-aliases.zsh ]; then
    . $HOME/.config/zsh/zsh-aliases.zsh 
fi
