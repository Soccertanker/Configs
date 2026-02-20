#!/bin/bash

set -eu

function install_safe {
    mode="$1"
    source="$2"
    dest="$3"

    printf "Installing $source to ${dest}\n\t"

    if [[ -e $dest ]]; then
        printf "$dest exists\n\t"

        if diff -r $source $dest > /dev/null; then
            printf "\033[32m${source} and ${dest} are already the same\033[0m\n\n"
            return 0
        fi

        printf "\n\033[31m${source} differs from ${dest}. Overwrite ${dest}? [y/n]\033[0m\n\t"
        read input
        if [[ $input != "y" ]]; then
            printf "Skipping ${source}\n\n"
            return 0
        fi
    fi

    printf "\033[32mInstalling ${source}\033[0m\n\n"
    if [[ -d $source ]]; then
        # source is a directory
        install -Ddpm $mode $source $dest
        cp -r $source/* $dest/
    else
        # source is a file
        install -Dpm $mode $source $dest
    fi
    return 0
}

install_safe 755 vimrc $HOME/.vim/vimrc
install_safe 755 colors $HOME/.vim/colors
printf "source $HOME/.vim/vimrc" > $HOME/.vimrc

install_safe 644 bash-prompt.rc $HOME/.bashrc.d/bash-prompt.rc
install_safe 644 convenience-scripts.rc $HOME/.bashrc.d/convenience-scripts.rc

install_safe 644 tmux.conf $HOME/.tmux.conf

install_safe 644 inputrc $HOME/.inputrc

printf "\033[33mBe sure to set a global git config in $HOME/.gitconfig - https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup\033[0m\n"

# Assume using fedora
sudo dnf install -y tmux vim-default-editor --allowerasing

if [[ ! -e $HOME/.vim/autoload ]]; then
    printf "Installing vim-plug\n\t"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    printf "\033[33mBe sure to run :PlugInstall in vim to install the vim plugins.\033[0m\n"
fi
