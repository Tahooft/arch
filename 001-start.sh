#!/bin/bash
set -e

echo "################################################################"
echo "################    Downloading Arch-install  ##################"
echo "################################################################"
echo ""

curl -LJO https://raw.githubusercontent.com/Tahooft/arch/master/002-fase-two.sh
curl -LJO https://raw.githubusercontent.com/Tahooft/arch/master/003-mount-sdb1.sh
curl -LJO https://raw.githubusercontent.com/Tahooft/arch/master/004-install-i3.sh
#curl -LJO https://raw.githubusercontent.com/Tahooft/arch/master/005-install-if-microcode-error.sh
#curl -LJO https://raw.githubusercontent.com/Tahooft/arch/master/006-install-n-cores.sh
#curl -LJO https://raw.githubusercontent.com/Tahooft/arch/master/009-install-mirrors-optimized.sh
#curl -LJO https://raw.githubusercontent.com/Tahooft/arch/master/010-install-git.sh
#curl -LJO https://raw.githubusercontent.com/Tahooft/arch/master/060-install-plasma-desktop.sh
#curl -LJO https://raw.githubusercontent.com/Tahooft/arch/master/061-install-display-manager.sh

chmod +x 0*

echo ""
echo "#############      Ready to go                 #################"
echo ""

timedatectl set-ntp true

echo ""
echo "##############     Partition the disk          #################"
echo ""
echo "Do It Yourself"
echo "Set up /dev/sda1 bootable -- root partition >=20G"
echo "Set up /dev/sda2 swap -- swap partition"
echo "Set up /dev/sda3 -- home partitition"
echo ""

cfdisk /dev/sda

echo ""
echo "##############     Formating file systems      #################"
echo ""

mkfs.ext4 /dev/sda1
mkfs.ext4 /dev/sda3
mkswap /dev/sda2
swapon /dev/sda2

echo ""
echo "##############     Mounting the file systems   #################"
echo ""

mount /dev/sda1 /mnt
mkdir /mnt/home
mount /dev/sda3 /mnt/home

echo ""
echo "##############     Pacstrap                     #################"
echo ""

pacstrap /mnt base base-devel

echo ""
echo "##############     Fstab                         #################"
echo ""

genfstab -U /mnt >> /mnt/etc/fstab

echo ""
echo "##############     Copy 0*  to /mnt/root         #################"
echo ""

cp 0* /mnt/root/

echo ""
echo "################################################################"
echo "##############     All done                    #################"
echo "################################################################"
echo ""
echo "You can start ./002-fase-two.sh"
echo ""
echo ""

echo ""
echo "##############     arch-chroot /mnt              #################"
echo ""

arch-chroot /mnt
cd /root
