{ inputs, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnsupportedSystem = true;
  environment.systemPackages = [
    inputs.astal.packages.x86_64-linux.default
    pkgs.ags
    pkgs.home-manager
    pkgs.polkit_gnome

#HYPRLAND / ENVIRONMENT TOOLS
    pkgs.bibata-cursors
    pkgs.pipewire
    pkgs.playerctl
    pkgs.hyprpaper #home-manager/hyprland...
    pkgs.brightnessctl
    pkgs.hyprpicker
    pkgs.wl-clipboard


#Utils
    pkgs.kitty
    pkgs.fzf
    pkgs.zsh #user.nix --- programs.zsh options
    pkgs.gh
    pkgs.mullvad-vpn
    pkgs.emacs

#Apps
    pkgs.xsane
    pkgs._1password
    pkgs._1password-gui
    pkgs.vscode
    pkgs.spotify
    pkgs.nautilus
    #pkgs.obsidian #removed in favor of anytype
    pkgs.libreoffice
    #pkgs.arc-browser #Mac/darwin only
    inputs.zen-browser.packages.x86_64-linux.default
    pkgs.anytype
    pkgs.stremio
    
#Gaming 
    pkgs.steam #user.nix --- programs.steam options
    pkgs.protonup-qt
    pkgs.prismlauncher
    pkgs.gamemode
    
  ];

  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = [ "aidan" ];
  };

}
