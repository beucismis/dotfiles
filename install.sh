#!/bin/bash

echo "Updating package list..."
sudo pacman -Syu --noconfirm

if ! [ -x "$(command -v git)" ]; then
    echo "Installing git package..."
    sudo pacman -S git --noconfirm
fi

echo "Cloning dotfiles repository from GitHub..."
git clone https://github.com/beucismis/dotfiles $HOME/.dotfiles

echo "Installing base-devel packages..."
sudo pacman -S --needed base-devel

echo "Installing paru..."
git clone https://aur.archlinux.org/paru.git ~/.paru
cd ~/.paru
makepkg -si

if ! [ -x "$(command -v stow)" ]; then
    echo "Installing stow package..."
    sudo pacman -S stow --noconfirm
fi

echo "Symlinking configuration files with stow..."
cd $HOME/.dotfiles
sudo stow --adopt etc -t /etc/
stow --adopt bash fastfetch foot git mako mangohud pip qt5ct qt6ct sway waybar wob

echo "Setting up Git completion and prompt..."
cd $HOME/.local/bin
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
chmod +rx $HOME/.local/bin/git-completion.bash $HOME/.local/bin/git-prompt.sh

echo "Creating directories..."
mkdir $HOME/screenshots $HOME/games $HOME/projects $HOME/clones

echo "Updating xdg user directory settings..."
xdg-user-dirs-update

echo "Done!"
