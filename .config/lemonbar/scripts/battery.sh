#!/usr/bin/env bash

######################################################################
# @author      : mitzasi (mitzasi@plumberry)
# @file        : battery
# @created     : sábado dic 11, 2021 13:34:12 CET
#
# @description : 
######################################################################

battery_format="${HOME}/.cache/battery_format"
BATTACPI="$(acpi --battery | tr -d ',%')"
state="$(echo "$BATTACPI" | cut -d ' ' -f3 )"
fg="#f1f1f1"
remaining="$(echo "$BATTACPI" | cut -d ' ' -f5)"
BATPERC="$(echo "$BATTACPI" | cut -d ' ' -f4)"
if [ "$BATPERC" == 100 ]; then
    out="%{F#B8BB26}\uf00c%{F-} %{F#f1f1f1}$BATPERC%%{F-}"
elif [ "$state" = "Discharging" ]; then
    if [ "$BATPERC" -le 10 ]; then
        icon="%{F#fb4934}\uf244%{F-}"
    elif [ "$BATPERC" -le 25 ]; then
        icon="%{F#fb4934}\uf243%{F-}"
    elif [ "$BATPERC" -le 50 ]; then
        icon="\uf242"
    elif [ "$BATPERC" -le 75 ]; then
        icon="\uf241"
    elif [ "$BATPERC" -le 100 ]; then
        icon="\uf240"
    fi
    out="%{F$fg}$icon%{F-}%{F$fg}$BATPERC%%{F-}"
elif [ "$state" = "Charging" ]; then
    out="%{F#FABD2F}\uf0e7%{F-}%{F$fg}$BATPERC%%{F-}"
elif [ "$state" = "Unknown" ]; then
    out="$BATPERC%"
fi
echo -e "%{A:echo $remaining > $battery_format:}$(cat "$battery_format")%{A}"
