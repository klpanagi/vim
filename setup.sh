#!/bin/bash

currentDir=$(dirname ${BASH_SOURCE[0]})

VundleGit="git@github.com:VundleVim/Vundle.vim.git"

sudo apt-get install vim cscope

mkdir -p "${currentDir}/vim"

# Clone Vundle plugin
curl -fLo vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
    || \
  {
    echo -e "[Error]: Failed on cloning Vundle repo";
    exit 1;
  }

# Symlinks
# Vim directory
ln -s "${currentDir}/vim" ~/.vim
# Vim RC file
ln -s "${currentDir}/vimrc" ~/.vimrc

vim +PlugInstall

# Compiling YCM with semantic support for C-family languages
cd "${currentDir}/vim/bundle/YouCompleteMe" && ./install.py --clang-completer

