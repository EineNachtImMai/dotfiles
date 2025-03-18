#!/usr/bin/env bash

HYPR_CONF="$HOME/.config/hypr/hyprland.conf"

# extract the keybinding from hyprland.conf
mapfile -t BINDINGS < <(grep -e '^bind =' -e '^bindm =' "$HYPR_CONF" | \
    sed -e 's/  */ /g' -e 's/bindm =//g' -e 's/bind =//g' -e 's/, /,/g' -e 's/ # /,/' -e 's/$mainMod//g' -e 's/SHIFT,COMMA/,?/g' -e 's/left//g' -e 's/right//g' -e 's/up//g' -e 's/down//g' \
    -e 's/ALT/ + ALT/g' -e 's/SHIFT/ + SHIFT/g' -e 's/CTRL/ + CTRL/g' -e 's/mouse:272/clic gauche/g' -e 's/mouse:273/clic droit/g' |\
    awk -F, -v q="'" '{cmd=""; for(i=3;i<NF;i++) cmd=cmd $(i) " ";print "<b>"$1 " + " $2 "</b>  <span color=" q "#f38ba8" q ">" $NF ",</span>"}')

echo $BINDINGS

CHOICE=$(printf '%s\n' "${BINDINGS[@]}" | wofi -dmenu -i -p "Hyprland Keybinds:")

# extract cmd from span <span color='gray'>cmd</span>
# CMD=$(echo "$CHOICE" | sed -n 's/.*<span color='\''gray'\''>\(.*\)<\/span>.*/\1/p')

# execute it if first word is exec else use hyprctl dispatch
# if [[ $CMD == exec* ]]; then
    # eval "$CMD3
# else
    # hyprctl dispatch "$CMD"
# fi
