#!/bin/bash

# Change the wallpaper every 5 minutes

cd $HOME/nix/home-manager/wallpapers/

while :
do
    file="$(ls *.jpg *.png | sort -R | tail -1)"
    swww img "$file" -t=wipe --transition-angle 15
    sleep 300;
done
