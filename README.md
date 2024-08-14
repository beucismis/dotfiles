# dotfiles

This repository contains the configuration files and scripts that I use in my [Arch Linux](https://archlinux.org) daily working environment.

<table><tbody>
  <tr>
    <td>Shell</td>
    <td>bash - https://gnu.org/software/bash</td>
  </tr>
  <tr>
    <td>Display Server</td>
    <td>ly - https://wayland.freedesktop.org</td>
  </tr>
  <tr>
  <tr>
    <td>Audio Server</td>
    <td>pipewire - https://pipewire.org</td>
  </tr>
  <tr>
    <td>Window Manager</td>
    <td>wayland - https://swaywm.org</td>
  </tr>
  <tr>
    <td>Display Manager</td>
    <td>ly - https://github.com/fairyglade/ly</td>
  </tr>
  <tr>
    <td>Notification Daemon</td>
    <td>mako - https://github.com/emersion/mako</td>
  </tr>
  <tr>
    <td>Status Bar</td>
    <td>waybar - https://github.com/alexays/waybar</td>
  </tr>
  <tr>
    <td>Terminal</td>
    <td>foot - https://codeberg.org/dnkl/foot</td>
  </tr>
  <tr>
    <td>Dynamic Menu</td>
    <td>wmenu - https://codeberg.org/adnano/wmenu</td>
  </tr>
  <tr>
    <td>Application Launcher</td>
    <td>walker - https://github.com/abenz1267/walker</td>
  </tr>

</tbody></table> 

## Installation

```
git clone https://github.com/beucismis/dotfiles/ ~/.dotfiles
cd dotfiles
pacman -S - -noconfirm < pkglist.txt
bash install.sh 
```
