#!/bin/bash

# Backup old vim configuration - so user could revert to old ways.

if [ -d ~/vim-backup ]
then
    rm -rf ~/vim-backup
    mkdir ~/vim-backup
fi

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

# Prepare file structure for new configuration

mkdir -p ~/.vim/backup/swap
mkdir -p ~/.vim/bundle

ConfigPath=$1
VundlePath=$2

if [ ! -d $ConfigPath ]
then
    # Create read only repo with configuration.
    git clone https://github.com/marcin-rulkowski/chao-vim.git $ConfigPath
fi

if [ ! -d $VundlePath ]
then
    git clone https://github.com/gmarik/vundle.git $VundlePath
fi

ln -s $VundlePath ~/.vim/bundle/vundle
ln -s $ConfigPath/vimrc ~/.vimrc
ln -s $ConfigPath/gvimrc ~/.gvimrc

vim +BundleInstall +qall

ln -s $ConfigPath/personalrc ~/.vim/personalrc

    
