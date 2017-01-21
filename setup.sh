#!/usr/bin/env sh

ln -s $(pwd) ~/.vim
ln -s $(pwd)/vimrc ~/.vimrc
vim +PlugInstall

# NeoVIM

mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
ln -s ~/.vim $XDG_CONFIG_HOME/nvim
ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim

