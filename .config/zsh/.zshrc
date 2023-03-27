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
    command git clone "https://github.com/zdharma-continuum/zinit" "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

### End of Zinit's installer chunk

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# Options - stolen from garuda :D
# setopt correct                                                  # Auto correct mistakes
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

# History
setopt append_history 
#setopt inc_append_history 
setopt extended_history
HISTSIZE=100000
SAVEHIST=10000
HISTFILE="${HOME}/.zsh_history"

# Ignore these chars on ctrl-w
WORDCHARS=''    

# Plugins
zinit ice depth=1
zinit light romkatv/powerlevel10k

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
zinit ice wait lucid
zinit snippet OMZ::plugins/alias-finder/alias-finder.plugin.zsh
zinit ice wait lucid
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit ice wait lucid
zinit snippet OMZ::plugins/extract/extract.plugin.zsh
bgnotify_threshold=30
zinit ice wait lucid
zinit snippet OMZ::plugins/bgnotify/bgnotify.plugin.zsh
zinit ice wait lucid
zinit snippet OMZ::plugins/autoenv/autoenv.plugin.zsh
zinit ice lucid
zinit snippet OMZ::plugins/dirhistory/dirhistory.plugin.zsh

zinit ice lucid wait
zinit light willghatch/zsh-saneopt

# Binds
# use emacs bindings
bindkey -e
bindkey '^[ ' autosuggest-accept
zle -N copydir{,}
bindkey '^[s' copydir

autoload edit-command-line
zle -N edit-command-line
bindkey '^[e' edit-command-line

bindkey '^[o' dirhistory_zle_dirhistory_back
bindkey '^[i' dirhistory_zle_dirhistory_future
bindkey '^[u' dirhistory_zle_dirhistory_up

function last_command_tldr() {
    zle up-history
    local last_command=$(echo ${LBUFFER} | cut -f1 -d' ')
    LBUFFER="tldr ${last_command}"
}
zle -N last_command_tldr
bindkey '^[t' last_command_tldr

function last_command_man() {
    zle up-history
    local last_command=$(echo ${LBUFFER} | cut -f1 -d' ')
    LBUFFER="batman ${last_command}"
}
zle -N last_command_man
bindkey '^[m' last_command_man

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

# fzf
FZF_BASE="/usr/share/fzf"
zinit ice wait lucid
zinit snippet OMZ::plugins/fzf/fzf.plugin.zsh

[ -f ${HOME}/.config/broot/launcher/bash/br ] && . ${HOME}/.config/broot/launcher/bash/br
[ -f ${ZDOTDIR}/aliases.zsh ] && . ${ZDOTDIR}/aliases.zsh
[ -f ${ZDOTDIR}/lib.zsh ] && . ${ZDOTDIR}/lib.zsh
[ -f ${ZDOTDIR}/nnn-quitcd.zsh ] && . ${ZDOTDIR}/nnn-quitcd.zsh

bindkey -r 't'
[ -f /usr/share/todoist-cli/todoist_functions_fzf.sh ] && . /usr/share/todoist-cli/todoist_functions_fzf.sh

# nnn
export NNN_BMS='d:~/dev/;D:~/Downloads/;c:~/.config/;b:~/.local/bin;l:~/.local/;s:~/.local/share/;e:/etc/;t:/tmp/;p:~/Pictures;o:~/Documents'
export NNN_FIFO='/tmp/nnn.fifo'
local nnn_tools='y:pycharm;w:webstorm;l:!lazygit*'
local nnn_jump='f:fzcd;o:fzopen;g:gitroot;d:dev-folders-fzf;c:config-fzf'
local nnn_preview='p:preview-tui'
export NNN_PLUG="s:suedit;u:upload;${nnn_tools};${nnn_jump};${nnn_preview}"

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/.config/zsh/.p10k.zsh.
[[ ! -f ~/.dotfiles/.config/zsh/.p10k.zsh ]] || source ~/.dotfiles/.config/zsh/.p10k.zsh
