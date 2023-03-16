#!/bin/bash

mkdir -p ~/.vim/
cp vimrc ~/.vim/
cp -r colors ~/.vim/

# append ~/.bashrc with bashrc.append
cat bashrc.append >> ~/.bashrc

cp tmux.conf ~/.tmux.conf

sudo update-alternatives --config editor
