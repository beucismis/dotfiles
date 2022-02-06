#!/bin/bash

if [[ "$(id -u)" != 0 ]]; then
  echo -e "Requires root permissions!" > >&2
  exit 1
fi

dpkg --add-architecture i386
apt update && apt upgrade -y

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

# Theme
apt install papirus-icon-theme -y # Icon theme
apt install comixcursors-righthanded -y # Cursor theme

## CLI Tools
apt install htop -y # System monitor
apt install neofect -y # System fetcher

## General Tools
apt install tilix -y # Terminal emulator
apt install thunar -y # File manager
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

# Online Messaging
cd /opt
wget https://github.com/telegramdesktop/tdesktop/releases/download/v3.5.0/tsetup.3.5.0.tar.xz
tar xjf tsetup.*.tar.xz
rm tsetup.*.tar.xz

# Internet Browser
cd /opt
wget https://ftp.mozilla.org/pub/firefox/releases/95.0/linux-x86_64/tr/firefox-95.0.tar.bz2
tar xjf firefox-*.tar.bz2
rm firefox-*.tar.bz2

cd ~

# Game Library
apt update
apt install steam -y

# Drivers
apt install mesa-vulkan-drivers libglx-mesa0:i386 \
mesa-vulkan-drivers:i386 libgl1-mesa-dri:i386 -y

## Config Tools
apt install lxappearance qt5ct -y # Theme settings
apt install grub-customizer -y # Custom GRUB
apt install pavucontrol -y # Sound control
apt install lightdm-gtk-greeter-settings -y # LightDM settings

## Others
apt install ssh -y
apt install git -y
apt install openvpn -y

echo "Done." >&2