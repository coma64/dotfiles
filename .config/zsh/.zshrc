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

# Options - stolen from garuda :D
setopt correct                                                  # Auto correct mistakes
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt autocd                                                   # if only directory path is entered, cd there.
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

# History
setopt append_history 
#setopt inc_append_history 
setopt extended_history
HISTSIZE=50000
SAVEHIST=10000
HISTFILE="${HOME}/.zsh_history"

# Ignore these chars on ctrl-w
WORDCHARS=''    

# Plugins
zinit ice depth=1
zinit light romkatv/powerlevel10k

zinit ice as"completion" wait lucid blockf
zinit snippet OMZ::plugins/github/_hub
zinit ice as"completion" wait lucid blockf
zinit snippet OMZ::plugins/rust/_rust
zinit ice as"completion" wait lucid blockf
zinit snippet OMZ::plugins/rustup/_rustup
zinit ice as"completion" wait lucid blockf
zinit snippet OMZ::plugins/fd/_fd
zinit ice as"completion" wait lucid blockf
zinit snippet OMZ::plugins/cargo/_cargo
zinit ice as"completion" wait lucid blockf
zinit snippet OMZ::plugins/docker/_docker

zinit ice wait lucid
zinit snippet OMZ::plugins/fancy-ctrl-z/fancy-ctrl-z.plugin.zsh
zinit ice wait lucid
zinit snippet OMZ::plugins/systemd/systemd.plugin.zsh
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
# zinit ice wait lucid
# zinit snippet OMZ::plugins/tmux/tmux.plugin.zsh
bgnotify_threshold=30
zinit ice wait lucid
zinit snippet OMZ::plugins/bgnotify/bgnotify.plugin.zsh
zinit ice wait lucid
zinit snippet OMZ::plugins/copybuffer/copybuffer.plugin.zsh
zinit ice wait lucid
zinit snippet OMZ::plugins/copydir/copydir.plugin.zsh
zinit ice wait lucid
zinit snippet OMZ::plugins/dnf/dnf.plugin.zsh
zinit ice wait lucid
zinit snippet OMZ::plugins/django/django.plugin.zsh
zinit ice wait lucid
zinit snippet OMZ::plugins/debian/debian.plugin.zsh
zinit ice wait lucid
zinit snippet OMZ::plugins/taskwarrior/taskwarrior.plugin.zsh
PROJECT_PATHS=("${HOME}/dev/*")
zinit ice wait lucid
zinit snippet OMZ::plugins/pj/pj.plugin.zsh
zinit ice wait lucid
zinit snippet OMZ::plugins/nmap/nmap.plugin.zsh
zinit ice wait lucid
zinit snippet OMZ::plugins/history/history.plugin.zsh
zinit ice wait lucid
zinit snippet OMZ::plugins/ssh-agent/ssh-agent.plugin.zsh
zinit ice wait lucid
zinit snippet OMZ::plugins/autoenv/autoenv.plugin.zsh

zinit ice lucid wait
zinit light willghatch/zsh-saneopt
KEYTIMEOUT=1
zinit ice lucid wait 
zinit light softmoth/zsh-vim-mode

# Binds
bindkey '^[ ' autosuggest-accept
zle -N copydir{,}
bindkey '^[^O' copydir

# Completion
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' rehash true                              # automatically find new executables in path 
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*:descriptions' format '%U%F{cyan}%d%f%u'

# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zcache

# automatically load bash completion functions
autoload -U +X bashcompinit && bashcompinit

# broot
source "${HOME}/.config/broot/launcher/bash/br"
# thefuck (default alias: fuck)
eval "$(thefuck --alias)"
# fasd
eval "$(fasd --init auto)"
# pyenv
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# fzf
FZF_BASE="${HOME}/.fzf"
zinit ice wait lucid
zinit snippet OMZ::plugins/fzf/fzf.plugin.zsh

if [ -f "${ZDOTDIR}/aliases.zsh" ]; then
    source "${ZDOTDIR}/aliases.zsh" 
fi

if [ -f "${ZDOTDIR}/lib.zsh" ]; then
    source "${ZDOTDIR}/lib.zsh" 
fi

# neofetch

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/.config/zsh/.p10k.zsh.
[[ ! -f ~/.dotfiles/.config/zsh/.p10k.zsh ]] || source ~/.dotfiles/.config/zsh/.p10k.zsh
