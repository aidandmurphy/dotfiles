{
  wayland.windowManager.hyprland.settings.exec-once = [
    "polkit-agent-helper-1"
    "systemctl start --user polkit-gnome-authentication-agent-1" 
    "/run/current-system/sw/bin/sh ~/nix/home-manager/modules/hyprland/scripts/exec_once.sh"
    "ags run"
    "[workspace 1 silent] kitty"
  ];
}
