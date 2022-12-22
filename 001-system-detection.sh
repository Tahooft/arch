#!/bin/bash
set -e

echo "################################################################"
echo "####             SYSTEM DETECTION                            ###"
echo "################################################################"
set -e

shopt -s nocasematch

case $(systemd-detect-virt) in

  none)
    echo "Physical Hardware"
    ;;

  *)
    echo "Virtual Machine -> installing qemu-guest-agent"
    sudo pacman -S qemu-guest-agent --noconfirm --needed
    echo "Setting video resoltion for this VM"
    xrandr --output Virtual-1 --mode 1920x1080 --auto
    ;;
esac

# Laptop detection
if [ -d "/proc/acpi/button/lid" ]; then
    echo "computer is a laptop -> installing and enabling TLP for battery-savings"
    sudo pacman -S tlp
    sudo systemclt enable tlp.service
    sudo systemctl start tlp.service
fi

echo "################################################################"
echo "###################    SYSTEM DETECTED     #####################"
echo "################################################################"