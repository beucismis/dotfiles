#!/bin/bash

echo "Updating package list..."
sudo pacman -Syu --noconfirm

if ! [ -x "$(command -v git)" ]; then
    echo "Installing git package..."
    sudo pacman -S git --noconfirm
fi

echo "Cloning dotfiles repository from GitHub..."
git clone https://github.com/beucismis/dotfiles /home/$USER/.dotfiles

echo "Installing base-devel packages..."
sudo pacman -S --needed base-devel

echo "Installing paru..."
git clone https://aur.archlinux.org/paru-git.git /home/$USER/.paru
cd /home/$USER/.paru && makepkg -si

if ! [ -x "$(command -v stow)" ]; then
    echo "Installing stow package..."
    sudo pacman -S stow --noconfirm
fi

echo "Symlinking configuration files with stow..."
cd /home/$USER/.dotfiles
sudo stow --adopt etc -t /etc/
sudo stow --adopt usr -t /usr/
stow --adopt bash fastfetch foot git heroic mako mangohud pip qt5ct qt6ct radiotray-ng sway swaynag user-dirs waybar wob

echo "Updating xdg user directory settings..."
sudo pacman -S xdg-user-dirs --noconfirm
xdg-user-dirs-update

echo "Creating custom directories..."
mkdir /home/$USER/screenshots
mkdir /home/$USER/games
mkdir /home/$USER/projects
mkdir /home/$USER/clones
mkdir /home/$USER/area51
mkdir /home/$USER/.local/bin 

echo "Setting up Git completion and prompt..."
rm -rf /home/$USER/.local/bin/git-completion.bash* /home/$USER/.local/bin/git-prompt.sh*
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -P /home/$USER/.local/bin
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -P /home/$USER/.local/bin
chmod +rx /home/$USER/.local/bin/git-completion.bash /home/$USER/.local/bin/git-prompt.sh

echo "Done!"
