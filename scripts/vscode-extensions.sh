#!/usr/bin/bash


SCRIPTS_FOLDER="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

source "$SCRIPTS_FOLDER/utils.sh"


if [ $(command_exists "code"; echo "$?") -eq 0 ]; then
    echo "vscode not installed"
    exit 1
fi


function vinstall_extension {
    while [ "$#" -gt 0 ]; do
        echo "Installing $1"
        code --install-extension "$1" --force
        shift
    done
}

vinstall_extension \
    "donjayamanne.python-extension-pack" \
    "ms-vscode.cpptools" \
    "twxs.cmake" \
    "renoirtan.liver" \
    "mhutchie.git-graph" \
    "eamodio.gitlens" \
    "rust-lang.rust" \
    "matklad.rust-analyzer" \
    "golang.go" \
    "adpyke.codesnap" \
    "helgardrichard.helium-icon-theme" \
    "miguelsolorio.fluent-icons" \
    "aaron-bond.better-comments"
