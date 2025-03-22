{ inputs, pkgs, ... }:
{
  imports = [
    #inputs.ags.homeManagerModules.default 
    ./modules
  ];

  home = {
    username = "aidan";
    homeDirectory = "/home/aidan";
    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;
}
