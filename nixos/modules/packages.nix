{ inputs, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnsupportedSystem = true;
  environment.systemPackages = [

    pkgs.home-manager

#HYPRLAND / ENVIRONMENT TOOLS
    pkgs.bibata-cursors
    pkgs.pipewire
    pkgs.hyprpaper #home-manager/hyprland...

#Utils
    pkgs.kitty
    pkgs.fzf
    pkgs.zsh #user.nix --- programs.zsh options
    pkgs.gh
    pkgs.mullvad-vpn

#Apps
    pkgs.xsane
    pkgs._1password-gui
    pkgs.vscode
    pkgs.firefox
    pkgs.spotify
    pkgs.nautilus
    #pkgs.obsidian #removed in favor of anytype
    pkgs.libreoffice
    #pkgs.arc-browser #Mac/darwin only
    pkgs.anytype
    pkgs.stremio
    
#Gaming 
    pkgs.steam #user.nix --- programs.steam options
    pkgs.protonup-qt
    pkgs.prismlauncher
    pkgs.gamemode
    
  ];
}
