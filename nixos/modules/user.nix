{ config, pkgs, ... }:
{
  programs = {
    zsh.enable = true;
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };


  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  hardware = {
    i2c.enable = true;
    sane.enable = true;
  };

  documentation.nixos.enable = false;
  users.users.aidan = {
    isNormalUser = true;
    description = "aidan";
    extraGroups = [
      "networkmanager"
      "wheel"
      "scanner"
      "i2c"
      "lp"
    ];
    shell = pkgs.zsh;
  };
}
