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
    #printers.ensurePrinters = [
     # {
        #name = "DeskJet_2700";
        #location = "Home Printer";
        #deviceUri = "usb://HP/DeskJet%202700%20series?serial=CN1576A1K6&interface=1";
        #model = "HP/hp-deskjet_2700_series.ppd.gz";
        #ppdOptions.PageSize = "A4";
      #}
    #];
  };

  documentation.nixos.enable = false;
  users.users.aidan = {
    isNormalUser = true;
    description = "aidan";
    extraGroups = [
      "networkmanager"
      "wheel"
      "i2c"
      "lp"
    ];
    shell = pkgs.zsh;
  };
}
