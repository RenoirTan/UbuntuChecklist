#!/usr/bin/bash

__my_grub="$(dirname $0)/../config/etc/default/grub"
__current_grub="/etc/default/grub"

$(diff "$__my_grub" "$__current_grub")

if [ $? -eq 1 ]; then
    echo "Setting up grub..."
    sudo cp "$__my_grub" "$__current_grub"
    sudo update-grub
else
    echo "Grub already setup!"
fi
