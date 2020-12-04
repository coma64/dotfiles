alias n="fasd -f -e nvim"
alias s="fasd -f -e sudoedit"
alias o="fasd -a -e xdg-open"
alias af="alias-finder -l"

function so() {
    source `fasd -f $1`
}

