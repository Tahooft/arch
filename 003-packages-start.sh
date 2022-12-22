#!/bin/bash
set -e


# echo ""
# echo "##############    Installing sound             #################"
# echo ""



echo ""
echo "##############    Installing fonts             #################"
echo ""

sudo pacman -S ttf-inconsolata ttf-ubuntu-font-family ttf-dejavu ttf-freefont ttf-liberation ttf-droid ttf-inconsolata ttf-roboto terminus-font ttf-font-awesome --noconfirm --needed

echo ""
echo "##############    Installing usefull            #################"
echo ""

sudo pacman -S bash-completion bash-language-server firefox --noconfirm --needed
sudo pacman -S code vlc vim urxvc-perls xclip --noconfirm --needed
sudo pacman -S ranger filezilla --noconfirm --needed



# Optional - eerst nog uitzoeken
#vim vim-jellybeans vim-seti pamac-tray-appindicator 
#sudo pacman -S rofi conky atool highlight browsh elinks mediainfo w3m ffmpegthumbnailer mupdf -noconfirm -needed
#AUR pamac-aur urxvt-resize-font-git i3keys python-pdftotext