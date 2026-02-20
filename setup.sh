#!/bin/bash

set -eu

systemd_unit_dir=$(pkgconf systemd --variable=systemdsystemunitdir)

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
        sudo install -Ddpm $mode $source $dest
        cp -r $source/* $dest/
    else
        # source is a file
        sudo install -Dpm $mode $source $dest
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


# Assume using fedora
sudo dnf install -y tmux vim-default-editor --allowerasing

# OBS Studio install
sudo flatpak install flathub com.obsproject.Studio
flatpak install flathub com.obsproject.Studio.Plugin.SourceRecord
flatpak override --user --filesystem=/tmp/obs_junk com.obsproject.Studio # Allow OBS Studio to access /tmp/obs_junk
install_safe 0644 obs/nuke-obs-junk.path $systemd_unit_dir/nuke-obs-junk.path
install_safe 0644 obs/nuke-obs-junk.service $systemd_unit_dir/nuke-obs-junk.service
sudo systemctl daemon-reload
sudo systemctl enable --now nuke-obs-junk.path # Enable and start monitoring for OBS junk

# glow is a markdown renderer
echo '[charm]
name=Charm
baseurl=https://repo.charm.sh/yum/
enabled=1
gpgcheck=1
gpgkey=https://repo.charm.sh/yum/gpg.key' | sudo tee /etc/yum.repos.d/charm.repo
sudo dnf install -y glow

if [[ ! -e $HOME/.vim/autoload ]]; then
    printf "Installing vim-plug\n\t"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    printf "\033[33mBe sure to run :PlugInstall in vim to install the vim plugins.\033[0m\n"
fi
printf "\033[33mBe sure to set a global git config in $HOME/.gitconfig - https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup\033[0m\n"
printf "\033[33mBe sure to send OBS recordings to /tmp/obs_junk in OBS Studio Settings -> Output -> Recording\033[0m\n"
