{ inputs, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

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

#Apps
    inputs.zen-browser.packages.x86_64-linux.specific    
    
    pkgs.xsane
    pkgs._1password-gui
    pkgs.vscode
    pkgs.firefox
    pkgs.spotify
    pkgs.nautilus
    pkgs.obsidian
    pkgs.libreoffice

#Gaming 
    pkgs.steam #user.nix --- programs.steam options
    pkgs.protonup-qt


    
  ];
}
