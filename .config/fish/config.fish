# Prepend home bin dir to PATH
set PATH $HOME/bin $PATH

# Auto install fisher (plugin manager) on new systems
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# Enable VI mode
fish_vi_key_bindings

# VI mode binds
#function fish_user_key_bindings
bind \cp up-or-search
#end

# Plugin configuartions
# pf (Project Jump) configuration
set -gx PROJECT_PATHS ~/dev/*

# Aliases
alias ll='ls -lah'
