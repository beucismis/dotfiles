#!/bin/bash

if [[ "$(id -u)" != 0 ]]; then
  echo -e "Requires root permissions!" > /dev/stderr
  exit 1
fi

apt update && apt upgrade

# Window Manager
apt install -qq openbox -y
apt install -qq openbox-menu dmenu -y # Menu
apt install -qq

# Panel
apt install -qq tint2 -y
apt install -qq blueman -y # Bluetooth applet
apt install -qq volumeicon-alsa -y # Volume control applet
apt install -qq network-manager-gnome -y # Network control applet

# Deamons
apt install -qq dunst # Notification

# Theme
apt install -qq adwaita-icon-theme-full -y # GTK theme
apt install -qq papirus-icon-theme -y # Icon theme
apt install -qq comixcursors-righthanded -y # Cursor theme

## General Tools
apt install -qq terminator -y # Terminal emulator
apt install -qq thunar -y # File manager
apt install -qq mousepad -y # Text editor
apt install -qq atril -y # Document viewer
apt install -qq ristretto -y # Image viewer
apt install -qq vlc -y # Media player
apt install -qq quodlibet -y # Music player
apt install -qq gimp inkscape -y # Image editor
apt install -qq xarchiver -y # Archive manager
apt install -qq gparted bleachbit -y # Disk manager
apt install -qq keepassxc -y # Password manager
apt install -qq qbittorrent -y # Torrent client

# Internet Browser
cd /opt
wget https://ftp.mozilla.org/pub/firefox/releases/95.0/linux-x86_64/tr/firefox-95.0.tar.bz2
tar xjf firefox-*.tar.bz2
rm firefox-*.tar.bz2

# Game Library
dpkg --add-architecture i386
apt update
apt install -qq steam -y

# Drivers
apt install -qq mesa-vulkan-drivers libglx-mesa0:i386 mesa-vulkan-drivers:i386 libgl1-mesa-dri:i386 -y

## Config Tools
apt install -qq lxappearance qt5ct -y # Theme config
apt install -qq grub-customizer -y # Custom GRUB
apt install -qq pavucontrol -y # Sound control

## CLI Tools
apt install -qq htop -y # System monitor
apt install -qq neofect -y # System fetcher