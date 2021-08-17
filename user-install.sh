#!/usr/bin/bash


CHECKLIST_FOLDER="$(dirname $0)"
SCRIPTS_FOLDER="$CHECKLIST_FOLDER/scripts"


source "$SCRIPTS_FOLDER/utils.sh"


vinstall_package -c "pyenv" -a "pyenv" -f "$SCRIPTS_FOLDER/pyenv-install.sh"

bash "$SCRIPTS_FOLDER/gnome-desktop-setup.sh"
