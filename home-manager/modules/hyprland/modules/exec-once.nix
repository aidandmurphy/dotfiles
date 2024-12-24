{
  wayland.windowManager.hyprland.settings.exec-once = [
    "/run/current-system/sw/bin/sh ~/nix/home-manager/modules/hyprland/scripts/exec_once.sh"
    "ags run"
    "[workspace 1 silent] kitty"
  ];
}
