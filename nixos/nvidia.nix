{ config, pkgs, ...}:
{

  hardware = {

    graphics.enable = true;

    nvidia = {
      modesetting.enable = true;
      powerManagement.finegrained = false;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.beta;
    };
  };

  services.xserver.videoDrivers = [ "nvidia" ];

}