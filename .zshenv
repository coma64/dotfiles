ZDOTDIR="$HOME/.config/zsh"
[[ -f $ZDOTDIR/.zshenv ]] && . $ZDOTDIR/.zshenv

typeset -A ZINIT=(
    HOME_DIR        $HOME/.local/share/zinit
    COMPINIT_OPTS   -C
)
