#!/bin/bash

currentDir=$(pwd)

VundleGit="git@github.com:VundleVim/Vundle.vim.git"

sudo apt-get install vim

mkdir -p "${currentDir}/vim"

# Clone Vundle plugin
git clone ${VundleGit} vim/bundle/Vundle.vim || \
  {
    echo -e "[Error]: Failed on cloning Vundle repo";
    exit 1;
  }

# Symlinks
ln -s "${currentDir}/vim" ~/.vim  # Vim directory
ln -s "${currentDir}/vimrc" ~/.vimrc  # Vim RC file

vim +PluginInstall +qall

# Compiling YCM with semantic support for C-family languages
cd "${currentDir}/vim/bundle/YouCompleteMe" && ./install.py --clang-completer

