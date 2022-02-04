#!/bin/bash

if ! [ -x "$(command -v stow)" ]; then
  echo "Error: stow is not installed." >&2
  exit 1
fi

#cd ~
#git clone https://github.com/beucismis/dotfiles
#mv dotfiles .dotfiles

stow --adopt bash
stow --adopt x11
stow --adopt openbox
stow --adopt tint2
stow --adopt dunst
stow --adopt gtk-3.0
stow --adopt gtk-2.0
stow --adopt qt5ct
stow --adopt git
stow --adopt terminator

stow --adopt bin
stow --adopt images

echo "Done." >&2