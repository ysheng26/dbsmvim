#!/bin/sh

set -ex

ln -fs ~/.vim/vimrc ~/.vimrc

mkdir -p ~/.config/nvim
ln -fs ~/.vim/nvim_init.vim ~/.config/nvim/init.vim
ln -fs ~/.vim/ysheng26-snippets ~/.config/nvim/ysheng26-snippets

mkdir -p ~/.vim/tmp/undo
mkdir -p ~/.vim/tmp/backup

