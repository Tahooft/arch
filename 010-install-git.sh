#!/bin/bash
# https://github.com/erikdubois/arcolinux-nemesis
##################################################################################################################
# Author 	: 	Erik Dubois
# Website 	: 	https://www.erikdubois.be
# Website	:	https://www.arcolinux.info
# Website	:	https://www.arcolinux.com
# Website	:	https://www.arcolinuxd.com
# Website	:	https://www.arcolinuxforum.com
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################
# change into your name and email.
set -e

echo ""
echo "################################################################"
echo "####             Installing GIT                              ###"
echo "################################################################"
echo ""

sudo pacman -S git --noconfirm --needed

echo ""
echo "###              Configuring git                            ####"
echo ""

git init
git config --global user.name "Testing"
git config --global user.email "testing@bouwsite1.ont"
sudo git config --system core.editor nano
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=18000'
git config --global push.default simple

echo ""
echo "####            GIT installed                                ###"
echo ""