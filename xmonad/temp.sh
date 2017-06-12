#!/bin/sh

# https://github.com/gmaslov/dotfiles/blob/master/bin/xmobar-temperature-status-line

cpu=$(sensors -u nct6779-isa-0290 | awk '/temp2_input:/{printf "%.0f", $2}')
echo "${cpu}°C"
