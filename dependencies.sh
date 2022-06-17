#!/bin/bash

if [[ "$(id -u)" != 0 ]]; then
  echo -e "Requires root permissions!" >&2
  exit 1
fi

apt update && apt upgrade -y && apt autoremove

# Display Manager
apt install lightdm -y

# Window Manager
apt install openbox -y
apt install openbox-menu dmenu -y # Menu
apt install feh -y # Background image manager

# Panel
apt install tint2 -y
apt install blueman -y # Bluetooth applet
apt install pasystray -y # Volume control applet
apt install network-manager-gnome -y # Network control applet

# Deamons
apt install dunst -y
apt install libnotify-bin -y

# General Tools
apt install tilix -y # Terminal emulator
apt install thunar -y # File manager
apt install firefox # Internet Browser
apt install mousepad -y # Text editor
apt install atril -y # Document viewer
apt install ristretto -y # Image viewer
apt install parole -y # Media player
apt install quodlibet -y # Music player
apt install gimp inkscape -y # Image editor
apt install xarchiver -y # Archive manager
apt install gparted bleachbit -y # Disk manager
apt install keepassxc -y # Password manager
apt install qbittorrent -y # Torrent client
apt install flameshot -y # Screenshot tool
apt install liferea -y # RSS reader tool
apt install rednotebook -y # Journal taking tool

# CLI Tools
apt install htop -y # System monitor
apt install neofetch -y # System fetcher

# Config Tools
apt install lxappearance qt5ct -y # Theme settings
apt install grub-customizer -y # Custom GRUB
apt install pavucontrol -y # Sound control
apt install lightdm-gtk-greeter-settings -y # LightDM settings

# Theme
apt install papirus-icon-theme -y # Icon theme
apt install comixcursors-righthanded -y # Cursor theme

# Others
apt install xcompmgr xdotool wmctrl ssh git stow openvpn -y

echo "Done." >&2