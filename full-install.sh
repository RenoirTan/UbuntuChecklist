#!/usr/bin/bash


CHECKLIST_FOLDER="$(dirname $0)"
SCRIPTS_FOLDER="$CHECKLIST_FOLDER/scripts"


source "$SCRIPTS_FOLDER/utils.sh"


vinstall_package -c "brave-browser-stable" -a "brave browser" -f "$SCRIPTS_FOLDER/brave-install.sh"

vinstall_package -c "git" -a "git" -f "$SCRIPTS_FOLDER/git-install.sh"

vinstall_package -c "gsettings" -c "gnome-extensions" -c "gnome-tweaks" -a "gnome tweaks" -f "$SCRIPTS_FOLDER/gnome-tweaks-install.sh"
bash "$SCRIPTS_FOLDER/gnome-tweaks-setup.sh"

vinstall_package -c "node" -a "node.js" -f "$SCRIPTS_FOLDER/node-install.sh"

bash "$SCRIPTS_FOLDER/grub-setup.sh"
