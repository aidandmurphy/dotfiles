#!/bin/bash

export PATH=$PATH:/run/current-system/sw/bin/
export PATH=$PATH:$HOME/.nix-profile/bin

udiskie &
sh ~/nix/home-manager/modules/hyprland/scripts/start.sh &
hyprctl setcursor Bibata-Modern-Classic 24
