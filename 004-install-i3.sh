#!/bin/bash
set -e

echo "################################################################"
echo "###################   installing xorg + i3  ####################"
echo "################################################################"
echo ""

echo "Xserver setup"
echo "Using the opensource driver for nvidia/ati"

sudo pacman -S xorg-server xorg-apps xorg-xinit xorg-twm xterm --noconfirm --needed

# Drivers
sudo pacman -S xf86-video-ati xf86-video-fbdev xf86-video-vesa --noconfirm --needed

# i3
sudo pacman -S i3-gaps i3status i3blocks dmenu perl-anyevent-i3 perl-json-xs --noconfirm --needed

echo ""
echo "###################    Done               ######################"
echo ""
