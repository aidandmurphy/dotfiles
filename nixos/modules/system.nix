{ pkgs, ... }:
{
  environment = {
    sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      NIXOS_OZONE_WL = "1";
    };
  };

  networking = {
    dhcpcd.enable = true;
    hostName = "nixos";
    networkmanager.enable = true;
    firewall.enable = true;
  };

  powerManagement = {
    enable = true;
    cpuFreqGovernor = "performance";
  };

  security.rtkit.enable = true;
  system.stateVersion = "24.05";
}
