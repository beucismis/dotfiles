#!/bin/sh

gnome_schema="org.gnome.desktop.interface"

gsettings set "$gnome_schema" font-name "Source Code Pro"
gsettings set "$gnome_schema" gtk-theme "Adwaita-dark"
gsettings set "$gnome_schema" icon-theme "Adwaita"
gsettings set "$gnome_schema" cursor-theme "ComixCursors-Black"
