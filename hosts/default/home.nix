# home.nix
{ config, pkgs, inputs, ... }:

{

  imports = [
    inputs.ags.homeManagerModules.default
  ];

  # Managed paths
  home.username = "aidan";
  home.homeDirectory = "/home/aidan";

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

 # Local packages
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };

  home.packages = [
    # Basics
    pkgs.google-chrome
    pkgs.vscode
    pkgs.alacritty
    pkgs.nautilus
    pkgs.affine
    pkgs.btop
    pkgs.mullvad-vpn

    # Productivity 
    pkgs.spotify
    pkgs.obsidian
    pkgs._1password-gui
    pkgs.blender

    # Entertainment
    pkgs.steam
    pkgs.protonup-ng
    pkgs.gamescope
    pkgs.prismlauncher

    
  # Utils  @TODO Move to configuration.nix


  ];


  # Dotfile management
  home.file = {
    
  };

  home.sessionVariables = {
    EDITOR = "code";
    BROWSER = "google-chrome-stable";
  };

  # Hyprland 
  wayland.windowManager.hyprland = {
    enable = true;


    settings = {
      env = [
        # NVIDIA
        "GDM_BACKEND,nvidia-drm"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "LIBVA_DRIVER_NAME,nvidia"
       
        "XCURSOR_THEME,Bibata-Modern-Ice"
        "XCURSOR_SIZE,22"
        "HYPRCURSOR_THEME,Bibata-Modern-Ice"
        "HYPRCURSOR_SIZE,22" 


        # PLATFORMS
        "GDK_BACKEND,wayland,x11,*"
        "SDL_VIDEODRIVER,wayland"
        "CLUTTER_BACKEND,wayland"

        "QT_QPA_PLATFORM,wayland;xcb"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "QT_WAYLAND_DISABLE_WINDOW_DECORATION,1"
        "QT_QPA_PLATFORMTHEME,qt5ct"
        
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,wayland"

        "OGL_DEDICATED_HW_STATE_PER_CONTEXT=ENABLE_ROBUST"
 
      ];
      
      monitor = [
        "DP-2, 1920x1080@165, 0x0, 1"
        "HDMI-A-1, 3840x2160@60, 1920x0, 1"
      ];

      cursor = {
        no_hardware_cursors = true;
      };

      general = {
        gaps_in = 3;
        allow_tearing = true;
        gaps_out = 3;
        border_size = 5;
      };

      dwindle = {
        preserve_split = true;
      };

      exec-once = [
        "hyprcursor Bibata-Modern-Ice"
        "ags"
        "hyprpaper"
      ];

      windowrulev2 = [
        # GAMES get immediate windowclass
        "immediate,class:^(overwatch2)$"
      ];

      bind = [
        # System
        "SUPER,RETURN,exec,alacritty"
        "SUPER,Q, killactive,"
        "SUPER,R, exec, ags -t applauncher"

        # Window Manipulation
        "SUPER,SPACE,togglefloating,"
        "SUPER,I,layoutmsg,togglesplit"
        "SUPER,F,fullscreen,"
        "SUPER,TAB, cyclenext,"
        "SUPER,TAB, bringactivetotop,"
        # Workspaces
        "SUPER,1,workspace,1"
        "SUPER,2,workspace,2"
        "SUPER,3,workspace,3"
        "SUPER,4,workspace,4"
        "SUPER,5,workspace,5"
        "SUPER,6,workspace,6"
        "SUPER,7,workspace,7"
        "SUPER,8,workspace,8"
        "SUPER,9,workspace,9"
        "SUPER,0,workspace,10"

        "SUPER_SHIFT,1,movetoworkspace,1"
        "SUPER_SHIFT,2,movetoworkspace,2"
        "SUPER_SHIFT,3,movetoworkspace,3"
        "SUPER_SHIFT,4,movetoworkspace,4"
        "SUPER_SHIFT,5,movetoworkspace,5"
        "SUPER_SHIFT,6,movetoworkspace,6"
        "SUPER_SHIFT,7,movetoworkspace,7"
        "SUPER_SHIFT,8,movetoworkspace,8"
        "SUPER_SHIFT,9,movetoworkspace,9"
        "SUPER_SHIFT,0,movetoworkspace,10"

        # Media Control
        ",XF86AudioRaiseVolume,exec,wpctl set-volume -l 2.0 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume,exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"    
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioPlay, exec, playerctl play-pause" # the stupid key is called play , but it toggles 
        ",XF86AudioNext, exec, playerctl next"
        ",XF86AudioPrev, exec, playerctl previous"
      ];

      bindm = [
       "SUPER,mouse:272,movewindow"
       "SUPER,mouse:273,resizewindow"
      ];
    };
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "~/Pictures/Wallpapers/default.jpeg"
      ];
      wallpaper = [ ",~/Pictures/Wallpapers/default.jpeg" ];
    };
  };

  programs.ags = {
    enable = true;
  
    configDir = ../../modules/home-manager/ags;

    extraPackages = [
      pkgs.gtksourceview
      pkgs.webkitgtk
      pkgs.accountsservice
    ]; 
  };

  

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
