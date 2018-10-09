#!/bin/bash

#####################################################################
# This script symlinks dotfiles from in $HOME/dotfiles_asml to $HOME.
#####################################################################

# dotfiles directory
dir=$HOME/dotfiles_asml

# old dotfiles backup directory
olddir=$HOME/dotfiles_old

# list of dot files/folders to symlink
# NOTE: Dots are *suppressed* and are manually prepended
# in the linking commands below. This allows us to easily
# list contents of dotfiles w/o needing to use -a flag.
files="bashrc vimrc"

echo "Creating $olddir for backup of any existing dotfiles in \$HOME"
mkdir -p $olddir

for file in $files; do
    # Move existing dotfile to $olddir
    if [ -e ~/.$file ]; then
        echo "Moving .$file from \$HOME to $olddir"
        mv ~/.$file $olddir/.
    fi

    # Create symlink to new dotfile
    echo "Creating a symlink to $file in \$HOME"
    ln -s $dir/$file ~/.$file
done
