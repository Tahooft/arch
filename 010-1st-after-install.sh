#!/bin/bash
# Based on: https://github.com/erikdubois/arcolinux-nemesis
#
# @ToDo
# personal moet gedaan voordat dit script in ~/bin staat, misschien eerst testen of dat gebeurd is?
set -e



echo "################################################################"
echo "####             PERSONAL i3 STUF                            ###"
echo "################################################################"
# rm -R ~/.config/i3//*
# cp -r ~/bin/i3/* ~/.config/i3/
# chmod +x ~/.config/i3/start-conky-i3statusbar.sh
# cp ~/bin/autostart/xfce4-clipman-plugin-autostart.desktop ~/.config/autostart/xfce4-clipman-plugin-autostart.desktop

echo "################################################################"
echo "###################    PERSONAL STUF DONE #####################"
echo "################################################################"


echo "################################################################"
echo "####             Enable THERMALD                             ###"
echo "################################################################"

sudo pacman -S thermald --noconfirm --needed
sudo systemctl enable thermald
sudo systemctl start thermald

echo "################################################################"
echo "###################    THERMALD enabled   ######################"
echo "################################################################"


echo "################################################################"
echo "####             Enable GUFW simple firewall                 ###"
echo "################################################################"

sudo pacman -S ufw gufw ufw-extras --noconfirm --needed
sudo ufw enable
systemctl enable ufw
systemctl start ufw

echo "################################################################"
echo "###################    GUFW enabled       ######################"
echo "################################################################"


echo "################################################################"
echo "####             MKCERT - needed for DDEV                    ###"
echo "################################################################"
# Nodig voor ddev
sudo pacman -S mkcert --noconfirm --needed
mkcert -install

echo "################################################################"
echo "###################    MKCERT -install done ####################"
echo "################################################################"


echo "################################################################"
echo "####             CREATE KEYPAIR                              ###"
echo "################################################################"
# create keypair - ook voor GIT nodig
ssh-keygen

echo "################################################################"
echo "###################    KEYPAIR GENERATED    ####################"
echo "################################################################"


echo "################################################################"
echo "####             SETUP DOCKER                                ###"
echo "################################################################"

sudo pacman -S docker docker-compose --noconfirm --needed

sudo usermod -aG docker $USER
systemctl enable docker
systemctl start docker

echo "################################################################"
echo "###################    DOCKER SETUP DONE    ####################"
echo "################################################################"


echo "################################################################"
echo "####             WHAT TO DO NOW?                             ###"
echo "################################################################"

echo "Arch Linux Tweaktool:"
echo "   - AUDIO -> Alsa & Pipewire - Pulseaudio exit"
echo "   - SAMBA installeren"
echo "Maybe..."
echo "   - opennic-up dns updater/extra nameservers for security (aur)"
echo "   - shortwave"
echo "   - megasync (aur)"
echo "Have a look at..."
echo "   - AppArmor"
echo "################################################################"
