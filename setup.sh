#!/bin/bash

set -eu

function install_safe {
    mode="$1"
    source="$2"
    dest="$3"

    printf "Installing $source to ${dest}\n\t"

    if [[ -e $dest ]]; then
        printf "$dest exists\n\t"

        if diff $source $dest > /dev/null; then
            printf "$\033[32m${source} and ${dest} are already the same\033[0m\n\n"
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
    install -Dpm $mode $source $dest
    return 0
}

install_safe 644 vimrc ~/.vim/vimrc
install_safe 644 colors ~/.vim/colors
printf "source ~/.vim/vimrc" > ~/.vimrc

install_safe 644 bash-prompt.rc ~/.bashrc.d/bash-prompt.rc
install_safe 644 convenience-scripts.rc ~/.bashrc.d/convenience-scripts.rc

install_safe 644 tmux.conf ~/.tmux.conf

install_safe 644 inputrc ~/.inputrc

printf "\033[33mBe sure to set a global git config in ~/.gitconfig - https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup\033[0m\n"
