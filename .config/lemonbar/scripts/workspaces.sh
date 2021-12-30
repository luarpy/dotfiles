#!/usr/bin/env bash

######################################################################
# @author      : mitzasi (mitzasi@plumberry)
# @file        : workspaces
# @created     : sábado dic 11, 2021 13:29:35 CET
#
# @description : 
######################################################################

workspace="$(($(xprop -root _NET_CURRENT_DESKTOP | cut -d ' ' -f3) + 1))"
number_ws="$(xprop -root _NET_NUMBER_OF_DESKTOPS | cut -d ' ' -f3)"
id_="$(xprop -root _NET_ACTIVE_WINDOW | cut -d ' ' -f5)"
window="$( xprop -id "$id_" | grep WM_CLASS | tr -d "\"" | tr -d ',' | cut -d ' ' -f3)"
[ -z "$window" ] && window="$workspace"
aux= 
for current in $(seq "$number_ws"); do
    if [ "$current" == "$workspace" ]; then
        aux="$aux %{R} ${window,,} %{R-} "
    else
        aux="$aux $current"
    fi
done
echo "$aux"
