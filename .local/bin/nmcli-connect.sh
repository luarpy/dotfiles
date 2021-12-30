#!/usr/bin/env sh

######################################################################
# @author      : mitzasi (mitzasi@plumberry)
# @file        : nmcli-connect
# @created     : miércoles abr 07, 2021 13:05:17 CEST
#
# @description : 
######################################################################

bssid="$(nmcli device wifi list | sed -n '1!p' | cut -b 9- | rofi -dmenu -l 7 -p "Aukeratu" | cut -d ' ' -f1)"
if [ -n "$bssid" ]; then
    passwd="$(echo "" | rofi -dmenu -p "Sartu pasahitza")"
    nmcli device wifi connect "$bssid" password "$passwd"
fi

