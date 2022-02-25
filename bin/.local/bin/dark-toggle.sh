#!/usr/bin/env bash

######################################################################
# @author      : mitzasi (mitzasi@plumberry)
# @file        : dark-toggle
# @created     : Monday Jul 05, 2021 22:35:53 CEST
#
# @description : 
######################################################################
darktheme='Dracula-slim'
lighttheme='Ant'

get_current_theme () {
    gsettings get org.gnome.desktop.interface gtk-theme | tr --delete \'
}

set_theme () {
    gsettings set org.gnome.desktop.interface gtk-theme "$1"
    # Unfortunately, gsettings always reports exit status 0
}

current_theme="$(get_current_theme)"

if [ -z "$lighttheme" ] && [ -z "$darktheme" ];then

    # Check if the theme name has "dark" or "Dark" at the end of its name,
    # then set new theme accordingly
    case $current_theme in
        *-[dD]ark)
            new_theme="${current_theme%-[Dd]ark}"
            notify_msg="Theme succesfully changed to Light variant."

            ;;
        *)
            # For some reason, Arc uses a capital 'd', but all others use 'd'
            if [ "$current_theme" = "Arc" ]; then
                new_theme="$current_theme"-Dark
            else
                new_theme="$current_theme"-dark
            fi
            notify_msg="Theme succesfully changed to Dark variant."

            ;;
    esac
else
    case $current_theme in
        "$lighttheme")
            new_theme="${darktheme}"
            notify_msg="Theme succesfully changed to Light theme."
            ;;
        "$darktheme")
            new_theme="${lighttheme}"
            notify_msg="Theme succesfully changed to Dark theme."
    esac
fi

echo "$new_theme"
set_theme "$new_theme"
notify-send "$notify_msg"

