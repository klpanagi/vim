#!/usr/bin/env sh

ln -s $(pwd) ~/.vim
ln -s $(pwd)/init.vim ~/.vimrc

# NeoVIM

mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
ln -s ~/.vim $XDG_CONFIG_HOME/nvim

echo "RUN: vim +PlugInstall"
