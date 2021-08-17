#!/usr/bin/bash


function set_key {
    local schema=""
    local key=""
    local value=""

    while [ "$#" -gt 0 ]; do
        case "$1" in
            -s | --schema)
                shift
                if [ "$schema" == "" ]; then
                    schema="$1"
                else
                    echo "Cannot edit more than one schema at a time"
                    return 1;
                fi
                shift
                ;;
            -k | --key)
                shift
                if [ "$key" == "" ]; then
                    key="$1"
                else
                    echo "Cannot edit more than one key at a time"
                    return 1;
                fi
                shift
                ;;
            -v | --value)
                shift
                if [ "$value" == "" ]; then
                    value="$1"
                else
                    echo "A key cannot hold two or more values"
                    return 1;
                fi
                shift
                ;;
            *)
                echo "Unknown flag: $1"
                return 1;
                ;;
        esac
    done

    if [ "$schema" == "" ]; then
        echo "No schema provided"
        return 1
    fi
    if [ "$key" == "" ]; then
        echo "No key provided"
        return 1
    fi

    echo "Updating $schema->$key to $value"

    if [ "$value" == "" ]; then
        gsettings reset "$schema" "$key"
    else
        gsettings set "$schema" "$key" "$value"
    fi
}

# All of my settings

set_key -s "org.gnome.gedit.preferences.ui" -k "statusbar-visible" -v "true"
set_key -s "org.gnome.gedit.preferences.ui" -k "bottom-panel-visible" -v "false"
set_key -s "org.gnome.gedit.preferences.ui" -k "side-panel-visible" -v "false"

set_key -s "org.gnome.gedit.plugins.filebrowser.nautilus" -k "click-policy" -v "double"
set_key -s "org.gnome.gedit.plugins.filebrowser.nautilus" -k "confirm-trash" -v "true"

set_key -s "org.gnome.shell" -k "disable-user-extensions" -v "false"
set_key -s "org.gnome.shell" -k "always-show-log-out" -v "true"
set_key -s "org.gnome.shell" -k "favorite-apps" -v "['xscreensaver-properties.desktop', 'org.gnome.Screenshot.desktop', 'org.gnome.Nautilus.desktop', 'gnome-system-monitor.desktop', 'org.gnome.Terminal.desktop', 'snap-store_ubuntu-software.desktop', 'gnome-control-center.desktop', 'org.gnome.tweaks.desktop', 'nvidia-settings.desktop', 'org.gnome.Characters.desktop', 'yelp.desktop', 'brave-browser.desktop', 'torbrowser.desktop', 'git-ahead.desktop', 'code.desktop', 'virt-manager.desktop', 'discord.desktop', 'spotify_spotify.desktop']"
set_key -s "org.gnome.shell" -k "enabled-extensions" -v "['desktop-icons@csoriano', 'ubuntu-appindicators@ubuntu.com', 'ubuntu-dock@ubuntu.com', 'user-themes', 'user-theme@gnome-shell-extensions.gcampax.github.com', 'apps-menu@gnome-shell-extensions.gcampax.github.com', 'auto-move-windows@gnome-shell-extensions.gcampax.github.com', 'places-menu@gnome-shell-extensions.gcampax.github.com', 'workspace-indicator@gnome-shell-extensions.gcampax.github.com']"
set_key -s "org.gnome.shell" -k "development-tools" -v "true"

set_key -s "org.gnome.mousetweaks" -k "click-type-window-orientation" -v "vertical"
set_key -s "org.gnome.mousetweaks" -k "click-type-window-style" -v "both"

set_key -s "org.gnome.desktop.interface" -k "gtk-color-palette" -v "black:white:gray50:red:purple:blue:light blue:green:yellow:orange:lavender:brown:goldenrod4:dodger blue:pink:light green:gray10:gray30:gray75:gray90"
set_key -s "org.gnome.desktop.interface" -k "toolkit-accessibility" -v "false"
set_key -s "org.gnome.desktop.interface" -k "can-change-accels" -v "false"
set_key -s "org.gnome.desktop.interface" -k "text-scaling-factor" -v "1.0"
set_key -s "org.gnome.desktop.interface" -k "cursor-blink" -v "true"
set_key -s "org.gnome.desktop.interface" -k "menus-have-icons" -v "false"
set_key -s "org.gnome.desktop.interface" -k "icon-theme" -v "WhiteSur-red"
set_key -s "org.gnome.desktop.interface" -k "gtk-im-preedit-style" -v "callback"
set_key -s "org.gnome.desktop.interface" -k "gtk-im-status-style" -v "callback"
set_key -s "org.gnome.desktop.interface" -k "automatic-mnemonics" -v "true"
set_key -s "org.gnome.desktop.interface" -k "menus-have-tearoff" -v "false"
set_key -s "org.gnome.desktop.interface" -k "cursor-size" -v "24"
set_key -s "org.gnome.desktop.interface" -k "buttons-have-icons" -v "false"
set_key -s "org.gnome.desktop.interface" -k "gtk-im-module" -v "ibus"
set_key -s "org.gnome.desktop.interface" -k "gtk-theme" -v "WhiteSur-dark-red"
set_key -s "org.gnome.desktop.interface" -k "clock-show-seconds" -v "true"
set_key -s "org.gnome.desktop.interface" -k "clock-show-date" -v "true"
set_key -s "org.gnome.desktop.interface" -k "clock-show-weekday" -v "true"
set_key -s "org.gnome.desktop.interface" -k "clock-format" -v "24h"
set_key -s "org.gnome.desktop.interface" -k "cursor-blink-time" -v "1200"
set_key -s "org.gnome.desktop.interface" -k "cursor-blink-timeout" -v "10"
set_key -s "org.gnome.desktop.interface" -k "gtk-timeout-repeat" -v "20"
set_key -s "org.gnome.desktop.interface" -k "toolbar-icons-size" -v "large"
set_key -s "org.gnome.desktop.interface" -k "enable-hot-corners" -v "true"
set_key -s "org.gnome.desktop.interface" -k "monospace-font-name" -v "JetBrains Mono 16"
set_key -s "org.gnome.desktop.interface" -k "document-font-name" -v "Sans 14"
set_key -s "org.gnome.desktop.interface" -k "font-name" -v "Ubuntu 14"
set_key -s "org.gnome.desktop.interface" -k "toolbar-style" -v "both-horiz"
set_key -s "org.gnome.desktop.interface" -k "overlay-scrolling" -v "true"
set_key -s "org.gnome.desktop.interface" -k "gtk-key-theme" -v "Default"
set_key -s "org.gnome.desktop.interface" -k "show-unicode-menu" -v "true"
set_key -s "org.gnome.desktop.interface" -k "toolbar-detachable" -v "false"
set_key -s "org.gnome.desktop.interface" -k "cursor-theme" -v "Yaru"
set_key -s "org.gnome.desktop.interface" -k "show-input-method-menu" -v "true"
set_key -s "org.gnome.desktop.interface" -k "menubar-detachable" -v "false"
set_key -s "org.gnome.desktop.interface" -k "enable-animations" -v "true"
set_key -s "org.gnome.desktop.interface" -k "gtk-enable-primary-paste" -v "true"
set_key -s "org.gnome.desktop.interface" -k "show-battery-percentage" -v "true"

set_key -s "org.gnome.nautilus.list-view" -k "default-zoom-level" -v "standard"
set_key -s "org.gnome.nautilus.list-view" -k "use-tree-view" -v "false"
set_key -s "org.gnome.nautilus.list-view" -k "default-visible-columns" -v "['name', 'size', 'date_modified_with_time', 'permissions', 'starred']"
set_key -s "org.gnome.nautilus.list-view" -k "default-column-order" -v "['name', 'size', 'date_modified', 'date_modified_with_time', 'permissions', 'starred', 'type', 'owner', 'group', 'where', 'date_accessed', 'recency', 'detailed_type']"

set_key -s "org.gnome.nautilus.window-state" -k "sidebar-width" -v "217"
set_key -s "org.gnome.nautilus.window-state" -k "start-with-location-bar" -v "true"
set_key -s "org.gnome.nautilus.window-state" -k "start-with-sidebar" -v "true"
set_key -s "org.gnome.nautilus.window-state" -k "initial-size" -v "(890, 547)"
set_key -s "org.gnome.nautilus.window-state" -k "maximized" -v "false"

set_key -s "org.gnome.shell.weather" -k "automatic-location" -v "false"

set_key -s "org.gnome.shell.extensions.desktop-icons" -k "show-trash" -v "true"
set_key -s "org.gnome.shell.extensions.desktop-icons" -k "show-home" -v "true"
set_key -s "org.gnome.shell.extensions.desktop-icons" -k "icon-size" -v "small"

set_key -s "gnome.shell.extensions.user-theme" -k "name" -v "WhiteSur-dark-red"
