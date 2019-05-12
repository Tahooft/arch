#!/bin/bash
set -e

echo "###############    Set Where & When           ##################"
echo ""

ln -sf /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime
hwclock --systohc --utc

echo ""
echo "###############    Set locale                 ##################"
echo ""

# echo nano /etc/locale.gen -> uncomment needed locales: en_US.UTF-8 and other
echo en_US.UTF-8 UTF-8 >> /etc/locale.gen
locale-gen

echo ""
echo "###############    Set hostname & hosts       ##################"
echo ""

echo pc > /etc/hostname

echo 127.0.0.1  localhost th >> /etc/hosts
echo ::1        localhost >> /etc/hosts
echo 127.0.1.1  pc.localdomain  pc >> /etc/hosts

echo ""
echo "###############  Create  Sudo user th         ##################"
echo ""

useradd -m -g users -G wheel -s /bin/bash th
cp /root/0* /home/th/

# ERROR - testen hoe de haakjes te echoe-en
#echo %sudo ALL=(ALL) ALL >> /etc/sudoers
#echo %wheel ALL=(ALL) ALL >> /etc/sudoers
vi /etc/sudoers

echo ""
echo "###############  Password root, th            ##################"
echo ""
echo "Passwd for root"
passwd root
echo "Passwd for th"
passwd th

echo ""
echo "###############   Grub en amd-ucode           ##################"
echo ""

pacman -S grub --noconfirm --needed
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

echo ""
echo "##############    Installing Networkmanager   ##################"
echo ""

pacman -S networkmanager --noconfirm --needed

echo ""
echo "##############    Installing sound             #################"
echo ""

sudo pacman -S alsa-utils alsa-plugins alsa-lib pavucontrol --noconfirm --needed

echo ""
echo "##############    Installing fonts             #################"
echo ""

sudo pacman -S ttf-inconsolata ttf-ubuntu-font-family ttf-dejavu ttf-freefont ttf-liberation ttf-droid ttf-inconsolata ttf-roboto terminus-font ttf-font-awesome --noconfirm --needed

echo ""
echo "##############    Installing usefull            #################"
echo ""

sudo pacman -S bash-completion bash-language-server firefox-developer-edition --noconfirm --needed
sudo pacman -S code vlc mplayer vim urxvc urxvc-perls xclip --noconfirm --needed
sudo pacman -S slint vifm mc openra ranger filezilla xdg-user-dirs--noconfirm --needed

echo ""
echo "##############    Installing userdirs           #################"
echo ""

xdg-user-dirs-update

# Optional - eerst nog uitzoeken
#vim vim-jellybeans vim-seti pamac-tray-appindicator 
#sudo pacman -S rofi conky atool highlight browsh elinks mediainfo w3m ffmpegthumbnailer mupdf -noconfirm -needed
#AUR pamac-aur urxvt-resize-font-git i3keys python-pdftotext

echo ""
echo "##############     All done                    #################"
echo ""
echo "Now you can safely exit and reboot."
echo "Remember: NetworkManager is not yet enabled!"
echo ""
exit 0
