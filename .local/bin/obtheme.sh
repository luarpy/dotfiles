#!/usr/bin/env sh

######################################################################
# @author      : mitzasi (mitzasi@plumberry)
# @file        : obtheme
# @created     : jueves abr 08, 2021 14:40:39 CEST
#
# @description : 
######################################################################
if [ -z "$1" ];then
    dir="$HOME/.wallpapers"
else
    dir="$1"
fi
wal -i "$dir"  && \
sh "${HOME}/.local/bin/personal/"telegram-palette-gen/telegram-palette-gen --wal & \
feh "$(cat "${HOME}/.cache/wal/wal")" --bg-fill && \
launchlemon 2>/dev/null & 
openbox --reconfigure

