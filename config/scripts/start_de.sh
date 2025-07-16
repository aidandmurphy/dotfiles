# !/bin/bash 
# start_de.sh

# Launch apps
swww init
waybar 
swww-daemon
nm-applet & mate-polkit
wl-paste --type text --watch cliphist store
wl-paste --type image --watch cliphist store

swww img "/home/aidan/pictures/wallpapers/1.png"
hyprctl setcursor Bibata_Ghost 32
gsettings set org.gnome.desktop.interface cursor-theme Bibata_Ghost

kitty

