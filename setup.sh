#!/usr/bin/env sh

ln -s $(pwd) ~/.vim
ln -s $(pwd)/vimrc ~/.vimrc

# NeoVIM

mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
ln -s ~/.vim $XDG_CONFIG_HOME/nvim

vim +PlugInstall
