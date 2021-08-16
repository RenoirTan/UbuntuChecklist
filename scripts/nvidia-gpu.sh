#!/usr/bin/bash

sudo cp "$(dirname $0)/../config/etc/default/grub" /etc/default/grub

sudo update-grub
