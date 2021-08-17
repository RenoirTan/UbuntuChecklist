# UbuntuChecklist

This repository was created so I don't get another black screen when my system
tries to boot up Ubuntu. Also, there are some scripts provided in the
`./scripts` folder that I can run to get my favourite apps installed with one
simple command.

# Abbreviations

To reduce the strain on my fingers and wrists, I may use abbreviations to
decrease the number of keypresses I have to make. Below are some of the
short forms you may see in this repository.

# Tasks

Tasks that I must run are listed in order of importance, with the most
essential tasks being placed at the top.

- Installing environment as an admin
  - run `bash full-install.sh`
- Setup environment as standard user
  - run `bash user-install.sh`
- If using a dedicated Nvidia GPU,
  - run `sudo bash ./scripts/nvidia-gpu.sh` to fix the issue where the screen
    goes black (you may see a cursor on the top left) and becomes unresponsive.
    When a `nano` editor opens up in the terminal, add the following command
    options to
    - `GRUB_CMDLINE_LINUX`
      - nouveau.modeset=0
- Installing Apps
  - Brave Browser
    - run `sudo bash ./scripts/brave-install.sh`
  - Git
    - run `sudo bash ./scripts/git-install.sh`
  - Pyenv
    - run `bash ./scripts/pyenv-install.sh`
  - Python
    - run `sudo bash ./scripts/python-repo.sh`
    - run `sudo apt install python<version>` where \<version\> is the version
      of python to install. As of writing the latest version of python is
      *python3.9*
    - run `sudo apt install python3-pip` to install pip
  - Node.js
    - run `sudo bash ./scripts/nodesource_setup.sh`
    - run `sudo apt install nodejs`
- Gnome Tweaks
  - Turning on user themes
    - run `sudo bash ./gnome-tweaks.sh`
    - open the GNOME *Tweaks* app
    - go to the *Extensions* section
    - enable the "User Themes" option
  - List of themes
    - [WhiteSur](https://www.pling.com/p/1403328/)
    - [Avidity](https://www.gnome-look.org/p/1316433/)
  - List of icon themes
    - [WhiteSur](https://github.com/vinceliuice/WhiteSur-icon-theme)
    - [Avidity](https://www.gnome-look.org/p/1316434/)
