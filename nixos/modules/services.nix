{ pkgs, ... }:
{
  services = {
    gvfs.enable = true;
    udisks2.enable = true;
    xserver = {
      enable = true;
      xkb.layout = "us";
      xkb.variant = "";
      excludePackages = [ pkgs.xterm ];
    };
    hardware.openrgb.enable = true;
    displayManager = {
        #defaultSession = "hyprland";
    };
    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
          user = "greeter";
        };
      };
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    # ACTION=="add", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c547", ATTR{power/wakeup}="disabled"
    udev = {
      packages = [
        pkgs.ddcutil
      ];
      extraRules = ''
        KERNEL=="i2c-[0-9]*", GROUP="i2c", MODE="0660"
      '';
    };
    dbus.enable = true;
    printing = {
      enable = true;
      drivers = [ pkgs.hplip ];
    };
  };
}
