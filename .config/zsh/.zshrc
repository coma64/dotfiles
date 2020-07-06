# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# TODO: Switch to a ZSH plugin manager
# Path to your oh-my-zsh installation.
export ZSH="/home/coma/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Edit command line in NVIM
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^Z" edit-command-line

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(ripgrep pj zsh-syntax-highlighting zsh-completions zsh-autosuggestions debian git extract z history-substring-search zsh-vim-mode pyenv tmux)

. $ZSH/oh-my-zsh.sh

# Reload autocompletion, required by zsh-completions plugin
autoload -U compinit && compinit

# Plugin configuration
# pj (project jump)
PROJECT_PATHS=($HOME/dev/*)

# Load aliases
if [ -f $HOME/.config/aliases.sh ]; then
    . $HOME/.config/aliases.sh
fi
export WORDCHARS=''    # ignore these chars on ctrl-w

# Use "$ showkey -a" to find out keycodes
# Bind command specific history to ctrl + p
bindkey "^P" history-substring-search-up
bindkey "^N" history-substring-search-down
# TODO: Bind auto complete to tab or smth

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || . ~/.p10k.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
