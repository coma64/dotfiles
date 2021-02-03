typeset -A ZINIT=(
    HOME_DIR        $HOME/.local/share/zinit
    COMPINIT_OPTS   -C
)

[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
