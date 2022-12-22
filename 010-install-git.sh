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
echo "###              Configuring git                            ####"
echo ""
# change into your name and email.
git init
git config --global user.name "Tahooft"
git config --global user.email "tahooft@gmail.com"
sudo git config --system core.editor vim
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=18000'
git config --global push.default simple

echo ""
echo "####            GIT configured                                ###"
echo ""