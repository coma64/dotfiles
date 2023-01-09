# /bin/bash
# credits: https://www.atlassian.com/git/tutorials/dotfiles
# ENABLE / DISABLE AHCI!!!!!!!!!!!

config () {
    git --git-dir=$HOME/.local/share/dotfiles --work-tree=$HOME $@
}

backup_file () {
    mkdir --parents `dirname $HOME/.config-backup/$1`
    mv $1 $HOME/.config-backup/$1
}

git clone --bare git@github.com:coma64/dotfiles.git $HOME/.local/share/dotfiles

config checkout $1

if [ $? != 0 ]; then
    echo "Backing up pre-existing dotfiles to ~/.config-backup";

    mkdir -p $HOME/.config-backup
    export -f backup_file
    config checkout $1 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} bash -c 'backup_file {}'
fi

echo "Checked out config.";

config checkout $1
config config status.showUntrackedFiles no
