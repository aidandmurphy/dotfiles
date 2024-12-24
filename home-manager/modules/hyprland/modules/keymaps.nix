{
  wayland.windowManager.hyprland.settings = {
    bind = [

      "SUPER, Return, exec, kitty"

      "SUPER, Q, killactive"
      "SUPER, Space, togglefloating"
      "SUPER, P, pseudo"
      "SUPER, F, fullscreen"

      "SUPER, R, exec, ags toggle launcher -i launcher"

      "SUPER, H, movefocus, l"
      "SUPER, L, movefocus, r"
      "SUPER, K, movefocus, u"
      "SUPER, J, movefocus, d"

      "SUPER, J, togglesplit"

      "SUPER, 1, workspace, 1"
      "SUPER, 2, workspace, 2"
      "SUPER, 3, workspace, 3"
      "SUPER, 4, workspace, 4"
      "SUPER, 5, workspace, 5"

      "SUPER, TAB, workspace, previous"

      "SUPER SHIFT, 1, movetoworkspace, 1"
      "SUPER SHIFT, 2, movetoworkspace, 2"
      "SUPER SHIFT, 3, movetoworkspace, 3"
      "SUPER SHIFT, 4, movetoworkspace, 4"
      "SUPER SHIFT, 5, movetoworkspace, 5"

      "SUPER SHIFT, Escape, exec, hyprctl dispatch exit"

      "SUPER SHIFT, S, exec, /run/current-system/sw/bin/sh /home/aidan/Configuration/home-manager/modules/hyprland/scripts/screenshot.sh"
      "SUPER SHIFT, C, exec, /run/current-system/sw/bin/sh /home/aidan/Configuration/home-manager/modules/hyprland/scripts/color_picker.sh"
    ];

    binde = [
      "SUPER ALT, H, resizeactive, -10 0"
      "SUPER ALT, L, resizeactive, 10 0"
      "SUPER ALT, K, resizeactive, 0 -10"
      "SUPER ALT, J, resizeactive, 0 10"
    ];

    bindm = [
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
    ];
  };
}
