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
      
      
      ",XF86AudioNext, exec ,playerctl position 5+"
      ",XF86AudioPrev, exec ,playerctl position 5-"
      ",XF86AudioMute, exec ,wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
    ];

    binde = [
      "SUPER ALT, H, resizeactive, -10 0"
      "SUPER ALT, L, resizeactive, 10 0"
      "SUPER ALT, K, resizeactive, 0 -10"
      "SUPER ALT, J, resizeactive, 0 10"

      ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.75 @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume, exec, wpctl set-volume -l 0.0 @DEFAULT_AUDIO_SINK@ 5%-"
      ",XF86AudioPlay, exec, playerctl play-pause"

    ];

    bindm = [
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
    ];


    bindo = [
      ",XF86AudioNext, exec ,playerctl next"
      ",XF86AudioPrev, exec ,playerctl previous"
    ];
  };
}
