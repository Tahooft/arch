#!/bin/bash
set -e

echo "################################################################"
echo "####             Installing reflector                        ###"
echo "################################################################"

# installing refector to test wich servers are fastest
sudo pacman -S --noconfirm --needed reflector

echo ""
echo "####   finding fastest servers be patient for the world      ###"
echo ""

# finding the fastest archlinux servers
sudo reflector -l 100 -f 50 --sort rate --threads 5 --verbose --save /tmp/mirrorlist.new && rankmirrors -n 0 /tmp/mirrorlist.new > /tmp/mirrorlist && sudo cp /tmp/mirrorlist /etc/pacman.d

echo ""
echo "####       fastest servers  saved                            ###"
echo ""

echo 'cat /etc/pacman.d/mirrorlist | less'
echo ""
cat /etc/pacman.d/mirrorlist | less

sudo pacman -Syu

echo ""
echo "################################################################"
echo "###############       mirrorlist updated     ###################"
echo "################################################################"
echo ""