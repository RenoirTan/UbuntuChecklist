#!/usr/bin/bash


function command_exists {
    if command -v "$1" &> /dev/null; then
        return 1
    else
        return 0
    fi
}

function vcommand_exists {
    command_exists "$1"
    if [ "$?" -eq "1" ]; then
        echo "$1 found"
    else
        echo "$1 not found"
    fi
}

function vchecked_install_package {
    local command_name="$1"
    local application_name="$2"
    local script_name="$3"

    local found=$(command_exists "$command_name"; echo "$?")
    if [ found -eq "0" ]; then
        echo "Installing $application_name..."
        bash "$script_name"
    else
        echo "$application_name already installed"
    fi
}

function vinstall_package {
    local command_names=""
    local application_name=""
    local script_names=""

    # Using this shitty switch-case statement because getopts doesn't want
    # to cooperate with me for some reason
    while [ "$#" -gt 0 ]; do
        case "$1" in
            -c | --command)
                shift
                command_names="$command_names;$1"
                shift
                ;;
            -a | --application)
                shift
                if [ "$application_name" == "" ]; then
                    application_name="$1"
                else
                    echo "Only one instance of -a | --application [APPLICATION_NAME] can be used!"
                    return 1;
                fi
                shift
                ;;
            -f | -s | --script-filename)
                shift
                script_names="$script_names;$1"
                shift
                ;;
            *)
                echo "Invalid flag: $1"
                return 1;
                ;;
        esac
    done

    # echo "command_names: $command_names"
    # echo "application_names: $application_names"
    # echo "script_names: $script_names"

    IFS=';' read -ra command_array <<< "$command_names"

    local installed=1
    for command_name in "${command_array[@]}"; do
        if [ "$command_name" == "" ]; then
            continue
        else
            local found=$(command_exists "$command_name"; echo "$?")
            if [ "$found" -eq 0 ]; then
                installed=0
            fi
        fi
    done

    if [ "$installed" -eq 0 ]; then
        echo "Installing $application_name..."
        IFS=';' read -ra script_array <<< "$script_names"
        for script_name in "${script_array[@]}"; do
            if [ "$script_name" == "" ]; then
                continue
            fi
            bash "$script_name"
        done
    else
        echo "$application_name installed already"
    fi
}
