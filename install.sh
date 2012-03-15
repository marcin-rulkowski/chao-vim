#!/usr/bin/env bash

# Backup old vim configuration - so user could revert to old ways.
if [ -d ~/vim-backup ]
then
    rm -rf ~/vim-backup
fi

mkdir ~/vim-backup

if [ -d ~/.vim ]
then
    mv ~/.vim ~/vim-backup/vim
fi

if [ -f ~/.vimrc ]
then
    mv ~/.vimrc ~/vim-backup/vimrc
fi

if [ -f ~/.gvimrc ]
then
    mv ~/.gvimrc ~/vim-backup/gvimrc
fi

# Installation of vim configuration.
mkdir -p ~/.vim/backup/swap
mkdir -p ~/.vim/bundle

Current=`pwd`

if [ $# -eq 1 ]
then
    Library=$1
    if [ ! -d $Library ]
    then
        #Create new libraryr that would store repositories.
        mkdir $Library
    fi

    #Go to library
    cd $Library

    if [ ! -d ./chao-vim ]
    then
        # Create read only repo with configuration.
        git clone https://github.com/marcin-rulkowski/chao-vim.git
    fi

    if [ ! -d ./vundle ]
    then
        # Create read only repo witb package manager
        git clone https://github.com/gmarik/vundle.git
    fi

    ln -s `pwd`/vundle ~/.vim/bundle/vundle
    ln -s `pwd`/chao-vim/vimrc ~/.vimrc
    ln -s `pwd`/chao-vim/gvimrc ~/.gvimrc

    vim +BundleInstall +qall

    ln -s `pwd`/chao-vim/personalrc ~/.vim/personalrc

    #Return where you where before.
    cd $Current
fi
