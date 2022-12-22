#!/bin/bash
set -e

echo ""
echo "##############    Installing userdirs          #################"
echo ""

sudo pacman -S xdg-user-dirs --noconfirm --needed
cd /home/th/
xdg-user-dirs-update

echo ""
echo "##############    Userdirs installed           #################"
echo ""

echo ""
echo "###############    Set hostname & hosts       ##################"
echo ""

echo pc > /etc/hostname

echo 127.0.0.1  localhost pc > /etc/hosts
echo 255.255.255.255 broadcasthost >> /etc/hosts
echo ::1             localhost pc  >> /etc/hosts
echo ::1             ip6-localhost ip6-loopback  >> /etc/hosts
echo fe00::0         ip6-localnet >> /etc/hosts
echo ff00::0         ip6-mcastprefix >> /etc/hosts
echo ff02::1         ip6-allnodes >> /etc/hosts
echo ff02::2         ip6-allrouters >> /etc/hosts
echo ff02::3         ip6-allhosts >> /etc/hosts

echo ""
echo "###############  Create  Sudo user th         ##################"
echo ""

sudo useradd -m -g users -G wheel -s /bin/bash th
sudo cp /root/0* /home/th/

# ERROR - testen hoe de haakjes te echoe-en
#echo %sudo ALL=(ALL) ALL >> /etc/sudoers
#echo %wheel ALL=(ALL) ALL >> /etc/sudoers
sudo vim /etc/sudoers


echo ""
echo "##############     All done                    #################"
echo ""
echo "Now you can safely exit and reboot."
echo "Remember: NetworkManager is not yet enabled!"
echo ""
exit 0
