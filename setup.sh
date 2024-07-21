#!/bin/bash

install -Dpbm 640 vimrc ~/.vim/vimrc
install -Dpbm 640 colors ~/.vim/colors

install -Dpbm 640 convenience.sh ~/scripts/convenience.sh
echo "source ~/scripts/convenience.sh" >> ~/.bashrc

install -Dpbm 640 tmux.conf ~/.tmux.conf

sudo update-alternatives --set editor vim
