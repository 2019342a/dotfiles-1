dotfiles
========

## Installation ##

Clone the repo:

    git clone ssh://git@github.com/niklasae/dotfiles.git ~/dotfiles

Check out git submodules:

    cd dotfiles
    git submodule init
    git submodule update

Create symlinks:

    ln -s ~/dotfiles/vimrc ~/.vimrc
    ln -s ~/dotfiles/vim ~/.vim
    ln -s ~/dotfiles/gitconfig ~/.gitconfig

Vim's backup and swap files goes into '~/tmp', so that has to exist...

    mkdir ~/tmp

## Inspired by... ##

nelstrom/dotfiles

