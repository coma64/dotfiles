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

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# Plugins
zinit ice depth=1
zinit light romkatv/powerlevel10k

#zinit ice wait lucid
#zinit pack for fzf
zinit ice wait lucid
zinit snippet OMZ::plugins/pj/pj.plugin.zsh
zinit ice wait lucid
zinit snippet OMZ::plugins/debian/debian.plugin.zsh
zinit ice wait lucid
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit ice wait lucid
zinit snippet OMZ::plugins/extract/extract.plugin.zsh

zinit ice wait lucid
zinit snippet OMZ::plugins/pyenv/pyenv.plugin.zsh
zinit ice wait lucid
zinit snippet OMZ::plugins/tmux/tmux.plugin.zsh

zinit ice wait lucid svn
zinit snippet OMZ::plugins/history-substring-search

zinit ice wait lucid
zinit light clvv/fasd
zinit ice wait lucid
zinit light softmoth/zsh-vim-mode

zinit ice wait lucid atload'_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions

zinit ice wait lucid blockf
zinit light zsh-users/zsh-completions

# pj
PROJECT_PATHS=($HOME/dev/*)

# Load aliases
if [ -f $HOME/.config/aliases.sh ]; then
    . $HOME/.config/aliases.sh
fi

export WORDCHARS=''    # ignore these chars on ctrl-w

# Command history
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt append_history # append rather then overwrite
setopt extended_history # save timestamp
setopt inc_append_history # add history immediately after typing a command
