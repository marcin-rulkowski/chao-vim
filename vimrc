set nocompatible               " be iMproved
filetype off                   " required!

set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" Bundles of choice **********************************************************
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'

Bundle 'msanders/snipmate.vim'

Bundle 'ervandew/supertab'

Bundle 'sukima/xmledit'
Bundle 'vim-ruby/vim-ruby'

Bundle 'L9' 
Bundle 'FuzzyFinder'
" Color schemes
Bundle 'wgibbs/vim-irblack'

filetype plugin indent on     " required! 
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
"

:silent! source ~/.vim/personalrc

