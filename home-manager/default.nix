{ inputs, pkgs, ... }:
{
  imports = [
    #inputs.ags.homeManagerModules.default 
    ./modules
  ];

  home = {
    username = "aidan";
    homeDirectory = "/home/aidan";
    stateVersion = "23.11";
  };

  programs.home-manager.enable = true;
}
