#!/bin/bash
set -e

echo "################################################################"
echo "###################   Mounting db1 (Hitachi) ###################"
echo "################################################################"
echo ""
sudo pacman -S exfat-utils --noconfirm --needed

DRIVE=~/Hitachi
# Test of ~/.Hitachi exists
if [ ! -d $DRIVE ]; then
  mkdir $DRIVE
fi

sudo mount /dev/sdb1 ~/Hitachi

cp ~/Hitachi/debin/.Xresources /home/th/.Xresources
cp ~/Hitachi/debin/.vimrc /home/th/.vimrc

echo ""
echo "###################    Done               ######################"
echo ""
