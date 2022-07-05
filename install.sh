#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root!"
  exit 1
fi

echo "Installing dependencies..."

apt update && apt upgrde -y
apt install git stow -y

cd $HOME
git clone https://github.com/beucismis/dotfiles
mv dotfiles .dotfiles

echo "Dotfiles are symlinked..."

stow --adopt bash
stow --adopt foot
stow --adopt git
stow --adopt mako
stow --adopt sway
stow --adopt pip
stow --adopt waybar
stow --adopt wofi
stow --adopt etc -t /etc
stow --adopt usr -t /usr

echo "Done."