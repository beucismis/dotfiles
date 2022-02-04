#!/bin/bash

if [[ "$(id -u)" != 0 ]]; then
  echo -e "Requires root permissions!" > /dev/stderr
  exit 1
fi

apt update && apt upgrade -y

# Display Manager
apt install -qq lightdm -y

# Window Manager
apt install -qq openbox -y
apt install -qq openbox-menu dmenu -y # Menu
apt install -qq feh -y # Background image manager

# Panel
apt install -qq tint2 -y
apt install -qq blueman -y # Bluetooth applet
apt install -qq pasystray -y # Volume control applet
apt install -qq network-manager-gnome -y # Network control applet

# Deamons
apt install -qq dunst -y
apt install -qq libnotify-bin -y

# Theme
apt install -qq papirus-icon-theme -y # Icon theme
apt install -qq comixcursors-righthanded -y # Cursor theme

## CLI Tools
apt install -qq htop -y # System monitor
apt install -qq neofect -y # System fetcher

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
apt install -qq flameshot -y # Screenshot tool

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
dpkg --add-architecture i386
apt update
apt install -qq steam -y

# Drivers
apt install -qq mesa-vulkan-drivers libglx-mesa0:i386 mesa-vulkan-drivers:i386 libgl1-mesa-dri:i386 -y

## Config Tools
apt install -qq lxappearance qt5ct -y # Theme settings
apt install -qq grub-customizer -y # Custom GRUB
apt install -qq pavucontrol -y # Sound control
apt install -qq lightdm-gtk-greeter-settings -y # LightDM settings

## Others
apt install -qq ssh -y
apt install -qq git -y
apt install -qq openvpn -y # VPN tool