{ inputs, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./modules
  ];
}
